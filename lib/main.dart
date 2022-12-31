import 'package:asc_portfolio/constant/assets.dart';
import 'package:asc_portfolio/pages/help_center/help_center_screen.dart';
import 'package:asc_portfolio/pages/main_screen.dart';
import 'package:asc_portfolio/pages/seat/change_seat_screen.dart';
import 'package:asc_portfolio/service/notification_service.dart';
import 'package:asc_portfolio/style/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:logger/logger.dart';

import 'constant/enum/user/user_enum.dart';
import 'pages/admin/admin_main_screen.dart';
import 'pages/cafe/select_cafe_screen.dart';
import 'pages/home/seat_screen.dart';
import 'pages/login/login_screen.dart';
import 'pages/payment/payment_screen.dart';
import 'pages/signup/sign_up_screen.dart';
import 'provider/home_state/home_state_notifier.dart';
import 'provider/home_state/login_state.dart';
import 'provider/secure_storage_provider.dart';

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
      debugLogDiagnostics: true,
      initialLocation: '/',
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => Container(
            color: AppColor.appPurple,
            child: Center(
              child: Image.asset(AppAssets.splashLogo),
            ),
          ),
          redirect: (context, state) async {
            ref.read(checkUserLoginProvider);
            final bool userLogin = ref.watch(loginStateProvider).loginCheck;

            if (userLogin) {
              final FlutterSecureStorage storage = ref.read(secureStorageProvider);
              final RoleType roleType =
                  RoleTypeExtension.getRoleType(await storage.read(key: 'roleType') ?? '');

              if (roleType == RoleType.admin) {
                return '/admin';
              } else if (roleType == RoleType.user) {
                return '/user';
              } else if (roleType == RoleType.none) {
                return null;
              }
            } else {
              return '/login';
            }
            return state.path;
          },
        ),
        GoRoute(
          path: '/user',
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
            ref.refresh(checkUserLoginProvider);
            final userLogin = ref.watch(homeStateProvider).loginCheck;

            if (userLogin) {
              return '/user';
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
        GoRoute(
          path: '/change_seat',
          builder: (context, state) => const ChangeSeatScreen(),
        ),
        GoRoute(
          path: '/help_center',
          builder: (context, state) => HelpCenterScreen(),
          routes: [
            GoRoute(
              path: 'payment',
              builder: (context, state) => Container(),
            ),
            GoRoute(
              path: 'useage',
              builder: (context, state) => Container(),
            ),
            GoRoute(
              path: 'faq',
              builder: (context, state) => Container(),
            ),
            GoRoute(
              path: 'account',
              builder: (context, state) => Container(),
            ),
          ],
        )
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
