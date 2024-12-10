import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pravo_client/features/auth/presentation/screens/login_screen.dart';
import 'package:pravo_client/features/auth/presentation/viewmodels/auth_provider.dart';
import 'package:pravo_client/features/error/presentation/screens/error_screen.dart';
import 'package:pravo_client/features/home/presentation/screens/home_screen.dart';
import 'package:pravo_client/features/join/presentation/screens/join_complete_screen.dart';
import 'package:pravo_client/features/join/presentation/screens/join_deposit_screen.dart';
import 'package:pravo_client/features/member/domain/entities/member.dart';
import 'package:pravo_client/features/new/presentation/screens/deposit_payment_complete_screen.dart';
import 'package:pravo_client/features/new/presentation/screens/deposit_payment_screen.dart';
import 'package:pravo_client/features/new/presentation/screens/new_details_screen.dart';
import 'package:pravo_client/features/new/presentation/screens/new_screen.dart';
import 'package:pravo_client/features/payment-log/presentation/screens/payment_log_screen.dart';
import 'package:pravo_client/features/point-log/presentation/screens/point_log_screen.dart';
import 'package:pravo_client/features/promise/presentation/screens/promise_detail_screen.dart';
import 'package:pravo_client/features/promises/presentation/screens/promises_screen.dart';
import 'package:pravo_client/features/setting/presentation/screens/profile_edit_screen.dart';
import 'package:pravo_client/features/setting/presentation/screens/setting_screen.dart';
import 'package:pravo_client/features/settlement/presentation/screens/confirm_attendance_screen.dart';
import 'package:pravo_client/features/settlement/presentation/screens/settlement_complete_screen.dart';
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
      routes: [
        GoRoute(
          path: 'join/deposit',
          builder: (_, __) => const JoinDepositScreen(),
        ),
        GoRoute(
          path: 'join/complete',
          builder: (_, __) => const JoinCompleteScreen(),
        ),
        GoRoute(
          path: 'settlement/confirm',
          builder: (_, state) {
            final promiseId = int.parse(state.pathParameters['promiseId']!);
            return ConfirmAttendanceScreen(promiseId: promiseId);
          },
        ),
        GoRoute(
          path: 'settlement/complete',
          builder: (_, state) {
            final promiseId = int.parse(state.pathParameters['promiseId']!);
            return SettlementCompleteScreen(promiseId: promiseId);
          },
        ),
      ],
    ),
    GoRoute(
      path: '/new',
      builder: (_, __) => const NewScreen(),
      routes: [
        GoRoute(
          path: 'details',
          builder: (_, __) => const NewDetailsScreen(),
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
      path: '/payment-log',
      builder: (_, __) => const PaymentLogScreen(),
    ),
    GoRoute(
      path: '/point-log',
      builder: (_, __) => const PointLogScreen(),
    ),
    GoRoute(
      path: '/profile/edit',
      builder: (context, state) {
        final member = state.extra as Member;
        return ProfileEditScreen(member: member);
      },
    ),
    GoRoute(
      path: '/error',
      builder: (_, state) {
        final data = state.extra! as Map<String, dynamic>;
        return ErrorScreen(
          appBarTitle: data['appBarTitle'],
          errorTitle: data['errorTitle'],
          errorMessage: data['errorMessage'],
        );
      },
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
    redirect: (_, state) => redirectLogic(authNotifier, state),
    refreshListenable: authNotifier,
    errorBuilder: (context, state) {
      return const ErrorScreen(
        appBarTitle: '페이지 오류',
        errorTitle: '찾을 수 없는 페이지',
        errorMessage: '요청하신 페이지가 존재하지 않습니다.',
      );
    },
  );
});
