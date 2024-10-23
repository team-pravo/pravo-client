import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pravo_client/features/auth/presentation/screens/login_screen.dart';
import 'package:pravo_client/features/auth/presentation/viewmodels/auth_provider.dart';
import 'package:pravo_client/features/home/presentation/screens/home_screen.dart';
import 'package:pravo_client/features/setting/presentation/screens/setting_screen.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final authNotifier = ref.read(authProvider);

  return GoRouter(
    routes: _routes,
    redirect: (_, state) =>
        _redirectLogic(authNotifier, state), // navigate될 때마다 호출
    refreshListenable:
        authNotifier, // authProvider 상태를 listen하여 상태가 변하면 redirect 실행
  );
});

// 라우트 정의
List<GoRoute> get _routes {
  return [
    GoRoute(
      path: '/',
      builder: (_, __) => const HomeScreen(),
    ),
    GoRoute(
      path: '/login',
      builder: (_, __) => const LoginScreen(),
    ),
    GoRoute(
      path: '/setting',
      builder: (_, __) => const SettingScreen(),
    ),
  ];
}

// 로그인 상태에 따른 리디렉션 로직
Future<String?> _redirectLogic(
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
