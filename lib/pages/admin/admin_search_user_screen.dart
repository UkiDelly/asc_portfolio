import 'package:flutter/material.dart';

import '../../style/app_color.dart';
import 'admin_searching_screen.dart';

class AdminSearchUserScreen extends StatefulWidget {
  const AdminSearchUserScreen({Key? key}) : super(key: key);

  @override
  State<AdminSearchUserScreen> createState() => _AdminSearchUserScreenState();
}

class _AdminSearchUserScreenState extends State<AdminSearchUserScreen> {
  TextEditingController loginIdController = TextEditingController();

  @override
  void dispose() {
    loginIdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const SizedBox(
            height: 100,
          ),
          FloatingActionButton.extended(
            backgroundColor: AppColor.appPurple,
            onPressed: () {},
            tooltip: 'salelist4',
            icon: const Icon(Icons.view_list_outlined),
            label: const Text(
              '사용자 검색',
              style: TextStyle(fontWeight: FontWeight.w300, fontSize: 16, color: Colors.white),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 50,
            width: 350,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextFormField(
                controller: loginIdController,
                cursorColor: Colors.black,
                keyboardType: TextInputType.name,
                autofocus: false,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: const BorderSide(
                      color: Colors.black,
                    ),
                  ),
                  focusColor: Colors.black,
                  filled: true,
                  fillColor: Colors.white,
                  hintText: '유저 로그인 ID',
                  contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: const BorderSide(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 40),
          Container(
            height: 50,
            width: 250,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(20),
            ),
            child: FloatingActionButton.extended(
              heroTag: 'Login',
              label: const Text('사용자 조회'), // <-- Text
              backgroundColor: Colors.black,
              onPressed: () async {
                print(loginIdController.text);
                if (loginIdController.text != '') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AdminSearchingPage(loginIdController.text),
                    ),
                  );
                }
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
