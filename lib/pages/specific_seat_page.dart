import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../style/app_color.dart';

class SpecificSeatPage extends StatelessWidget {
  const SpecificSeatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.appPURPLE,
          title: Text('시간 선택', style: TextStyle(fontWeight: FontWeight.w300,color: Colors.white,fontSize: 20),),
          shadowColor: Colors.white,
          elevation: 1,
        ),
        body: ListView(
            children:[
              ListTile(
                selectedColor: Colors.grey,
                leading: Icon(Icons.looks_two_rounded, size: 40,color: Colors.black,),
                title: Text('2시간'),
                subtitle: const Text('2,000원 , 자유이용권은 무료'),
                trailing: Icon(Icons.chevron_right, color: Colors.black),
                onTap: () {
                },
              ),
              const Divider(
                color: Colors.grey,
              ),
              ListTile(
                selectedColor: Colors.grey,
                leading: Icon(Icons.looks_4_rounded, size: 40,color: Colors.black,),
                title: Text('4시간'),
                subtitle: const Text('4,000원 , 자유이용권은 무료'),
                trailing: Icon(Icons.chevron_right, color: Colors.black),
                onTap: () {
                },
              ),
              const Divider(
                color: Colors.grey,
              ),
              ListTile(
                selectedColor: Colors.grey,
                leading: Icon(Icons.looks_6_rounded, size: 40,color: Colors.black,),
                title: Text('6시간'),
                subtitle: const Text('6,000원 , 자유이용권은 무료'),
                trailing: Icon(Icons.chevron_right, color: Colors.black),
                onTap: () {
                },
              ),
              const Divider(
                color: Colors.grey,
              ),
              ListTile(
                selectedColor: Colors.grey,
                leading: Icon(Icons.more_time, size: 40,color: Colors.black,),
                title: Text('9시간'),
                subtitle: const Text('9,000원 , 자유이용권은 무료'),
                trailing: Icon(Icons.chevron_right, color: Colors.black),
                onTap: () {
                },
              ),
              const Divider(
                color: Colors.grey,
              ),
              ListTile(
                selectedColor: Colors.grey,
                leading: Icon(Icons.bedtime_outlined, size: 40,color: Colors.black,),
                title: Text('12시간'),
                subtitle: const Text('12,000원 , 자유이용권은 무료'),
                trailing: Icon(Icons.chevron_right, color: Colors.black),
                onTap: () {
                },
              ),
              const Divider(
                color: Colors.grey,
              ),
              ListTile(
                selectedColor: Colors.grey,
                leading: Icon(Icons.timer, size: 40,color: Colors.black,),
                title: Text('24시간'),
                subtitle: const Text('24,000원 , 자유이용권은 무료'),
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
}
