import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:pravo_client/assets/constants.dart';
import 'package:pravo_client/features/core/presentation/widgets/currency_display_widget.dart';

class CurrentPointWidget extends StatelessWidget {
  const CurrentPointWidget({
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
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '현재 보유한 포인트',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              CurrencyDisplayWidget(
                value: '10,000',
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
