import 'package:asc_portfolio/provider/home_state/home_state_notifier.dart';
import 'package:asc_portfolio/style/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRCodeScreen extends ConsumerWidget {
  const QRCodeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.timer,
                          color: Colors.white,
                          size: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            '남은 시간: ${DateFormat('hh시간 mm분').format(DateTime.now())}',
                            style: const TextStyle(
                              fontWeight: FontWeight.w300,
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
