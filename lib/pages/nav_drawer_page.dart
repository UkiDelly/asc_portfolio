import 'package:asc_portfolio/style/app_color.dart';
import 'package:flutter/material.dart';

import 'change_seat_page.dart';
import 'home_page.dart';
import 'login_page.dart';

class NavDrawer extends StatelessWidget {

  bool logInfo = true;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              '',
            ),
            decoration: BoxDecoration(
                color: AppColor.appPURPLE,
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/images/logo_set_mini.png'))),
          ),
          ListTile(
            leading: Icon(Icons.unpublished, color: AppColor.appPURPLE),
            title: Text('이용종료'),
            onTap: () => {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => _buildPopupDialog(context),
              ),
            },
          ),
          ListTile(
            leading: Icon(Icons.airline_seat_individual_suite_sharp, color: AppColor.appPURPLE),
            title: Text('좌석이동'),
            onTap: () => {
            Navigator.push(context, MaterialPageRoute(builder: (context) => ChangeSeatPage()))
            },
          ),
          ListTile(
            leading: logInfo ? Icon(Icons.login, color: AppColor.appPURPLE) : Icon(Icons.logout, color: AppColor.appPURPLE),
            title: logInfo ? Text('로그인') : Text('로그아웃'),
            onTap: () => {
              Navigator.push(context, MaterialPageRoute(builder: (context) => LoginDemo())),
            },
          ),
          ListTile(
            leading: Icon(Icons.settings, color: AppColor.appPURPLE),
            title: Text('세팅'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.contact_support, color: AppColor.appPURPLE),
            title: Text('1:1 채팅문의'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.border_color, color: AppColor.appPURPLE),
            title: Text('건의게시판'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.device_unknown_rounded, color: AppColor.appPURPLE),
            title: Text('Contact'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          SizedBox(height: 100),
          Container(
            padding: EdgeInsets.all(10),
            child: ListTile(
              title: Text('Copyright ©2022 All Rights Reserved', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w300),),
              subtitle: Text('Powered by padonan', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w300),),
              onTap: () => {
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPopupDialog(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColor.appPURPLE,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('이용을 종료하시겠습니까?', style: TextStyle(fontWeight: FontWeight.w300,fontSize: 16, color: Colors.white), ),
            ],
          ),
        ],
      ),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("남은시간 : {%d}시간", style: TextStyle(fontWeight: FontWeight.w300,fontSize: 16, color: Colors.white),),
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
          child: const Text('OK', style: TextStyle(fontWeight: FontWeight.w300,fontSize: 16, color: Colors.white),),
        ),
        new TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('NO', style: TextStyle(fontWeight: FontWeight.w300,fontSize: 16, color: Colors.white),),
        ),
      ],
    );
  }

  Widget _buildPopupDialogChange(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColor.appPURPLE,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Text('이용이 종료되었습니다.', style: TextStyle(fontWeight: FontWeight.w300,fontSize: 16, color: Colors.white), ),
        ],
      ),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("다음 사람을 위해 좌석을 정리해주세요", style: TextStyle(fontWeight: FontWeight.w300,fontSize: 12, color: Colors.white),),
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