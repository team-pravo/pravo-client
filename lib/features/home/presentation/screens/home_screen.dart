import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pravo_client/features/core/presentation/widgets/depth1_app_bar_widget.dart';
import 'package:pravo_client/features/core/presentation/widgets/navigation_bar_widget.dart';
import 'package:pravo_client/features/core/presentation/widgets/promise_widget.dart';
import 'package:pravo_client/features/home/presentation/widgets/my_point_widget.dart';
import 'package:pravo_client/features/home/presentation/widgets/upcoming_promises_widget.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: Depth1AppBarWidget(
        title: '홈',
        actionIcon: Icons.notifications_none_rounded,
        actionOnPressed: () {},
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 30,
            horizontal: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '오늘의 약속',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
              // 약속 위젯
              PromiseWidget(),
              // 현재 포유한 포인트
              MyPointWidget(),
              // 다가오는 약속
              UpcomingPromisesWidget(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const NavigationBarWidget(),
    );
  }
}
