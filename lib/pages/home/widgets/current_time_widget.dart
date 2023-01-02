import 'dart:async';

import 'package:asc_portfolio/style/app_color.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CurrentTime extends StatefulWidget {
  const CurrentTime({super.key});

  @override
  State<CurrentTime> createState() => _CurrentTimeState();
}

class _CurrentTimeState extends State<CurrentTime> {
  String currentTime = '';
  late Timer timer;

  void getCurrentTime() {
    setState(() {
      currentTime = DateFormat('yyyy년 MM월 dd일 (E) a h시 mm분 ss초 ', 'ko_KR').format(DateTime.now());
    });
  }

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) => {getCurrentTime()});
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColor.appPurple,
      margin: const EdgeInsets.all(15),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: 
        Text(
          '현재시간 : $currentTime',
          style: const TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 13,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
