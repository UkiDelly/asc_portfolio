import 'package:asc_portfolio/constant/enum/user/user_enum.dart';
import 'package:asc_portfolio/provider/home_state/home_state_notifier.dart';
import 'package:asc_portfolio/provider/secure_storage_provider.dart';
import 'package:asc_portfolio/server/repository/user_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';

import '../pages/admin/admin_main_screen.dart';
import '../pages/cafe/select_cafe_screen.dart';
import '../pages/home/seat_screen.dart';
import '../pages/login/login_screen.dart';
import '../pages/main_screen.dart';
import '../pages/payment/payment_screen.dart';
import '../pages/signup/sign_up_screen.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/login',
    redirect: (context, state) async {
      final bool userLogin = await ref.watch(userRepoProvider).getCheckLogin();
      final FlutterSecureStorage storage = ref.read(secureStorageProvider);

      final RoleType roleType =
          RoleTypeExtension.getRoleType(await storage.read(key: 'roleType') ?? '');

      if (userLogin) {
        if (roleType == RoleType.admin) {
          return '/admin';
        } else if (roleType == RoleType.user) {
          return '/';
        } else if (roleType == RoleType.none) {
          return null;
        }
      }
      return null;
    },
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
});
