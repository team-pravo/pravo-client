import 'package:flutter/material.dart';
import 'package:pravo_client/app/formatter.dart';
import 'package:pravo_client/features/core/presentation/widgets/currency_display_widget.dart';
import 'package:pravo_client/features/core/presentation/widgets/divider_with_padding_widget.dart';

class PromiseStatusWidget extends StatelessWidget {
  final int? settlementAmount;

  const PromiseStatusWidget({super.key, this.settlementAmount});

  @override
  Widget build(BuildContext context) {
    if (settlementAmount == null) {
      return const SizedBox.shrink();
    }

    return Column(
      children: [
        const DividerWithPaddingWidget(
          paddingHeight: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              '정산 완료',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            CurrencyDisplayWidget(
              value: Formatter.formatWithComma(settlementAmount!),
              unit: settlementAmount! < 0 ? '원' : 'P',
              fontWeight: FontWeight.w400,
            ),
          ],
        ),
      ],
    );
  }
}
