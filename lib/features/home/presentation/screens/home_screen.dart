import 'package:flutter/material.dart';
import 'package:pravo_client/features/home/presentation/widgets/my_point_widget.dart';
import 'package:pravo_client/features/home/presentation/widgets/promise_widget.dart';
import 'package:pravo_client/features/home/presentation/widgets/upcoming_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "홈",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            Icon(Icons.notifications_none_rounded)
          ],
        ),
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
              PromiseWidget(),
              // 현재 포유한 포인트
              MyPointWidget(),
              const UpcomingWidget()
              // 다가오는 약속
            ],
          ),
        ),
      ),
    );
  }
}
