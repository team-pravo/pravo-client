import 'package:flutter/material.dart';
import 'package:pravo_client/features/core/presentation/widgets/promise_widget.dart';

class TodayPromisesOverviewWidget extends StatelessWidget {
  const TodayPromisesOverviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '오늘의 약속',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(
          height: 12,
        ),
        PromiseWidget(),
      ],
    );
  }
}
