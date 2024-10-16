import 'package:flutter/material.dart';

class MyPointWidget extends StatelessWidget {
  MyPointWidget({
    super.key,
  });

  Color primaryColor = const Color.fromRGBO(116, 167, 57, 1);

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
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "현재 보유한 포인트",
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
                color: primaryColor,
              ),
              const SizedBox(
                width: 4,
              ),
              const Text(
                "10,000",
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
