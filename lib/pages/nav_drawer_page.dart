import 'package:asc_portfolio/style/app_color.dart';
import 'package:flutter/material.dart';

import 'change_seat_page.dart';
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
        ],
      ),
    );
  }
}