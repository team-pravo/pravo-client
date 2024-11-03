import 'package:flutter/material.dart';
import 'package:pravo_client/assets/constants.dart';

class UpcomingPromisesWidget extends StatelessWidget {
  const UpcomingPromisesWidget({
    super.key,
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
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '다가오는 약속',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 16,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Text('금요일'),
                    SizedBox(
                      width: 24,
                    ),
                    Text('아보카도 수확하기'),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Text('토요일'),
                    SizedBox(
                      width: 24,
                    ),
                    Text('아보카도 저녁 파티'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
