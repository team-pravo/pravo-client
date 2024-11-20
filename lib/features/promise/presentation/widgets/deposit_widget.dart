import 'package:flutter/material.dart';
import 'package:pravo_client/app/formatter.dart';
import 'package:pravo_client/features/core/presentation/widgets/currency_display_widget.dart';
import 'package:pravo_client/features/core/presentation/widgets/divider_with_padding_widget.dart';

class DepositWidget extends StatelessWidget {
  final int deposit;
  const DepositWidget({
    super.key,
    required this.deposit,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              '예약금',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            CurrencyDisplayWidget(
              value: Formatter.formatWithComma(deposit),
              unit: '원',
              fontWeight: FontWeight.w400,
            ),
          ],
        ),
        const DividerWithPaddingWidget(
          paddingHeight: 30,
        ),
      ],
    );
  }
}
