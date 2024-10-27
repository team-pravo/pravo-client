import 'package:flutter/material.dart';
import 'package:pravo_client/assets/constants.dart';
import 'package:pravo_client/features/promises/presentation/screens/promise_detail_screen.dart';

class PromiseWidget extends StatelessWidget {
  const PromiseWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // 약속 상세 페이지로 이동
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const PromiseDetailScreen(),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(
          top: 24,
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 20,
        ),
        decoration: BoxDecoration(
          color: kWidgetBackgroundColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: kAvatarBackgroundColor,
                      child: Padding(
                        padding: const EdgeInsets.all(6),
                        child: Image.asset(
                          'assets/images/avocado.png',
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 12),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '아보카도 농장 체험',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            'Mr. Avocado',
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const Icon(Icons.chevron_right_rounded),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(
                top: 32,
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_today_rounded,
                        size: 20,
                        color: kPrimaryColor,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        '10월 1일, 12:00AM',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        size: 20,
                        color: kPrimaryColor,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        '아보카도 농장',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
