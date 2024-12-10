import 'package:flutter/widgets.dart';
import 'package:pravo_client/app/formatter.dart';
import 'package:pravo_client/assets/constants.dart';
import 'package:pravo_client/features/core/presentation/widgets/currency_display_widget.dart';

class RefundAmountWidget extends StatelessWidget {
  final int deposit;

  const RefundAmountWidget({super.key, required this.deposit});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: kWidgetPadding,
      decoration: BoxDecoration(
        color: kWidgetBackgroundColor,
        borderRadius: kWidgetBorderRadius,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '환불 예정 금액',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  '3일 이내에 결제가 취소될 예정입니다.',
                  style: TextStyle(color: kBodyTextColor),
                ),
              ],
            ),
          ),
          CurrencyDisplayWidget(
            value: Formatter.formatWithComma(deposit),
            unit: '원',
          ),
        ],
      ),
    );
  }
}
