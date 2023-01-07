import 'dart:async';

import 'package:asc_portfolio/provider/admin_state/admin_state_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../controller/admin_controller.dart';
import '../../style/app_color.dart';

class AdminSeatManageScreen extends ConsumerStatefulWidget {
  const AdminSeatManageScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<AdminSeatManageScreen> createState() => _AdminSeatManageScreenState();
}

class _AdminSeatManageScreenState extends ConsumerState<AdminSeatManageScreen> {
  int selectedSeatNumber = 0;
  bool isNotCompleteLoading = true;

  Future<void> startTimer(AdminStateNotifier adminStateNotifier) async {
    Timer.periodic(
      const Duration(milliseconds: 50),
      (Timer timer) => setState(
        () {
          if (adminStateNotifier.progress == 0.05) {
            setState(() {
              isNotCompleteLoading = false;
            });
            timer.cancel();
            context.go('/admin');
          } else {
            adminStateNotifier.progress += 0.025;
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final AdminController adminController = ref.watch(adminStateNotifierProvider);
    final AdminStateNotifier adminControllerNotifier =
        ref.watch(adminStateNotifierProvider.notifier);

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListView(
        children: <Widget>[
          const SizedBox(height: 20),
          Row(
            children: [
              FloatingActionButton.extended(
                heroTag: 'entrance2',
                label: const Text('좌석 강제 종료'), // <-- Text
                backgroundColor: AppColor.appPurple,
                onPressed: () {},
              ),
            ],
          ),
          const SizedBox(height: 70),
          FloatingActionButton.extended(
            heroTag: 'Area1',
            label: const Text('좌석번호'), // <-- Text
            backgroundColor: AppColor.appPurple,
            onPressed: () {
              //server.getAllRoomStateReq(context);
              // print(seatList);
            },
          ),
          const SizedBox(height: 20),
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
            itemCount: adminController.seatDatas.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  if (adminController.seatDatas[index].seatState.length == 8) {
                    setState(() {
                      selectedSeatNumber = index + 1;
                    });
                    print(selectedSeatNumber);
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        backgroundColor: AppColor.appPurple,
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: const [
                            Text(
                              '해당 좌석을 강제 종료 시킵니다.',
                              style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  '선택한 좌석번호 : $selectedSeatNumber번',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () async {
                              // _fetchAdminCancelSeat(selectedSeatNumber - 1);

                              adminControllerNotifier.fetchAdminCancelSeat(selectedSeatNumber - 1);
                              startTimer(adminControllerNotifier);
                            },
                            child: const Text(
                              '확인',
                              style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
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
                    color: adminControllerNotifier.getRoomState(index)
                        ? AppColor.appPurple
                        : Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          '${adminController.seatDatas[index].seatNumber + 1}',
                          style: TextStyle(
                            color: adminControllerNotifier.getRoomState(index)
                                ? Colors.white
                                : AppColor.appPurple,
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
          const SizedBox(height: 100),
        ],
      ),
    );
  }
}
