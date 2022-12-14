import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:asc_portfolio/server/dio_server.dart';

import '../../style/app_color.dart';
import '../home_page.dart';

class SpecificSeatPage extends StatefulWidget {
  int selectedSeatNumber;
  int selectedHour = 0;
  SpecificSeatPage(this.selectedSeatNumber);
  @override
  State<SpecificSeatPage> createState() => _SpecificSeatPageState(selectedSeatNumber);
}

class _SpecificSeatPageState extends State<SpecificSeatPage> {

  int selectedSeatNumber;
  int selectedHour = 0;
  double _progress = 0;
  bool isNotCompleteLoading = true;

  _SpecificSeatPageState(this.selectedSeatNumber);

  Future<void> startTimer() async {
    new Timer.periodic(
      Duration(milliseconds: 50),
          (Timer timer) => setState(
            () {
          if (_progress == 0.05) {
            setState(() {
              isNotCompleteLoading = false;
            });
            timer.cancel();
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => HomePage()))
                .then((value) {
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

    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.appPurple,
          title: Text('시간 선택', style: TextStyle(fontWeight: FontWeight.w300,color: Colors.white,fontSize: 20),),
          shadowColor: Colors.white,
          elevation: 1,
        ),
        body: ListView(
            children:[
              ListTile(
                selectedColor: Colors.grey,
                leading: Icon(Icons.looks_two_rounded, size: 40,color: Colors.black,),
                title: Text('1시간'),
                subtitle: const Text('1,000원 , 자유이용권은 무료'),
                trailing: Icon(Icons.chevron_right, color: Colors.black),
                onTap: () {
                  selectedHour = 1;
                  print(selectedHour);
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => _buildPopupDialog(context),
                  );
                },
              ),
              ListTile(
                selectedColor: Colors.grey,
                leading: Icon(Icons.looks_two_rounded, size: 40,color: Colors.black,),
                title: Text('2시간'),
                subtitle: const Text('2,000원 , 자유이용권은 무료'),
                trailing: Icon(Icons.chevron_right, color: Colors.black),
                onTap: () {
                  selectedHour = 2;
                  print(selectedHour);
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
                leading: Icon(Icons.looks_4_rounded, size: 40,color: Colors.black,),
                title: Text('4시간'),
                subtitle: const Text('4,000원 , 자유이용권은 무료'),
                trailing: Icon(Icons.chevron_right, color: Colors.black),
                onTap: () async {
                  selectedHour = 4;
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
                leading: Icon(Icons.looks_6_rounded, size: 40,color: Colors.black,),
                title: Text('6시간'),
                subtitle: const Text('6,000원 , 자유이용권은 무료'),
                trailing: Icon(Icons.chevron_right, color: Colors.black),
                onTap: () {
                  selectedHour = 6;
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
                leading: Icon(Icons.more_time, size: 40,color: Colors.black,),
                title: Text('9시간'),
                subtitle: const Text('9,000원 , 자유이용권은 무료'),
                trailing: Icon(Icons.chevron_right, color: Colors.black),
                onTap: () {
                  selectedHour = 9;
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
                leading: Icon(Icons.bedtime_outlined, size: 40,color: Colors.black,),
                title: Text('12시간'),
                subtitle: const Text('12,000원 , 자유이용권은 무료'),
                trailing: Icon(Icons.chevron_right, color: Colors.black),
                onTap: () {
                  selectedHour = 12;
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
                leading: Icon(Icons.timer, size: 40,color: Colors.black,),
                title: Text('24시간'),
                subtitle: const Text('24,000원 , 자유이용권은 무료'),
                trailing: Icon(Icons.chevron_right, color: Colors.black),
                onTap: () {
                  selectedHour = 24;
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => _buildPopupDialog(context),
                  );
                },
              ),
            const Divider(
              color: Colors.grey,
          ),
        ]
      )
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
              Text('현재 선택한 좌석은 $selectedSeatNumber번 좌석 입니다.', style: TextStyle(fontWeight: FontWeight.w300,fontSize: 16, color: Colors.white), ),
            ],
          ),
        ],
      ),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("선택한 시간 : $selectedHour시간", style: TextStyle(fontWeight: FontWeight.w300,fontSize: 16, color: Colors.white),),
        ],
      ),
      actions: <Widget>[
        new TextButton(
          onPressed: () async {
            showDialog(
              context: context,
              builder: (BuildContext context) => _buildPopupDialogSecondCheck(context),
            );
          },
          child: const Text('확인', style: TextStyle(fontWeight: FontWeight.w300,fontSize: 16, color: Colors.white),),
        ),
        new TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('취소', style: TextStyle(fontWeight: FontWeight.w300,fontSize: 16, color: Colors.white),),
        ),
      ],
    );
  }

  Widget _buildPopupDialogChange(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColor.appPurple,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Text('좌석 이용이 시작되었습니다.', style: TextStyle(fontWeight: FontWeight.w300,fontSize: 16, color: Colors.white), ),
        ],
      ),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("좌석번호 : $selectedSeatNumber번", style: TextStyle(fontWeight: FontWeight.w300,fontSize: 16, color: Colors.white),),
            ],
          ),
        ],
      ),
      actions: <Widget>[
        new TextButton(
          onPressed: () async {
            Navigator.pop(context);
            },
          child: const Text("확인", style: TextStyle(fontWeight: FontWeight.w300,fontSize: 16, color: Colors.white),),
        ),
      ],
    );
  }

  Widget _buildPopupDialogCheck(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColor.appPurple,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Text('이미 좌석을 사용하고 있습니다.', style: TextStyle(fontWeight: FontWeight.w300,fontSize: 16, color: Colors.white), ),
        ],
      ),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("좌석을 확인해주세요.", style: TextStyle(fontWeight: FontWeight.w300,fontSize: 16, color: Colors.white),),
            ],
          ),
        ],
      ),
      actions: <Widget>[
        new TextButton(
          onPressed: () async {
            Navigator.pop(context);
          },
          child: const Text("OK", style: TextStyle(fontWeight: FontWeight.w300,fontSize: 16, color: Colors.white),),
        ),
      ],
    );
  }


  Widget _buildPopupDialogSecondCheck(BuildContext context) {

    void _postStartReservation(int seatNumber) async {
      String responseData = await server.postSeatReservationStart(context, seatNumber);
      print("HomePageResponseData="+responseData);
    }

    return AlertDialog(
      backgroundColor: AppColor.appPurple,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Text('사용을 시작하시겠습니까?', style: TextStyle(fontWeight: FontWeight.w300,fontSize: 16, color: Colors.white), ),
        ],
      ),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
        ],
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () async {
            _postStartReservation(selectedSeatNumber - 1);
            await startTimer();

            // await showDialog(
            //   context: context,
            //   builder: (BuildContext context) => _buildPopupDialogChange(context),
            // );
          },
          child: const Text("OK", style: TextStyle(fontWeight: FontWeight.w300,fontSize: 16, color: Colors.white),),
        ),
        new TextButton(
          onPressed: () async {
              Navigator.pop(context);
          },
          child: const Text("NO", style: TextStyle(fontWeight: FontWeight.w300,fontSize: 16, color: Colors.white),),
        ),
      ],
    );
  }
}
