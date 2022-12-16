import 'package:asc_portfolio/pages/admin/admin_main_page.dart';
import 'package:asc_portfolio/pages/cafe/select_cafe_page.dart';
import 'package:asc_portfolio/pages/home/home.dart';
import 'package:asc_portfolio/pages/login/login_page.dart';
import 'package:asc_portfolio/pages/main_screen.dart';
import 'package:asc_portfolio/pages/payment/payment_page.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const MainScreen(),
      routes: [
        GoRoute(
          path: 'home',
          builder: (context, state) => const HomeScreen(),
        ),
      ],
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginDemo(),
    ),
    GoRoute(
      path: '/admin',
      builder: (context, state) => const AdminMainPage(),
    ),
    GoRoute(
      path: '/cafe_page',
      builder: (context, state) => SelectCafePage(),
    ),
    GoRoute(
      path: '/payment',
      builder: (context, state) => const PaymentPage(),
    ),
  ],
);
