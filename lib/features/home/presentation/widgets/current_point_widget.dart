import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:pravo_client/app/formatter.dart';
import 'package:pravo_client/assets/constants.dart';
import 'package:pravo_client/features/core/presentation/widgets/currency_display_widget.dart';

class CurrentPointWidget extends StatelessWidget {
  final int points;

  const CurrentPointWidget({
    super.key,
    required this.points,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: kWidgetPadding,
      decoration: BoxDecoration(
        color: kWidgetBackgroundColor,
        borderRadius: kWidgetBorderRadius,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          PhosphorIcon(
            PhosphorIcons.wallet(PhosphorIconsStyle.fill),
            size: 24,
            color: kPrimaryColor,
          ),
          const SizedBox(
            width: 16,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '현재 보유한 포인트',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              CurrencyDisplayWidget(
                value: Formatter.formatWithComma(points),
                unit: 'P',
                color: kPrimaryColor,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
