import 'package:asc_portfolio/pages/admin/admin_main_screen.dart';
import 'package:asc_portfolio/pages/cafe/select_cafe_page.dart';
import 'package:asc_portfolio/pages/home/seat_screen.dart';
import 'package:asc_portfolio/pages/login/login_screen.dart';
import 'package:asc_portfolio/pages/main_screen.dart';
import 'package:asc_portfolio/pages/payment/payment_screen.dart';
import 'package:asc_portfolio/pages/signup/sign_up_screen.dart';
import 'package:asc_portfolio/provider/home_state/home_state_notifier.dart';
import 'package:asc_portfolio/service/notification_service.dart';
import 'package:asc_portfolio/style/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:logger/logger.dart';

void main() async {
  await initializeDateFormatting('ko_KR');
  WidgetsFlutterBinding.ensureInitialized();
  await initNotificationSettings();

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

final logger = Logger(
  printer: PrettyPrinter(
    colors: true,
  ),
);

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = GoRouter(
      initialLocation: '/login',
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const MainScreen(),
          routes: [
            GoRoute(
              path: 'seat',
              builder: (context, state) => const SeatScreen(),
            ),
          ],
        ),
        GoRoute(
          path: '/login',
          builder: (context, state) => const LoginScreen(),
          redirect: (context, state) {
            final userLogin = ref.watch(homeStateProvider).loginCheck;

            if (userLogin) {
              return '/';
            } else {
              return '/login';
            }
          },
        ),
        GoRoute(
          path: '/sign_up',
          builder: (context, state) => SignupPage(),
        ),
        GoRoute(
          path: '/admin',
          builder: (context, state) => const AdminMainPage(),
        ),
        GoRoute(
          path: '/cafe_page',
          builder: (context, state) => SelectCafeScreen(),
        ),
        GoRoute(
          path: '/payment',
          builder: (context, state) => const PaymentPage(),
        ),
      ],
    );

    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      theme: lightTheme(),
      themeMode: ThemeMode.light,
    );
  }
}

// create defalut ThemeData for light theme
ThemeData lightTheme() {
  return ThemeData(
    primarySwatch: createMaterialColor(AppColor.appPurple),
    primaryColor: AppColor.appPurple,
    buttonTheme: const ButtonThemeData(
      buttonColor: AppColor.appPurple,
      textTheme: ButtonTextTheme.primary,
      disabledColor: Colors.grey,
    ),
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColor.appPurple,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
      ),
    ),
    fontFamily: 'Jalnan',
  );
}
