import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../style/app_color.dart';
import '../home_page.dart';

class SpecificSeatPage extends StatelessWidget {
  const SpecificSeatPage({Key? key}) : super(key: key);

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
              Text('현재 선택한 좌석은 {%s}번 좌석입니다.', style: TextStyle(fontWeight: FontWeight.w300,fontSize: 16, color: Colors.white), ),
            ],
          ),
        ],
      ),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("이용할 시간 : {%s}시간.", style: TextStyle(fontWeight: FontWeight.w300,fontSize: 16, color: Colors.white),),
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
              Text("좌석번호 : {%s}번", style: TextStyle(fontWeight: FontWeight.w300,fontSize: 16, color: Colors.white),),
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
        new TextButton(
          onPressed: () async {
            Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
            await showDialog(
              context: context,
              builder: (BuildContext context) => _buildPopupDialogChange(context),
            );
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