import 'package:asc_portfolio/main.dart';
import 'package:asc_portfolio/provider/home_state/home_state_notifier.dart';
import 'package:asc_portfolio/style/app_color.dart';
import 'package:custom_timer/custom_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

import '../../provider/local_notification_provider.dart';

class QRCodeScreen extends ConsumerStatefulWidget {
  const QRCodeScreen({super.key});

  @override
  ConsumerState<QRCodeScreen> createState() => _QRCodeScreenState();
}

class _QRCodeScreenState extends ConsumerState<QRCodeScreen> {
  Duration startTime = const Duration(seconds: 10);
  Duration timeLeft = const Duration();
  final CustomTimerController timercontroller = CustomTimerController();
  final iosNotification = const DarwinNotificationDetails();
  late NotificationDetails notificationDetails;
  late FlutterLocalNotificationsPlugin notificationsPlugin;

  final androidNotification = const AndroidNotificationDetails(
    'id',
    '남은 시간을 모두 소진했어요!',
    channelDescription: '남은 시간을 모두 소진했어요!',
    importance: Importance.max,
    priority: Priority.high,
    ticker: 'ticker',
  );

  String getRemainingTime(CustomTimerRemainingTime time) {
    Duration remainingTime = Duration(
      hours: int.parse(time.hours),
      minutes: int.parse(time.minutes),
      seconds: int.parse(time.seconds),
    );
    String remainingTimeStr = '';
    if (remainingTime.inHours > 0 && remainingTime.inMinutes > 0 && remainingTime.inSeconds > 0) {
      remainingTimeStr =
          '${remainingTime.inHours}시간 ${remainingTime.inMinutes % 60}분 ${remainingTime.inSeconds % 60}초 ';
    } else if (remainingTime.inMinutes > 0 && remainingTime.inSeconds > 0) {
      remainingTimeStr = '${remainingTime.inMinutes % 60}분 ${remainingTime.inSeconds % 60}초 ';
    } else if (remainingTime.inSeconds > 0) {
      remainingTimeStr = '${remainingTime.inSeconds % 60}초 ';
    } else {
      remainingTimeStr = '0초';
    }

    timeLeft = remainingTime;
    return remainingTimeStr;
  }

  void schedulNotification() async {
    // set timezone
    tz.initializeTimeZones();
    tz.setLocalLocation(tz.getLocation('Asia/Seoul'));

    final now = tz.TZDateTime.now(tz.local);
    final scheduledDate = tz.TZDateTime.now(tz.local).add(startTime);

    logger.i('now: $now \nscheduledDate: $scheduledDate');

    await notificationsPlugin.zonedSchedule(
      0,
      'Aladin',
      '남은 시간을 모두 소진했어요!',
      scheduledDate,
      notificationDetails,
      uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
      androidAllowWhileIdle: true,
    );
    // notificationsPlugin.show(
    //   0,
    //   'Aladin',
    //   '남은 시간을 모두 소진했어요!',
    //   notificationDetails,
    // );
  }

  @override
  void initState() {
    notificationDetails = NotificationDetails(android: androidNotification, iOS: iosNotification);
    notificationsPlugin = ref.read(notificationProvider);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    logger.i(startTime);
    final homeController = ref.watch(homeStateProvider);

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                '${homeController.userName}님의 QR코드',
                style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                width: 300,
                height: 300,
                child: QrImage(
                  data: homeController.qrCode,
                  version: QrVersions.auto,
                  backgroundColor: Colors.white,
                ),
              ),
              const Text(
                '주의 ! QR코드를 타인에게 노출하지마세요.',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.redAccent, fontSize: 20),
              ),
              const SizedBox(
                height: 20,
              ),
              homeController.seatReservationSeatNumber != 0
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '내 좌석번호: ',
                          style: Theme.of(context)
                              .primaryTextTheme
                              .headlineSmall!
                              .copyWith(color: Colors.black, fontWeight: FontWeight.w600),
                        ),
                        Container(
                          width: 60,
                          height: 60,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: AppColor.appPurple,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: AppColor.appPurple, width: 3),
                          ),
                          child: Center(
                            child: Text(
                              '${homeController.seatReservationSeatNumber}',
                              style: const TextStyle(fontSize: 30, color: Colors.white),
                            ),
                          ),
                        )
                      ],
                    )
                  : Text(
                      '좌석이 없습니다.',
                      style: Theme.of(context)
                          .primaryTextTheme
                          .headlineSmall!
                          .copyWith(color: Colors.black, fontWeight: FontWeight.w600),
                    ),
              const SizedBox(
                height: 30,
              ),
              if (homeController.seatReservationSeatNumber == 0)
                Card(
                  elevation: 5,
                  color: AppColor.appPurple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: SizedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.timer,
                            color: Colors.white,
                            size: 30,
                          ),
                          CustomTimer(
                            begin: startTime,
                            end: const Duration(),
                            controller: timercontroller,
                            stateBuilder: (timer, state) {
                              if (state == CustomTimerState.finished) {
                                return const Center(
                                  child: Text(
                                    '남은 시간을 모두 소진하였습니다.',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                );
                              }
                              return null;
                            },
                            builder: (time) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: Text(
                                  getRemainingTime(time),
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 30,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ElevatedButton(
                onPressed: () {
                  // timer.start();
                  timercontroller.start();
                  schedulNotification();
                },
                child: const Text('Start timer'),
              ),
              ElevatedButton(
                onPressed: () {
                  // timer.reset();
                  timercontroller.reset();

                  logger.w(timeLeft);
                },
                child: const Text('reset Timer'),
              ),
              const SizedBox(
                height: 100,
              )
            ],
          ),
        ),
      ),
    );
  }
}
