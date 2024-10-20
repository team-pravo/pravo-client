import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:pravo_client/features/auth/presentation/viewmodels/auth_provider.dart';
import 'package:pravo_client/features/core/presentation/widgets/depth1_app_bar_widget.dart';
import 'package:pravo_client/features/core/presentation/widgets/navigation_bar_widget.dart';
import 'package:pravo_client/features/home/presentation/widgets/my_point_widget.dart';
import 'package:pravo_client/features/home/presentation/widgets/promise_widget.dart';
import 'package:pravo_client/features/home/presentation/widgets/upcoming_promises_widget.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 카카오톡 로그아웃
    Future<void> logout() async {
      final authNotifier = ref.read(authProvider);

      try {
        await UserApi.instance.logout();
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('로그아웃 성공, SDK에서 토큰 삭제')));
        await authNotifier.logout(); // 로그아웃 시 AuthNotifier의 상태 업데이트
      } catch (error) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('카카오톡으로 로그인 실패 $error')));
      }
    }

    return Scaffold(
      appBar: Depth1AppBarWidget(
        title: "홈",
        actionIcon: Icons.notifications_none_rounded,
        actionOnPressed: () {},
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 30,
            horizontal: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "오늘의 약속",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
              // 약속 위젯
              const PromiseWidget(),
              // 현재 포유한 포인트
              const MyPointWidget(),
              // 다가오는 약속
              const UpcomingPromisesWidget(),

              // 임시 로그아웃 버튼 [추후 삭제 예정]
              GestureDetector(
                onTap: logout,
                child: const Text("로그아웃"),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: const NavigationBarWidget(),
    );
  }
}
