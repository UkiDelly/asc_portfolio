import 'package:asc_portfolio/pages/home/widgets/current_time_widget.dart';
import 'package:asc_portfolio/provider/home_state/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/base_scaffold.dart';
import '../../constant/assets.dart';
import '../../provider/home_state/home_state_notifier.dart';
import '../../server/api/api.dart';
import '../../style/app_color.dart';
import '../seat/specific_seat_screen.dart';

class SeatScreen extends ConsumerWidget {
  const SeatScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeController = ref.watch(homeStateProvider);
    final isLogined = ref.watch(loginStateProvider).loginCheck;
    final ticket = ref.watch(loginStateProvider).ticket?.isValidTicket;
    final selectedSeatNumber = ref.watch(homeStateProvider.notifier).selectedIndex;

    return BaseScaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Api.cafeName == '서울지점'
                ? Image.asset(
                    AppAssets.cafeImage1,
                  )
                : const Text(''),
            // Card(
            //   shape: RoundedRectangleBorder(
            //     borderRadius: BorderRadius.circular(30),
            //   ),
            //   color: AppColor.appPurple,
            //   child: SizedBox(
            //     width: double.infinity,
            //     child: Image.asset(
            //       AppAssets.splashLogo,
            //       width: 200,
            //       height: 200,
            //     ),
            //   ),
            // ),
            // Container(
            //   padding: const EdgeInsets.all(10),
            //   child: FloatingActionButton.extended(
            //     isExtended: true,
            //     heroTag: 'Text2',
            //     label: Text(
            //       Api.cafeName,
            //       style: const TextStyle(
            //         fontSize: 27,
            //         color: Colors.white,
            //         fontWeight: FontWeight.w200,
            //       ),
            //     ), // <-- Text
            //     backgroundColor: AppColor.appPurple,
            //     onPressed: () {},
            //   ),
            // ),
            // Container(
            //   padding: const EdgeInsets.all(20),
            //   child: FloatingActionButton.extended(
            //     heroTag: 'Text4',
            //     label: const Text(
            //       '관리자페이지 테스트',
            //       style: TextStyle(fontSize: 13, color: Colors.white, fontWeight: FontWeight.w300),
            //     ), // <-- Text
            //     backgroundColor: AppColor.appPurple,
            //     onPressed: () {
            //       Navigator.push(
            //         context,
            //         MaterialPageRoute(builder: (context) => const AdminMainPage()),
            //       );
            //     },
            //   ),
            // ),
            // Container(
            //   padding: const EdgeInsets.all(20),
            //   child: FloatingActionButton.extended(
            //     heroTag: 'Text5',
            //     label: const Text(
            //       '결제 테스트',
            //       style: TextStyle(fontSize: 13, color: Colors.white, fontWeight: FontWeight.w300),
            //     ), // <-- Text
            //     backgroundColor: AppColor.appPurple,
            //     onPressed: () {
            //       Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //           builder: (context) => const InAppPaymentSecond(
            //             product: Product.fiftyHourPartTimeTicket,
            //           ),
            //         ),
            //       );
            //     },
            //   ),
            // ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.all(15),
              child: FloatingActionButton.extended(
                heroTag: 'Text',
                label: const Text(
                  '좌석 선택후 시간을 선택해주세요.',
                  style: TextStyle(fontSize: 13, color: Colors.white, fontWeight: FontWeight.w300),
                ), // <-- Text
                backgroundColor: AppColor.appPurple,
                onPressed: () {},
              ),
            ),
            const CurrentTime(),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(width: 500, child: Divider(color: Colors.black, thickness: 2.0)),
            const SizedBox(height: 20),
            Row(
              children: [
                FloatingActionButton.extended(
                  heroTag: 'entrance2',
                  label: Text(Api.cafeName), // <-- Text
                  backgroundColor: AppColor.appPurple,
                  onPressed: () {},
                ),
              ],
            ),
            const SizedBox(height: 70),
            Card(
              color: Colors.grey,
              child: Row(
                children: [
                  FloatingActionButton.small(
                    heroTag: 'colorSelect',
                    backgroundColor: Colors.white,
                    onPressed: () {},
                  ),
                  const Text(' : 사용가능'),
                  FloatingActionButton.small(
                    heroTag: 'colorSelect2',
                    backgroundColor: AppColor.appPurple,
                    onPressed: () {},
                  ),
                  const Text(' : 사용불가능'),
                ],
              ),
            ),
            const SizedBox(height: 40),
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 6.0,
                mainAxisSpacing: 10.0,
              ),
              itemCount: homeController.seatDatas.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    print('pressed');
                    if (isLogined == true &&
                        // UNRESERVED && VALID일때
                        homeController.seatDatas[index].seatState.length == 10 &&
                        ticket == 'VALID') {
                      ref.read(homeStateProvider.notifier).setSelectedIndex = index + 1;

                      // Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SpecificSeatPage(selectedSeatNumber),
                        ),
                      );
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        style: BorderStyle.solid,
                        width: 3,
                      ),
                      borderRadius: BorderRadius.circular(15),
                      color: homeController.seatDatas[index].seatState == 'UNRESERVED'
                          ? Colors.white
                          : AppColor.appPurple,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            '${homeController.seatDatas[index].seatNumber + 1}',
                            style: TextStyle(
                              color: homeController.seatDatas[index].seatState == 'UNRESERVED'
                                  ? AppColor.appPurple
                                  : Colors.white,
                              fontSize: 35,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 130),
          ],
        ),
      ),
    );
  }
}
