import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../constant/assets.dart';
import '../../provider/home_state/home_state_notifier.dart';
import '../../server/api/api.dart';
import '../../style/app_color.dart';

class MyTicketScreen extends ConsumerWidget {
  const MyTicketScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeController = ref.watch(homeStateProvider);
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton.extended(
            heroTag: 'Pass3',
            icon: const Icon(Icons.credit_card_outlined),
            label: const Text(
              '내 이용권정보',
              style: TextStyle(fontWeight: FontWeight.w300, color: Colors.white, fontSize: 16),
            ), // <-- Text
            backgroundColor: AppColor.appPurple,
            onPressed: () {},
          ),
          const SizedBox(height: 10),
          FloatingActionButton.extended(
            heroTag: 'Pass2',
            label: Text(
              Api.cafeName,
              style:
                  const TextStyle(fontWeight: FontWeight.w300, color: Colors.white, fontSize: 16),
            ), // <-- Text
            backgroundColor: AppColor.appPurple,
            onPressed: () {},
          ),
          Image.asset(
            AppAssets.logoPass,
            width: 400,
            height: 400,
          ),
          const SizedBox(height: 10),
          FloatingActionButton.extended(
            heroTag: 'Pass',
            icon: const Icon(Icons.timelapse_rounded),
            label: homeController.period == 0
                ? const Text('이용권이 없습니다')
                : const Text(
                    '티켓남은기간:  ',
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ), // <-- Text
            backgroundColor: AppColor.appPurple,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
