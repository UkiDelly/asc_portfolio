import 'dart:async';

import 'package:asc_portfolio/provider/seat_state/seat_state.dart';
import 'package:asc_portfolio/server/repository/seat_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/base_scaffold.dart';
import '../../main.dart';
import '../../style/app_color.dart';
import '../main_screen.dart';

class SpecificSeatPage extends ConsumerStatefulWidget {
  int selectedSeatNumber;
  int selectedHour = 0;
  SpecificSeatPage(this.selectedSeatNumber);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SpecificSeatPageState();
}

class _SpecificSeatPageState extends ConsumerState<SpecificSeatPage> {
  late int selectedSeatNumber = widget.selectedSeatNumber;
  int selectedHour = 0;
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

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: AppBar(
        backgroundColor: AppColor.appPurple,
        title: const Text(
          '시간 선택',
          style: TextStyle(fontWeight: FontWeight.w300, color: Colors.white, fontSize: 20),
        ),
        shadowColor: Colors.white,
        elevation: 1,
      ),
      body: ListView(
        children: [
          ListTile(
            selectedColor: Colors.grey,
            leading: const Icon(
              Icons.looks_two_rounded,
              size: 40,
              color: Colors.black,
            ),
            title: const Text('1시간'),
            subtitle: const Text('1,000원 , 자유이용권은 무료'),
            trailing: const Icon(Icons.chevron_right, color: Colors.black),
            onTap: () {
              selectedHour = 1;
              logger.i('선택한시간=$selectedHour');
              showDialog(
                context: context,
                builder: (BuildContext context) => _buildPopupDialog(context),
              );
            },
          ),
          ListTile(
            selectedColor: Colors.grey,
            leading: const Icon(
              Icons.looks_two_rounded,
              size: 40,
              color: Colors.black,
            ),
            title: const Text('2시간'),
            subtitle: const Text('2,000원 , 자유이용권은 무료'),
            trailing: const Icon(Icons.chevron_right, color: Colors.black),
            onTap: () {
              selectedHour = 2;
              logger.i('선택한시간=$selectedHour');
              showDialog(
                context: context,
                builder: (BuildContext context) => _buildPopupDialog(context),
              );
            },
          ),
          const Divider(
            color: Colors.grey,
          ),
          ListTile(
            selectedColor: Colors.grey,
            leading: const Icon(
              Icons.looks_4_rounded,
              size: 40,
              color: Colors.black,
            ),
            title: const Text('4시간'),
            subtitle: const Text('4,000원 , 자유이용권은 무료'),
            trailing: const Icon(Icons.chevron_right, color: Colors.black),
            onTap: () async {
              selectedHour = 4;
              logger.i('선택한시간=$selectedHour');
              showDialog(
                context: context,
                builder: (BuildContext context) => _buildPopupDialog(context),
              );
            },
          ),
          const Divider(
            color: Colors.grey,
          ),
          ListTile(
            selectedColor: Colors.grey,
            leading: const Icon(
              Icons.looks_6_rounded,
              size: 40,
              color: Colors.black,
            ),
            title: const Text('6시간'),
            subtitle: const Text('6,000원 , 자유이용권은 무료'),
            trailing: const Icon(Icons.chevron_right, color: Colors.black),
            onTap: () {
              selectedHour = 6;
              logger.i('선택한시간=$selectedHour');
              showDialog(
                context: context,
                builder: (BuildContext context) => _buildPopupDialog(context),
              );
            },
          ),
          const Divider(
            color: Colors.grey,
          ),
          ListTile(
            selectedColor: Colors.grey,
            leading: const Icon(
              Icons.more_time,
              size: 40,
              color: Colors.black,
            ),
            title: const Text('9시간'),
            subtitle: const Text('9,000원 , 자유이용권은 무료'),
            trailing: const Icon(Icons.chevron_right, color: Colors.black),
            onTap: () {
              selectedHour = 9;
              logger.i('선택한시간=$selectedHour');
              showDialog(
                context: context,
                builder: (BuildContext context) => _buildPopupDialog(context),
              );
            },
          ),
          const Divider(
            color: Colors.grey,
          ),
          ListTile(
            selectedColor: Colors.grey,
            leading: const Icon(
              Icons.bedtime_outlined,
              size: 40,
              color: Colors.black,
            ),
            title: const Text('12시간'),
            subtitle: const Text('12,000원 , 자유이용권은 무료'),
            trailing: const Icon(Icons.chevron_right, color: Colors.black),
            onTap: () {
              selectedHour = 12;
              logger.i('선택한시간=$selectedHour');
              showDialog(
                context: context,
                builder: (BuildContext context) => _buildPopupDialog(context),
              );
            },
          ),
          const Divider(
            color: Colors.grey,
          ),
          ListTile(
            selectedColor: Colors.grey,
            leading: const Icon(
              Icons.timer,
              size: 40,
              color: Colors.black,
            ),
            title: const Text('24시간'),
            subtitle: const Text('24,000원 , 자유이용권은 무료'),
            trailing: const Icon(Icons.chevron_right, color: Colors.black),
            onTap: () {
              selectedHour = 24;
              logger.i('선택한시간=$selectedHour');
              showDialog(
                context: context,
                builder: (BuildContext context) => _buildPopupDialog(context),
              );
            },
          ),
          const Divider(
            color: Colors.grey,
          ),
        ],
      ),
    );
  }

  Widget _buildPopupDialog(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColor.appPurple,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                '현재 선택한 좌석은 $selectedSeatNumber번 좌석 입니다.',
                style:
                    const TextStyle(fontWeight: FontWeight.w300, fontSize: 16, color: Colors.white),
              ),
            ],
          ),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '선택한 시간 : $selectedHour시간',
            style: const TextStyle(fontWeight: FontWeight.w300, fontSize: 16, color: Colors.white),
          ),
        ],
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () async {
            showDialog(
              context: context,
              builder: (BuildContext context) => _buildPopupDialogSecondCheck(context),
            );
          },
          child: const Text(
            '확인',
            style: TextStyle(fontWeight: FontWeight.w300, fontSize: 16, color: Colors.white),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text(
            '취소',
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
            '좌석 이용이 시작되었습니다.',
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
                '좌석번호 : $selectedSeatNumber번',
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
            '확인',
            style: TextStyle(fontWeight: FontWeight.w300, fontSize: 16, color: Colors.white),
          ),
        ),
      ],
    );
  }

  Widget _buildPopupDialogCheck(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColor.appPurple,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          Text(
            '이미 좌석을 사용하고 있습니다.',
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
            children: const [
              Text(
                '좌석을 확인해주세요.',
                style: TextStyle(fontWeight: FontWeight.w300, fontSize: 16, color: Colors.white),
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

  Widget _buildPopupDialogSecondCheck(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColor.appPurple,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          Text(
            '사용을 시작하시겠습니까?',
            style: TextStyle(fontWeight: FontWeight.w300, fontSize: 16, color: Colors.white),
          ),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const <Widget>[],
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () async {
            await ref
                .read(seatRepoProvider)
                .postSeatReservationStart(selectedSeatNumber - 1, selectedHour);
            ref.read(seatStateNotifierProvider.notifier).roomFetchGet();

            await startTimer();

            // await showDialog(
            //   context: context,
            //   builder: (BuildContext context) => _buildPopupDialogChange(context),
            // );
          },
          child: const Text(
            'OK',
            style: TextStyle(fontWeight: FontWeight.w300, fontSize: 16, color: Colors.white),
          ),
        ),
        TextButton(
          onPressed: () async {
            Navigator.pop(context);
          },
          child: const Text(
            'NO',
            style: TextStyle(fontWeight: FontWeight.w300, fontSize: 16, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
