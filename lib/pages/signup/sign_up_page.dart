import 'package:asc_portfolio/constant/assets.dart';
import 'package:asc_portfolio/pages/login/login_page.dart';
import 'package:asc_portfolio/server/repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../style/app_color.dart';

class SignupPage extends ConsumerStatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends ConsumerState<SignupPage> {
  TextEditingController idController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  void dispose() {
    idController.dispose();
    passwordController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.appPurple,
      resizeToAvoidBottomInset: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Stack(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.fromLTRB(15.0, 30.0, 0.0, 0.0),
                  child: Image.asset(AppAssets.splashLogo),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 15.0, left: 20.0, right: 20.0),
            child: Column(
              children: <Widget>[
                TextField(
                  cursorColor: Colors.white,
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w300),
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: 'EMAIL',
                    labelStyle: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w300,
                      color: Colors.grey,
                    ),
                    // hintText: 'EMAIL',
                    // hintStyle: ,
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                  onTap: () {
                    // controller로 값 전달
                  },
                ),
                const SizedBox(height: 10.0),
                TextField(
                  cursorColor: Colors.white,
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w300),
                  controller: idController,
                  decoration: const InputDecoration(
                    labelText: 'NAME ',
                    labelStyle: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w300,
                      color: Colors.grey,
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 10.0),
                TextField(
                  cursorColor: Colors.white,
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w300),
                  controller: passwordController,
                  decoration: const InputDecoration(
                    labelText: 'PASSWORD',
                    labelStyle: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w300,
                      color: Colors.grey,
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 50.0),
                SizedBox(
                  height: 40.0,
                  width: 400,
                  child: FloatingActionButton.extended(
                    heroTag: 'SignUp2',
                    label: const Text('회원가입'), // <-- Text
                    backgroundColor: Colors.black,
                    onPressed: () async {
                      String id = idController.text;
                      String password = passwordController.text;
                      String email = emailController.text;
                      ref.read(userRepoProvider).postReqSignUp(id, password, email);

                      await showDialog(
                        context: context,
                        builder: (BuildContext context) => _buildPopupDialog(context),
                      );
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const LoginDemo()),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20.0),
                SizedBox(
                  height: 40.0,
                  width: 400,
                  child: FloatingActionButton.extended(
                    heroTag: 'back',
                    label: const Text('뒤로'), // <-- Text
                    backgroundColor: Colors.black,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
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
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          Text(
            '회원가입 되었습니다.',
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
                '알라딘 스터디 카페에 오신걸 환영합니다!',
                style: TextStyle(fontWeight: FontWeight.w300, fontSize: 12, color: Colors.white),
              ),
            ],
          ),
        ],
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text(
            'Close',
            style: TextStyle(fontWeight: FontWeight.w300, fontSize: 16, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
