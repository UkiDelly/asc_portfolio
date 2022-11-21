import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../style/app_color.dart';
import '../home_page.dart';

class PaymentDetailPeriodPage extends StatelessWidget {
  const PaymentDetailPeriodPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.appPurple,
          title: Text('자유석 기간권', style: TextStyle(fontWeight: FontWeight.w300,color: Colors.white,fontSize: 20),),
          shadowColor: Colors.white,
          elevation: 1,
        ),
        body: ListView(
            children:[
              ListTile(
                selectedColor: Colors.grey,
                title: Text('*  해당 기간동안 자유롭게 이용가능한 기간권입니다.',style :TextStyle(fontWeight: FontWeight.w300,color: Colors.black,fontSize: 14),),
                onTap: () {
                },
              ),
              ListTile(
                selectedColor: Colors.grey,
                leading: Icon(Icons.bookmark_outline_sharp, size: 40,color: Colors.black,),
                title: Text('7일'),
                subtitle: const Text('15,000원'),
                trailing: Icon(Icons.chevron_right, color: Colors.black),
                onTap: () {
                },
              ),
              const Divider(
                color: Colors.grey,
              ),
              ListTile(
                selectedColor: Colors.grey,
                leading: Icon(Icons.bookmark_outline_sharp, size: 40,color: Colors.black,),
                title: Text('14일'),
                subtitle: const Text('30,000원'),
                trailing: Icon(Icons.chevron_right, color: Colors.black),
                onTap: () {
                },
              ),
              const Divider(
                color: Colors.grey,
              ),
              ListTile(
                selectedColor: Colors.grey,
                leading: Icon(Icons.bookmark_outline_sharp, size: 40,color: Colors.black,),
                title: Text('21일'),
                subtitle: const Text('40,000원'),
                trailing: Icon(Icons.chevron_right, color: Colors.black),
                onTap: () async {
                },
              ),
              const Divider(
                color: Colors.grey,
              ),
              ListTile(
                selectedColor: Colors.grey,
                leading: Icon(Icons.bookmark_outline_sharp, size: 40,color: Colors.black,),
                title: Text('28일'),
                subtitle: const Text('50,000원'),
                trailing: Icon(Icons.chevron_right, color: Colors.black),
                onTap: () {
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
            Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
            await showDialog(
              context: context,
              builder: (BuildContext context) => _buildPopupDialogChange(context),
            );
          },
          child: const Text('이용시작', style: TextStyle(fontWeight: FontWeight.w300,fontSize: 16, color: Colors.white),),
        ),
        new TextButton(
          onPressed: () {
            Navigator.of(context).pop();
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
          child: const Text("OK", style: TextStyle(fontWeight: FontWeight.w300,fontSize: 16, color: Colors.white),),
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
}
