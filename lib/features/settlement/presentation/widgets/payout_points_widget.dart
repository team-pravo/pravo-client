import 'package:flutter/widgets.dart';
import 'package:pravo_client/app/formatter.dart';
import 'package:pravo_client/assets/constants.dart';
import 'package:pravo_client/features/core/presentation/widgets/currency_display_widget.dart';

class PayoutPointsWidget extends StatelessWidget {
  final int absentCount;
  final int deposit;
  final int attendanceCount;
  final int earnedPoint;

  const PayoutPointsWidget({
    super.key,
    required this.absentCount,
    required this.deposit,
    required this.attendanceCount,
    required this.earnedPoint,
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '지급 포인트',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  '참석하지 않은 $absentCount명의 예약금 ${absentCount * deposit}원이 $attendanceCount명한테 ${earnedPoint}P씩 분배되었습니다.',
                  style: const TextStyle(color: kBodyTextColor),
                ),
              ],
            ),
          ),
          CurrencyDisplayWidget(
            value: '+${Formatter.formatWithComma(earnedPoint)}',
            unit: 'P',
          ),
        ],
      ),
    );
  }
}
