import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pravo_client/features/auth/presentation/screens/login_screen.dart';
import 'package:pravo_client/features/auth/presentation/viewmodels/auth_provider.dart';
import 'package:pravo_client/features/home/presentation/screens/home_screen.dart';
import 'package:pravo_client/features/new/presentation/screens/deposit_payment_complete_screen.dart';
import 'package:pravo_client/features/new/presentation/screens/deposit_payment_screen.dart';
import 'package:pravo_client/features/new/presentation/screens/new_screen.dart';
import 'package:pravo_client/features/promises/presentation/screens/promise_detail_screen.dart';
import 'package:pravo_client/features/promises/presentation/screens/promises_screen.dart';
import 'package:pravo_client/features/setting/presentation/screens/profile_edit_screen.dart';
import 'package:pravo_client/features/setting/presentation/screens/setting_screen.dart';
import 'package:pravo_client/features/store/presentation/screens/store_screen.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final authNotifier = ref.read(authProvider);

  final routes = [
    GoRoute(
      path: '/',
      builder: (_, __) => const HomeScreen(),
    ),
    GoRoute(
      path: '/login',
      builder: (_, __) => const LoginScreen(),
    ),
    GoRoute(
      path: '/promises',
      builder: (_, __) => const PromisesScreen(),
    ),
    GoRoute(
      path: '/promise/:promiseId',
      builder: (_, state) {
        final promiseId = int.parse(state.pathParameters['promiseId']!);
        return PromiseDetailScreen(promiseId: promiseId);
      },
    ),
    GoRoute(
      path: '/new',
      builder: (_, __) => const NewScreen(),
      routes: [
        GoRoute(
          path: 'details',
          builder: (_, __) => const DepositPaymentCompleteScreen(),
        ),
        GoRoute(
          path: 'deposit',
          builder: (_, __) => const DepositPaymentScreen(),
          routes: [
            GoRoute(
              path: 'complete',
              builder: (_, __) => const DepositPaymentCompleteScreen(),
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      path: '/store',
      builder: (_, __) => const StoreScreen(),
    ),
    GoRoute(
      path: '/setting',
      builder: (_, __) => const SettingScreen(),
    ),
    GoRoute(
      path: '/profile/edit',
      builder: (_, __) => const ProfileEditScreen(),
    ),
  ];

  // 로그인 상태에 따른 리디렉션 로직
  Future<String?> redirectLogic(
    AuthNotifier authNotifier,
    GoRouterState state,
  ) async {
    const loginPath = '/login';
    final isTokenValid = await authNotifier.isTokenValid();

    /// 현재 경로가 로그인 경로라면
    if (state.uri.toString() == loginPath) {
      return isTokenValid ? '/' : null;
    }

    return isTokenValid ? null : loginPath;
  }

  return GoRouter(
    routes: routes,
    redirect: (_, state) =>
        redirectLogic(authNotifier, state), // navigate될 때마다 호출
    refreshListenable:
        authNotifier, // authProvider 상태를 listen하여 상태가 변하면 redirect 실행
  );
});
