import 'package:flutter/material.dart';
import 'package:pravo_client/assets/constants.dart';
import 'package:pravo_client/features/core/presentation/widgets/vertical_gap_widget.dart';

class LogWidget extends StatelessWidget {
  final String title;
  final String amount;
  final String type;
  final String loggedAt;
  final bool isAmountPrimaryColor;

  const LogWidget({
    super.key,
    required this.title,
    required this.amount,
    required this.type,
    required this.loggedAt,
    required this.isAmountPrimaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
            Text(
              amount,
              style: TextStyle(
                color: isAmountPrimaryColor
                    ? kPrimaryColor
                    : const Color.fromRGBO(201, 201, 201, 1),
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const VerticalGapWidget(
          gapHeight: 4,
        ),
        Row(
          children: [
            Text(
              '$type • $loggedAt',
              style: const TextStyle(
                fontSize: 14,
                color: kBodyTextColor,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
