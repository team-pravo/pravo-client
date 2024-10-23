import 'package:flutter/material.dart';
import 'package:pravo_client/assets/constants.dart';

class MyPointWidget extends StatelessWidget {
  const MyPointWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '현재 보유한 포인트',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          Row(
            children: [
              Icon(
                Icons.wallet,
                size: 20,
                color: kPrimaryColor,
              ),
              SizedBox(
                width: 4,
              ),
              Text(
                '10,000',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
