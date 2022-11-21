import 'package:asc_portfolio/common_enum/cafe_name_enum/cafe_name.dart';
import 'package:asc_portfolio/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  static String cafeName = CafeNameType.seoul.name;

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
