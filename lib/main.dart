import 'package:asc_portfolio/pages/admin/admin_main_page.dart';
import 'package:asc_portfolio/pages/home_page.dart';
import 'package:asc_portfolio/pages/login/login_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      routes: {
        '/HomePage': (context) => const HomePage(),
        '/LoginPage': (context) => LoginDemo(),
        '/AdminMainPage': (context) => const AdminMainPage(),
      },
    );
  }
}
