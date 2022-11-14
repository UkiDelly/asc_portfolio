import 'package:flutter/material.dart';
import 'package:asc_portfolio/server/dio_server.dart';

import '../style/app_color.dart';

class SignupPage extends StatefulWidget {

  @override
  _SignupPageState createState() => _SignupPageState();

}

class _SignupPageState extends State<SignupPage> {

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
      backgroundColor: AppColor.appPURPLE,
        resizeToAvoidBottomInset: false,
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
          Container(
            child: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(15.0, 30.0, 0.0, 0.0),
                  child: Image.asset("assets/images/logo_set_splash.png"),
                ),
              ],
            ),
          ),
          Container(
              padding: EdgeInsets.only(top: 15.0, left: 20.0, right: 20.0),
              child: Column(
                children: <Widget>[
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                        labelText: 'EMAIL',
                        labelStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w300,
                            color: Colors.grey),
                        // hintText: 'EMAIL',
                        // hintStyle: ,
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white))),
                    onTap: () {// controller로 값 전달
                    },
                  ),
                  SizedBox(height: 10.0),
                  TextField(
                    controller: idController,
                    decoration: InputDecoration(
                        labelText: 'NAME ',
                        labelStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w300,
                            color: Colors.grey),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white))),
                  ),
                  SizedBox(height: 10.0),
                  TextField(
                    controller: passwordController,
                    decoration: InputDecoration(
                        labelText: 'PASSWORD',
                        labelStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w300,
                            color: Colors.grey),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white))),
                    obscureText: true,
                  ),
                  SizedBox(height: 50.0),
                  Container(
                    height: 40.0,
                    width: 400,
                    child: FloatingActionButton.extended(
                        heroTag: 'SignUp2',
                        label: Text('회원가입'),// <-- Text
                        backgroundColor: Colors.black,
                        onPressed: () async {
                          String id = idController.text;
                          String password = passwordController.text;
                          String email = emailController.text;

                          server.postReqSignUp(id, password, email);
                          showDialog(
                            context: context,
                            builder: (BuildContext context) => _buildPopupDialog(context),
                        );
                      }
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Container(
                    height: 40.0,
                    width: 400,
                    child: FloatingActionButton.extended(
                        heroTag: 'back',
                        label: Text('뒤로'),// <-- Text
                        backgroundColor: Colors.black,
                        onPressed: ()  {
                          Navigator.pop(context);
                    }
                  ),
                ),
              ],
            )
          ),
        ]
      )
    );
  }


  Widget _buildPopupDialog(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColor.appPURPLE,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Text('이미 존재하는 Email 주소 입니다.', style: TextStyle(fontWeight: FontWeight.w300,fontSize: 16, color: Colors.white), ),
        ],
      ),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("다른 Email 주소를 사용하세요.", style: TextStyle(fontWeight: FontWeight.w300,fontSize: 12, color: Colors.white),),
            ],
          ),
        ],
      ),
      actions: <Widget>[
        new TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Close', style: TextStyle(fontWeight: FontWeight.w300,fontSize: 16, color: Colors.white),),
        ),
      ],
    );
  }
}