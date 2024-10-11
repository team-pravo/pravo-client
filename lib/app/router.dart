import 'package:go_router/go_router.dart';
import 'package:pravo_client/features/auth/presentation/screens/login_screen.dart';
import 'package:pravo_client/features/setting/presentation/setting_screen.dart';

class PravoRouter {
  static GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: "/",
        builder: (_, __) => const LoginScreen(),
      ),
      GoRoute(
        path: "/setting",
        builder: (_, __) => const SettingScreen(),
      )
    ],
  );
}
