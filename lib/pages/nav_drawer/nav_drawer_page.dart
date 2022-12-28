
import 'package:asc_portfolio/server/dio_server.dart';
import 'package:asc_portfolio/style/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:url_launcher/url_launcher.dart';

import 'dart:async';

import '../home_page.dart';
import '../seat/change_seat_page.dart';
import '../login/login_page.dart';
import '../suggest_board/suggest_board_page.dart';

class NavDrawer extends StatefulWidget {

  NavDrawer({Key? key}) : super(key: key);

  @override
  State<NavDrawer> createState() => _NavDrawerState();

}


class _NavDrawerState extends State<NavDrawer> {

  static final storage = FlutterSecureStorage();
  double _progress = 0;
  bool isNotCompleteLoading = true;

  _launchURL() async {
    final url = Uri.parse("https://furry-ocean-0ef.notion.site/AladinStudyCafe-4a4948513ebc42feb21e891fd4ed3b0c");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

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

  void _fetchExitSeat() async {
    await server.postExitSeat(context);
  }

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
              color: AppColor.appPurple,
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('assets/images/logo_set_mini.png'))),
          ),
          HomePageState.isLogined ? ListTile(
            leading: Icon(Icons.unpublished, color: AppColor.appPurple),
            title: Text('이용종료', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400)),
            onTap: () => {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => _buildPopupDialog(context),
              ),
            },
          ) : Text(''),
          HomePageState.isLogined ? ListTile(
            leading: Icon(Icons.airline_seat_individual_suite_sharp, color: AppColor.appPurple),
            title: Text('좌석이동', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400)),
            onTap: () => {
            Navigator.push(context, MaterialPageRoute(builder: (context) => ChangeSeatPage()))
            },
          ) : Text(''),
          ListTile(
            leading: HomePageState.isLogined ? Icon(Icons.logout, color: AppColor.appPurple) : Icon(Icons.login, color: AppColor.appPurple),
            title: HomePageState.isLogined ? Text('로그아웃', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400))
                : Text('로그인', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400)),
            onTap: () async {
              if (HomePageState.isLogined == true) {
                setState(() {
                  storage.deleteAll();
                  //storage.write(key: 'accessToken', value: null);
                  HomePageState.isLogined = false;
                });
                Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                await showDialog(
                  context: context,
                  builder: (BuildContext context) => _buildPopupDialogLogOutCheck(context),
                );
              } else if (HomePageState.isLogined == false) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginDemo()));
              }
            },
          ),
          // ListTile(
          //   leading: Icon(Icons.settings, color: AppColor.appPurple),
          //   title: Text('세팅', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400)),
          //   onTap: () => {Navigator.of(context).pop()},
          // ),
          ListTile(
            leading: Icon(Icons.contact_support, color: AppColor.appPurple),
            title: Text('1:1 채팅문의', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400)),
            onTap: () => {
              _launchURL()
            },
          ),
          ListTile(
            leading: Icon(Icons.border_color, color: AppColor.appPurple),
            title: Text('건의게시판', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400)),
            onTap: () => {
            Navigator.push(context, MaterialPageRoute(builder: (context) => SuggestBoardPage())),
            },
          ),
          ListTile(
            leading: Icon(Icons.device_unknown_rounded, color: AppColor.appPurple),
            title: Text('Contact', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400)),
            onTap: () => {
              showDialog(context: context,
                  builder: _buildPopupDialogContact),
            },
          ),
          SizedBox(height: 100),
          Container(
            padding: EdgeInsets.all(10),
            child: ListTile(
              title: Text('Copyright ©2022 All Rights Reserved', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w300),),
              subtitle: Text('Powered by padonan, chan-hong', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w300),),
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
      backgroundColor: AppColor.appPurple,
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
      backgroundColor: AppColor.appPurple,
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
            _fetchExitSeat();
            startTimer();
          },
          child: const Text("OK", style: TextStyle(fontWeight: FontWeight.w300,fontSize: 16, color: Colors.white),),
        ),
      ],
    );
  }

  Widget _buildPopupDialogContact(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColor.appPurple,
      title: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text('Contact : bbde1861@gmail.com', style: TextStyle(fontWeight: FontWeight.w300,fontSize: 15, color: Colors.white), ),
          Text('ych1273@gmail.com', style: TextStyle(fontWeight: FontWeight.w300,fontSize: 15, color: Colors.white), ),
          Text('AladinStudyCafe version 1.0', style: TextStyle(fontWeight: FontWeight.w300,fontSize: 15, color: Colors.white), ),
              Text('This application is made for personal portfolio', style: TextStyle(fontWeight: FontWeight.w300,fontSize: 13, color: Colors.white), ),
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

  Widget _buildPopupDialogLogOutCheck(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColor.appPurple,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Text('로그아웃 되었습니다.', style: TextStyle(fontWeight: FontWeight.w300,fontSize: 16, color: Colors.white), ),
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