import 'package:flutter/material.dart';
import 'package:pravo_client/features/core/presentation/widgets/currency_display_widget.dart';

class PromiseStatusWidget extends StatelessWidget {
  const PromiseStatusWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '정산 완료',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        CurrencyDisplayWidget(
          value: '+333',
          unit: 'P',
          fontWeight: FontWeight.w400,
        ),
      ],
    );
  }
}
