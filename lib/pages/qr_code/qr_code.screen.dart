import 'package:asc_portfolio/provider/seat_state/seat_state.dart';
import 'package:asc_portfolio/provider/timer_state/timer_state.dart';
import 'package:asc_portfolio/style/app_color.dart';
import 'package:custom_timer/custom_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

import '../../common/base_scaffold.dart';
import '../../main.dart';
import '../../provider/local_notification_provider.dart';
import '../../provider/login_state/login_state.dart';

class QRCodeScreen extends ConsumerStatefulWidget {
  const QRCodeScreen({super.key});

  @override
  ConsumerState<QRCodeScreen> createState() => _QRCodeScreenState();
}

class _QRCodeScreenState extends ConsumerState<QRCodeScreen> {
  // state들
  Duration timeLeft = const Duration();
  CustomTimerController timerController = CustomTimerController();

  // Notification 관련 변수들
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

  // 남은 시간 구하는 함수
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

  // 이용권 시간이 다 되었을때
  void sendTimeOutNotification(Duration startTime) async {
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
  }

  void send10MinleftNotification(Duration startTime) async {
    tz.initializeTimeZones();
    tz.setLocalLocation(tz.getLocation('Asia/Seoul'));

    final now = tz.TZDateTime.now(tz.local);
    final scheduledDate =
        tz.TZDateTime.now(tz.local).add(startTime).subtract(const Duration(minutes: 10));

    logger.i('now: $now \nscheduledDate: $scheduledDate');

    await notificationsPlugin.zonedSchedule(
      1,
      'Aladin',
      '이용권이 10분 남았어요!',
      scheduledDate,
      notificationDetails,
      uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
      androidAllowWhileIdle: true,
    );
  }

  // 유저가 이용중지를 누르면 모든 알림을 취소
  void cancelNotification() {
    // cancel notification
    notificationsPlugin.cancel(0);
    notificationsPlugin.cancel(1);
  }

  @override
  void initState() {
    notificationDetails = NotificationDetails(android: androidNotification, iOS: iosNotification);
    notificationsPlugin = ref.read(notificationProvider);
    ref.read(checkUserLoginProvider);
    super.initState();
  }

  @override
  void dispose() {
    timerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Duration startTime = ref.watch(timerStateNotifierProvider).startTime;
    // time가 변경될때 남을 시간을 업데이트
    timerController.addListener(() {
      if (timerController.state == CustomTimerState.counting ||
          timerController.state == CustomTimerState.paused) {
        ref.read(timerStateNotifierProvider.notifier).updateTimeLeft(timeLeft);
      } else if (timerController.state == CustomTimerState.finished) {
        // 이용권 시간이 다 되었을때 서버로 요청을 보냄
      }
    });
    logger.i(startTime);

    final seatState = ref.watch(seatStateNotifierProvider);
    final LoginState loginState = ref.watch(loginStateProvider);

    logger.i(startTime);

    return BaseScaffold(
      appBar: AppBar(
        elevation: 0,
        title: Row(
          children: [
            const SizedBox(
              width: 25,
            ),
            Text(
              '${loginState.qrCode!.name}님의 QR코드',
            ),
          ],
        ),
        titleTextStyle: const TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      backgroundColor: AppColor.appPurple,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  width: 300,
                  height: 300,
                  child: QrImage(
                    data: loginState.qrCode!.qrCode,
                    version: QrVersions.auto,
                    backgroundColor: Colors.white,
                  ),
                ),
                const Text(
                  '주의 ! QR코드를 타인에게 노출하지마세요.',
                  style:
                      TextStyle(fontWeight: FontWeight.w300, color: Colors.redAccent, fontSize: 20),
                ),
                const SizedBox(
                  height: 20,
                ),
                seatState.seatReservationSeatNumber != 0
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
                                '${seatState.seatReservationSeatNumber}',
                                style: const TextStyle(fontSize: 30, color: Colors.white),
                              ),
                            ),
                          )
                        ],
                      )
                    : Text(
                        '좌석이 없습니다',
                        style: Theme.of(context)
                            .primaryTextTheme
                            .headlineSmall!
                            .copyWith(color: Colors.white, fontWeight: FontWeight.w600),
                      ),
                const SizedBox(
                  height: 30,
                ),
                if (seatState.seatReservationSeatNumber == 0)
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
                              controller: timerController,
                              stateBuilder: (timer, state) {
                                if (state == CustomTimerState.finished) {
                                  return const Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 10),
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
                    timerController.start();
                    if (startTime > const Duration(minutes: 10)) {
                      send10MinleftNotification(startTime);
                    }
                    sendTimeOutNotification(startTime);
                  },
                  child: const Text('Start timer'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // timer.reset();
                    timerController.pause();
                    cancelNotification();
                    logger.w(timeLeft);
                  },
                  child: const Text('pause Timer'),
                ),
                const SizedBox(
                  height: 100,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
