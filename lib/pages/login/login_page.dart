import 'package:asc_portfolio/common_enum/user/user_enum.dart';
import 'package:asc_portfolio/pages/admin/admin_main_page.dart';
import 'package:asc_portfolio/pages/home_page.dart';
import 'package:asc_portfolio/pages/signup/sign_up_page.dart';
import 'package:asc_portfolio/style/app_color.dart';
import 'package:flutter/material.dart';
import 'package:asc_portfolio/server/dio_server.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';


class LoginDemo extends StatefulWidget {
  @override
  _LoginDemoState createState() => _LoginDemoState();
}

class _LoginDemoState extends State<LoginDemo> {

  static final storage = FlutterSecureStorage();

  bool _obscureText = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColor.appPurple,
        leading: IconButton(
          color: Colors.white,
          icon: const Icon(Icons.arrow_back),
          onPressed: () => {
          Navigator.pop(context),
          },
        ),
      ),
      backgroundColor: AppColor.appPurple,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 1.0),
              child: Center(
                child: Container(
                    child: Image.asset('assets/images/logo_set_mini.png')),
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 50,
              width: 350,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextFormField(
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.emailAddress,
                  autofocus: false,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(
                          color: Colors.black,
                        )
                    ),
                    focusColor: Colors.black,
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Email',
                    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(
                          color: Colors.black,
                    )),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: 50,
              width: 350,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextFormField(
                  cursorColor: Colors.black,
                  obscureText: _obscureText ? false : true,
                  autofocus: false,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(
                          color: Colors.black,
                        )
                    ),
                    filled: true,
                    focusColor: Colors.black,
                    fillColor: Colors.white,
                    hintText: 'Password',
                    contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(25.0)),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                      child: Icon(
                        _obscureText ? Icons.visibility : Icons.visibility_off,
                        color: Colors.black,
                        semanticLabel:
                        _obscureText ? 'show password' : 'hide password',
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 40),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(20)),
              child: FloatingActionButton.extended(
                  heroTag: 'Login',
                  label: Text('로그인'),// <-- Text
                  backgroundColor: Colors.black,
                  onPressed: () async {
                    await server.postReqLogin(context);
                    String? roleType = await storage.read(key: 'roleType');
                    if (roleType!.contains("USER")) {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                    } else if (roleType!.contains("ADMIN")) {
                      Navigator.pushNamedAndRemoveUntil(context, '/AdminMainPage' , (route) => false);
                  }
                }
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(20)),
              child: FloatingActionButton.extended(
                  heroTag: 'SignUp',
                  label: Text('회원가입'),// <-- Text
                  backgroundColor: Colors.black,
                  onPressed: ()  {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SignupPage()));
                  }
              ),
            ),
            TextButton(
              onPressed: (){
                //TODO FORGOT PASSWORD SCREEN GOES HERE
              },
              child: Text(
                '비밀번호를 잊으셨습니까?',
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
            SizedBox(height: 10),
            Text('Copyright ©2022, All Rights Reserved.',
              style: TextStyle(color: Colors.white,fontSize: 12),),
            SizedBox(height: 10),
            Text('Powered by padonan, chan-hong',
              style: TextStyle(color: Colors.white,fontSize: 12),),
          ],
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
              Text('비밀번호가 일치하지 않습니다.', style: TextStyle(fontWeight: FontWeight.w300,fontSize: 16, color: Colors.white), ),
            ],
          ),
        ],
      ),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text("비밀번호를 확인해주세요.", style: TextStyle(fontWeight: FontWeight.w300,fontSize: 12, color: Colors.white),),
        ],
      ),
      actions: <Widget>[
        new TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            },
          child: const Text('OK', style: TextStyle(fontWeight: FontWeight.w300,fontSize: 16, color: Colors.white),),
        ),
      ],
    );
  }
}