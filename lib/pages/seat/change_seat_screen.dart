import 'dart:async';

import 'package:asc_portfolio/controller/chage_seat_controller.dart';
import 'package:asc_portfolio/pages/main_screen.dart';
import 'package:asc_portfolio/provider/admin_state/seat_state_notifier.dart';
import 'package:asc_portfolio/server/repository/seat_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../server/api/api.dart';
import '../../style/app_color.dart';

class ChangeSeatScreen extends ConsumerStatefulWidget {
  const ChangeSeatScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ChangeSeatScreen> createState() => _ChangeSeatScreenState();
}

class _ChangeSeatScreenState extends ConsumerState<ChangeSeatScreen> {
  final ChangeSeatController _changeSeatController = const ChangeSeatController();

  int selectedSeatNumber = 0;
  double _progress = 0;
  bool isNotCompleteLoading = true;

  Future<void> startTimer() async {
    Timer.periodic(
      const Duration(milliseconds: 50),
      (Timer timer) => setState(
        () {
          if (_progress == 0.05) {
            setState(() {
              isNotCompleteLoading = false;
            });
            timer.cancel();
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MainScreen()),
            ).then((value) {
              setState(() {
                didChangeDependencies();
              });
            });
          } else {
            _progress += 0.025;
          }
        },
      ),
    );
  }

  void _roomFetchGet() async {
    ref.read(seatStateProvider.notifier).getAllRoomStateReq();
  }

  void _postStartReservation(int seatNumber) async {
    String responseData = await ref.watch(seatRepoProvider).postSeatReservationStart(seatNumber);
    print('SeatScreenResponseData=$responseData');
  }

  @override
  void initState() {
    _roomFetchGet();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List seatList = [];
    for (int i = 0; i < _changeSeatController.seatDatas.length; i++) {
      seatList.add(_changeSeatController.seatDatas[i].toJson());
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.appPurple,
        title: const Text('좌석 이동'),
        centerTitle: true,
        shadowColor: Colors.white,
        elevation: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(10),
              child: FloatingActionButton.extended(
                heroTag: 'Text2',
                label: Text(
                  Api.cafeName,
                  style: const TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.w200,
                  ),
                ), // <-- Text
                backgroundColor: AppColor.appPurple,
                onPressed: () {},
              ),
            ),
            // Card(
            //   color: AppColor.appPurple,
            //   margin: const EdgeInsets.all(15),
            //   child: Container(
            //     padding: const EdgeInsets.all(20),
            //     width: 30,
            //     height: 60,
            //     child: TimerBuilder.periodic(
            //       const Duration(seconds: 1),
            //       builder: (context) {
            //         return Text(
            //           '현재시간 : ${DateFormat('yyyy년 MM월 dd일 h시 mm분 ss초 a').format(DateTime.now().add(const Duration(hours: 9)))}',
            //           style: const TextStyle(
            //             fontWeight: FontWeight.w300,
            //             fontSize: 16,
            //             color: Colors.white,
            //           ),
            //         );
            //       },
            //     ),
            //   ),
            // ),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              width: 500,
              child: Divider(color: Colors.black, thickness: 2.0),
            ),
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
            FloatingActionButton.extended(
              heroTag: 'Area1',
              label: const Text('좌석번호'), // <-- Text
              backgroundColor: AppColor.appPurple,
              onPressed: () {
                //server.getAllRoomStateReq(context);
                print(seatList);
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
              itemCount: _changeSeatController.seatDatas.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    if (_changeSeatController.seatDatas[index].seatState.length == 10) {
                      setState(() {
                        selectedSeatNumber = index + 1;
                      });
                      showDialog(
                        context: context,
                        builder: _buildPopupDialog,
                      );
                      print(selectedSeatNumber);
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
                      color: ref.watch(seatStateProvider.notifier).getRoomState(index)
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
                            '${ref.watch(seatStateProvider).seatDatas[index].seatNumber + 1}',
                            style: TextStyle(
                              color: ref.watch(seatStateProvider.notifier).getRoomState(index)
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
            const SizedBox(height: 120),
          ],
        ),
      ),
    );
  }

  Widget _buildPopupDialog(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColor.appPurple,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          Text(
            '해당 좌석으로 이동하시겠습니까?',
            style: TextStyle(fontWeight: FontWeight.w300, fontSize: 16, color: Colors.white),
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
                style:
                    const TextStyle(fontWeight: FontWeight.w300, fontSize: 16, color: Colors.white),
              ),
            ],
          ),
        ],
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () async {
            ref.watch(seatRepoProvider).postSeatReservationStart(selectedSeatNumber - 1);
            startTimer();
          },
          child: const Text(
            'Yes',
            style: TextStyle(fontWeight: FontWeight.w300, fontSize: 16, color: Colors.white),
          ),
        ),
      ],
    );
  }

  Widget _buildPopupDialogChange(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColor.appPurple,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          Text(
            '좌석이동이 완료되었습니다.',
            style: TextStyle(fontWeight: FontWeight.w300, fontSize: 16, color: Colors.white),
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
                '이동한 좌석번호 : $selectedSeatNumber번',
                style:
                    const TextStyle(fontWeight: FontWeight.w300, fontSize: 16, color: Colors.white),
              ),
            ],
          ),
        ],
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () async {
            Navigator.pop(context);
          },
          child: const Text(
            'OK',
            style: TextStyle(fontWeight: FontWeight.w300, fontSize: 16, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
