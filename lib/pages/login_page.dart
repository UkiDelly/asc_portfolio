import 'dart:convert';
import 'package:asc_portfolio/pages/sign_up_page.dart';
import 'package:asc_portfolio/style/app_color.dart';
import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
import 'package:asc_portfolio/server/dio_server.dart';


// class JsonObject {
//   final String success;
//
//   JsonObject({required this.success});
//
//   factory JsonObject.fromJson(Map<String, dynamic> json) {
//     return JsonObject(success: json['success'] as String);
//   }
// }

class LoginDemo extends StatefulWidget {
  @override
  _LoginDemoState createState() => _LoginDemoState();
}

class _LoginDemoState extends State<LoginDemo> {


  bool _obscureText = false;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColor.appPURPLE,
        leading: IconButton(
          color: Colors.white,
          icon: const Icon(Icons.arrow_back),
          onPressed: () => {
            Navigator.pop(context),
          },
        ),
      ),
      backgroundColor: AppColor.appPURPLE,
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
                  keyboardType: TextInputType.emailAddress,
                  autofocus: false,
                  decoration: InputDecoration(
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
                  obscureText: _obscureText ? false : true,
                  autofocus: false,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    filled: true,
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
                  onPressed: ()   {

                    //
                    // final url = Uri.parse(
                    //   'http://10.0.2.2:8080/user/signup',
                    // );
                    // final response = await http.post(
                    //     url,
                    // body: <String, String> {
                    //   'loginId': 'user_id_value',
                    //   'password': 'user_pwd_value',
                    //   'email' : 'email2@gmail.com',
                    // },
                    // headers : <String, String> {
                    //   'Content-Type': 'application/json'
                    //   },
                    // );
                    //
                    // print('Response status: ${response.statusCode}');
                    // print('Response body: ${response.body}');

                    // showDialog(
                    //   context: context,
                    //   builder: (BuildContext context) => _buildPopupDialog(context),
                    // );
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
            Text('Powered by padonan.',
              style: TextStyle(color: Colors.white,fontSize: 12),),
          ],
        ),
      ),
    );
  }

  Widget _buildPopupDialog(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColor.appPURPLE,
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