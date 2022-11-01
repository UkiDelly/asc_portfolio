import 'package:asc_portfolio/pages/home_page.dart';
import 'package:asc_portfolio/pages/login_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Jalnan',
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
