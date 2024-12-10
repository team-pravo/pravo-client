import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
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
        if (todayPromises.isNotEmpty)
          CarouselSlider(
            options: CarouselOptions(
              height: 120,
              enableInfiniteScroll: false,
              enlargeCenterPage: false,
              viewportFraction: 1,
              autoPlay: true,
            ),
            items: todayPromises.map((promise) {
              return Builder(
                builder: (BuildContext context) {
                  return PromiseWidget(
                    promiseId: promise.id,
                    promiseName: promise.name,
                    location: promise.location,
                    organizerName: promise.organizerName,
                    scheduledAt: promise.scheduledAt,
                    organizerProfileImageUrl: promise.organizerProfileImageUrl,
                  );
                },
              );
            }).toList(),
          ),
      ],
    );
  }
}
