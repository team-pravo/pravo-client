import 'package:flutter/material.dart';
import 'package:pravo_client/features/core/presentation/widgets/promise_widget.dart';
import 'package:pravo_client/features/home/domain/entities/home.dart';

class TodayPromisesOverviewWidget extends StatelessWidget {
  final List<TodayPromise> todayPromises;

  const TodayPromisesOverviewWidget({
    super.key,
    required this.todayPromises,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          todayPromises.isEmpty ? '오늘은 약속이 없네요!' : '오늘의 약속',
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 12),
        ...todayPromises.map((promise) {
          return PromiseWidget(
            promiseId: promise.id,
            promiseName: promise.name,
            location: promise.location,
            organizerName: promise.organizerName,
            scheduledAt: promise.scheduledAt,
            organizerProfileImageUrl: promise.organizerProfileImageUrl,
          );
        }),
      ],
    );
  }
}
