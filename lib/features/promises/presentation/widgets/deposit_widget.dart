import 'package:flutter/material.dart';
import 'package:pravo_client/features/core/presentation/widgets/currency_display_widget.dart';

class DepositWidget extends StatelessWidget {
  const DepositWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '예약금',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        CurrencyDisplayWidget(
          value: '1,000',
          unit: '원',
          fontWeight: FontWeight.w400,
        ),
      ],
    );
  }
}
