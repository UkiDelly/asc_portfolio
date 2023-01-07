import 'package:asc_portfolio/constant/assets.dart';
import 'package:asc_portfolio/constant/enum/help-center/category_enum.dart';
import 'package:asc_portfolio/pages/help_center/faq_screen.dart';
import 'package:asc_portfolio/pages/help_center/help_acount_screen.dart';
import 'package:asc_portfolio/pages/help_center/help_center_etc.dart';
import 'package:asc_portfolio/pages/help_center/help_center_screen.dart';
import 'package:asc_portfolio/pages/help_center/help_payment_screen.dart';
import 'package:asc_portfolio/pages/help_center/help_useage_screen.dart';
import 'package:asc_portfolio/pages/main_screen.dart';
import 'package:asc_portfolio/pages/seat/change_seat_screen.dart';
import 'package:asc_portfolio/service/notification_service.dart';
import 'package:asc_portfolio/style/app_color.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:logger/logger.dart';

import 'constant/enum/user/user_enum.dart';
import 'firebase_options.dart';
import 'pages/admin/admin_main_screen.dart';
import 'pages/cafe/select_cafe_screen.dart';
import 'pages/home/seat_screen.dart';
import 'pages/login/login_screen.dart';
import 'pages/payment/payment_screen.dart';
import 'pages/signup/sign_up_screen.dart';
import 'provider/login_state/login_state.dart';
import 'provider/secure_storage_provider.dart';

final logger = Logger(
  printer: PrettyPrinter(
    methodCount: 0,
    errorMethodCount: 8,
    lineLength: 120,
    colors: true,
    printEmojis: true,
    printTime: true,
  ),
);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initNotificationSettings();
  await initializeDateFormatting('ko_KR');
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  String? fcmToken = await FirebaseMessaging.instance.getToken(
    vapidKey:
        'BBOfhbB8XaVcQDzGng2qYz2-PeqRGB9rzym_lEzJGQp9JUhBRnMaiqBEntIJH8AjEl3pzIS8_ylW6gcZXByl8L8',
  );
  print('fcmToken=$fcmToken');
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

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
            final userLogin = ref.watch(loginStateProvider).loginCheck;

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
              builder: (context, state) => const HelpPaymentScreen(),
            ),
            GoRoute(
              path: 'useage',
              builder: (context, state) => const HelpUseageScreen(),
            ),
            GoRoute(
              path: 'etc',
              builder: (context, state) => const HelpEtcScreen(),
            ),
            GoRoute(
              path: 'account',
              builder: (context, state) => const HelpAccountScreen(),
            ),
            GoRoute(
              path: 'support/:category',
              builder: (context, state) {
                final ProblemCategory category = ProblemCategoryExtension.stringToEnum(
                  state.params['category']!,
                );
                return FAQScreen(
                  category: category,
                );
              },
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
