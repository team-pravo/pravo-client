import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pravo_client/features/auth/presentation/screens/login_screen.dart';
import 'package:pravo_client/features/auth/presentation/viewmodels/user_provider.dart';
import 'package:pravo_client/features/home/presentation/home_screen.dart';
import 'package:pravo_client/features/setting/presentation/setting_screen.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final authProvider =
      _AuthNotifier(ref: ref); // authProvider의 상태가 변경될 때마다 redirection

  return GoRouter(
    routes: authProvider._routes,
    redirect: authProvider._redirectLogic, // navigate될 때마다 호출
    refreshListenable:
        authProvider, // authProvider 상태를 listen하여 상태가 변하면 redirect 실행
  );
});

class _AuthNotifier extends ChangeNotifier {
  final Ref ref;

  _AuthNotifier({required this.ref}) {
    // UserModel의 상태를 listen
    // userProvider 상태가 변경되면 notifyListeners 호출
    ref.listen(userProvider, (previous, next) {
      if (previous != next) {
        notifyListeners();
      }
    });
  }

  Future<String?> _redirectLogic(_, GoRouterState state) async {
    final user = ref.read(userProvider); // 현재 로그인한 사용자의 상태
    const loginPath = '/login';
    final loggingIn = state.uri.toString() == loginPath; // 현재 경로가 로그인 경로인지 확인

    if (user == null) {
      // 사용자가 로그인하지 않은 경우, 로그인 페이지로 리디렉션
      return loggingIn ? null : loginPath;
    }

    if (loggingIn) {
      // 사용자가 로그인한 경우, 현재 경로가 로그인 페이지인 경우, 메인으로 리디렉션
      return '/';
    }

    // 사용자가 로그인하고, 현재 경로가 로그인 페이지가 아닌 경우에는 리디렉션 할 필요없음
    return null;
  }

  List<GoRoute> get _routes => [
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
