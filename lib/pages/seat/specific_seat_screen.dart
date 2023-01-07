import 'package:asc_portfolio/pages/seat/widgets/time_select.dart';
import 'package:asc_portfolio/provider/seat_state/seat_state.dart';
import 'package:asc_portfolio/server/repository/seat_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/base_scaffold.dart';
import '../../style/app_color.dart';

class SpecificSeatScreen extends ConsumerStatefulWidget {
  int selectedSeatNumber;
  int selectedHour = 0;
  SpecificSeatScreen(this.selectedSeatNumber);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SpecificSeatScreenState();
}

class _SpecificSeatScreenState extends ConsumerState<SpecificSeatScreen> {
  late int selectedSeatNumber = widget.selectedSeatNumber;
  int selectedHour = 0;
  bool isNotCompleteLoading = true;

  List<Map<String, dynamic>> optionList = [
    {
      'title': '1시간',
      'subtitle': '1,000원, 자유이용권은 무료',
      'icon': const Icon(Icons.looks_two_rounded, size: 40, color: Colors.black)
    },
    {
      'title': '2시간',
      'subtitle': '2,000원, 자유이용권은 무료',
      'icon': const Icon(Icons.looks_3_rounded, size: 40, color: Colors.black)
    },
    {
      'title': '4시간',
      'subtitle': '4,000원, 자유이용권은 무료',
      'icon': const Icon(Icons.looks_4_rounded, size: 40, color: Colors.black)
    },
    {
      'title': '6시간',
      'subtitle': '6,000원, 자유이용권은 무료',
      'icon': const Icon(Icons.looks_6_rounded, size: 40, color: Colors.black)
    },
    {
      'title': '9시간',
      'subtitle': '9,000원, 자유이용권은 무료',
      'icon': const Icon(Icons.more_time, size: 40, color: Colors.black)
    },
    // 12시간
    {
      'title': '12시간',
      'subtitle': '12,000원, 자유이용권은 무료',
      'icon': const Icon(Icons.bedtime_outlined, size: 40, color: Colors.black)
    },

    // 24시간
    {
      'title': '24시간',
      'subtitle': '24,000원, 자유이용권은 무료',
      'icon': const Icon(Icons.timer, size: 40, color: Colors.black)
    },
  ];

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
      body: ListView.builder(
        itemCount: optionList.length,
        itemBuilder: (context, index) => OptionTile(
          title: optionList[index]['title'],
          subtitle: optionList[index]['subtitle'],
          leading: optionList[index]['icon'],
          onTap: () => showDialog(
            context: context,
            builder: (context) {
              return _buildPopupDialog(context);
            },
          ),
        ),
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
