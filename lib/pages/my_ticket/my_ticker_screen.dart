import 'package:asc_portfolio/model/user_ticket_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../constant/assets.dart';
import '../../provider/login_state/login_state.dart';
import '../../server/api/api.dart';
import '../../style/app_color.dart';

class MyTicketScreen extends ConsumerWidget {
  const MyTicketScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final homeController = ref.watch(homeStateProvider);
    ref.read(checkUserLoginProvider);
    final UserTicketModel? ticket = ref.watch(loginStateProvider).ticket;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            SizedBox(
              width: 10,
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Card(
          elevation: 5,
          color: AppColor.appPurple,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.7,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const SizedBox(
                      width: 55,
                    ),
                    const Icon(
                      Icons.location_on,
                      color: Colors.white,
                      size: 20,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Text.rich(
                      TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: Api.cafeName,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        // FloatingActionButton.extended(
        //   heroTag: 'Pass3',
        //   icon: const Icon(Icons.credit_card_outlined),
        //   label: const Text(
        //     '??? ???????????????',
        //     style: TextStyle(fontWeight: FontWeight.w300, color: Colors.white, fontSize: 16),
        //   ), // <-- Text
        //   backgroundColor: AppColor.appPurple,
        //   onPressed: () {},
        // ),
        Image.asset(
          AppAssets.logoPass,
          width: 350,
          height: 350,
        ),
        FloatingActionButton.extended(
          heroTag: 'Pass',
          icon: const Icon(Icons.timelapse_rounded),
          label: ticket == null
              ? const Text('???????????? ????????????')
              : Text(
                  '??????????????????: ${ticket.period}',
                  style: const TextStyle(
                    fontWeight: FontWeight.w300,
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ), // <-- Text
          backgroundColor: AppColor.appPurple,
          onPressed: () {},
        ),
        const SizedBox(
          height: 80,
        ),
      ],
    );
  }
}
