import 'package:flutter/material.dart';
import 'package:pravo_client/app/formatter.dart';
import 'package:pravo_client/assets/constants.dart';
import 'package:pravo_client/features/home/domain/entities/home.dart';

class UpcomingPromisesWidget extends StatelessWidget {
  final List<UpcomingPromise> upcomingPromises;

  const UpcomingPromisesWidget({
    super.key,
    required this.upcomingPromises,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: kWidgetPadding,
      decoration: BoxDecoration(
        color: kWidgetBackgroundColor,
        borderRadius: kWidgetBorderRadius,
      ),
      width: double.infinity,
      child: upcomingPromises.isEmpty
          ? const Text(
              '이번 주 다가오는 약속이 없어요.',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '다가오는 약속',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 16),
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: upcomingPromises.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 8),
                  itemBuilder: (context, index) {
                    final promise = upcomingPromises[index];
                    return Row(
                      children: [
                        Text(
                          Formatter.formatWeekDay(promise.scheduledAt), // 요일
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(width: 24),
                        Text(promise.name), // 약속 이름
                      ],
                    );
                  },
                ),
              ],
            ),

      // child: Column(
      //   crossAxisAlignment: CrossAxisAlignment.start,
      //   children: [
      //     Text(
      //       upcomingPromises.isEmpty ? '이번 주 다가오는 약속이 없어요.' : '다가오는 약속',
      //       style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
      //     ),
      //     if (upcomingPromises.isNotEmpty) const SizedBox(height: 16),
      //     ...upcomingPromises.map((promise) {
      //       return Row(
      //         children: [
      //           Text(
      //             Formatter.formatWeekDay(promise.scheduledAt), // 요일
      //             style: const TextStyle(fontWeight: FontWeight.bold),
      //           ),
      //           const SizedBox(width: 24),
      //           Text(promise.name), // 약속 이름
      //         ],
      //       );
      //     }),
      //   ],
      // ),
    );
  }
}
