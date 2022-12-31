import 'package:asc_portfolio/pages/admin/admin_main_page.dart';
import 'package:asc_portfolio/pages/home_page.dart';
import 'package:asc_portfolio/pages/login/login_page.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
  var fcmToken = await FirebaseMessaging.instance.getToken(
    vapidKey: "BBOfhbB8XaVcQDzGng2qYz2-PeqRGB9rzym_lEzJGQp9JUhBRnMaiqBEntIJH8AjEl3pzIS8_ylW6gcZXByl8L8"
  );
  print("fcmToken="+fcmToken.toString());
}


class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      routes: {
        '/HomePage' : (context) => HomePage(),
        '/LoginPage' : (context) => LoginDemo(),
        '/AdminMainPage': (context) => AdminMainPage(),
      },
    );
  }
}
