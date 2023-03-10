import 'dart:async';

import 'package:asc_portfolio/constant/assets.dart';
import 'package:asc_portfolio/main.dart';
import 'package:asc_portfolio/provider/secure_storage_provider.dart';
import 'package:asc_portfolio/style/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

import '../pages/main_screen.dart';
import '../provider/login_state/login_state.dart';

class UserDrawer extends ConsumerStatefulWidget {
  const UserDrawer({Key? key}) : super(key: key);

  @override
  ConsumerState<UserDrawer> createState() => _UserDrawerState();
}

class _UserDrawerState extends ConsumerState<UserDrawer> {
  double _progress = 0;
  bool isNotCompleteLoading = true;

  @override
  void initState() {
    super.initState();
    ref.read(checkUserLoginProvider);
  }

  _launchURL() async {
    final url = Uri.parse(
      'https://furry-ocean-0ef.notion.site/AladinStudyCafe-4a4948513ebc42feb21e891fd4ed3b0c',
    );
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

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
    final isLogin = ref.watch(loginStateProvider).loginCheck;

    logger.i(isLogin);

    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 40),
            color: AppColor.appPurple,
            child: Image.asset(
              AppAssets.logoMini,
            ),
          ),

          isLogin // SeatScreenState.isLogined
              ? ListTile(
                  leading: const Icon(Icons.unpublished, color: AppColor.appPurple),
                  title: const Text(
                    '????????????',
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
                  ),
                  onTap: () => {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => _buildPopupDialog(context),
                    ),
                  },
                )
              : const Text(''),
          isLogin
              ? ListTile(
                  leading: const Icon(
                    Icons.airline_seat_individual_suite_sharp,
                    color: AppColor.appPurple,
                  ),
                  title: const Text(
                    '????????????',
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
                  ),
                  onTap: () {
                    context.push('/change_seat');
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => const ChangeSeatScreen()),
                    // )
                  },
                )
              : const Text(''),
          ListTile(
            leading: const Icon(Icons.logout, color: AppColor.appPurple),
            title: const Text('????????????', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400)),
            onTap: () async {
              await ref.read(secureStorageProvider).deleteAll();
              ref.invalidate(loginStateProvider);

              context.go('/login');
            },
          ),
          // ListTile(
          //   leading: Icon(Icons.settings, color: AppColor.appPurple),
          //   title: Text('??????', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400)),
          //   onTap: () => {Navigator.of(context).pop()},
          // ),
          ListTile(
            leading: const Icon(Icons.contact_support, color: AppColor.appPurple),
            title:
                const Text('1:1 ????????????', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400)),
            onTap: () => {_launchURL()},
          ),
          ListTile(
            leading: const Icon(Icons.border_color, color: AppColor.appPurple),
            title: const Text('???????????????', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400)),
            onTap: () {
              print('press');
              context.push('/faq');
            },
          ),
          ListTile(
            leading: const Icon(Icons.device_unknown_rounded, color: AppColor.appPurple),
            title:
                const Text('Contact', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400)),
            onTap: () => {
              showDialog(
                context: context,
                builder: _buildPopupDialogContact,
              ),
            },
          ),
          const Spacer(),
          SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Text(
                  'Copyright ??2022 All Rights Reserved',
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w300),
                ),
                Text(
                  'Powered by padonan, chan-hong',
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w300),
                ),
              ],
            ),
          ),

          const SizedBox(
            height: 50,
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
            children: const [
              Text(
                '????????? ?????????????????????????',
                style: TextStyle(fontWeight: FontWeight.w300, fontSize: 16, color: Colors.white),
              ),
            ],
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
            Navigator.push(context, MaterialPageRoute(builder: (context) => const MainScreen()));
            await showDialog(
              context: context,
              builder: (BuildContext context) => _buildPopupDialogChange(context),
            );
          },
          child: const Text(
            'OK',
            style: TextStyle(fontWeight: FontWeight.w300, fontSize: 16, color: Colors.white),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text(
            'NO',
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
            '????????? ?????????????????????.',
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
                '?????? ????????? ?????? ????????? ??????????????????',
                style: TextStyle(fontWeight: FontWeight.w300, fontSize: 12, color: Colors.white),
              ),
            ],
          ),
        ],
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () async {
            //TODO: ?????? ?????? ?????? ?????? ??????
            // ref.read(seatStateNotifierProvider.notifier).;
            startTimer();
          },
          child: const Text(
            'OK',
            style: TextStyle(fontWeight: FontWeight.w300, fontSize: 16, color: Colors.white),
          ),
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
        children: const [
          Text(
            'Contact : bbde1861@gmail.com',
            style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15, color: Colors.white),
          ),
          Text(
            'ych1273@gmail.com',
            style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15, color: Colors.white),
          ),
          Text(
            'AladinStudyCafe version 1.0',
            style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15, color: Colors.white),
          ),
          Text(
            'This application is made for personal portfolio',
            style: TextStyle(fontWeight: FontWeight.w300, fontSize: 13, color: Colors.white),
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

  Widget _buildPopupDialogLogOutCheck(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColor.appPurple,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          Text(
            '???????????? ???????????????.',
            style: TextStyle(fontWeight: FontWeight.w300, fontSize: 16, color: Colors.white),
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

class AdminDrawer extends StatelessWidget {
  const AdminDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 40),
            color: AppColor.appPurple,
            child: Image.asset(
              AppAssets.logoMini,
            ),
          ),
          ListTile(
            leading: const Icon(Icons.contact_support),
            title: const Text('FAQ ??????'),
            onTap: () => context.push('/faq'),
          ),
          ListTile(
            leading: const Icon(Icons.edit),
            title: const Text('1:1 ?????? ??????'),
            //TODO: 1:1 ?????? ?????? ???????????? ??????
            onTap: () {},
          ),
          const Spacer(),
          SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Text(
                  'Copyright ??2022 All Rights Reserved',
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w300),
                ),
                Text(
                  'Powered by padonan, chan-hong',
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w300),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
