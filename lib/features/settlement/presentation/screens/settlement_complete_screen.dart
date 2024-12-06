import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:pravo_client/assets/constants.dart';
import 'package:pravo_client/features/core/presentation/widgets/currency_display_widget.dart';
import 'package:pravo_client/features/core/presentation/widgets/depth2_app_bar_widget.dart';
import 'package:pravo_client/features/core/presentation/widgets/primary_button_widget.dart';

class SettlementCompleteScreen extends StatelessWidget {
  final int promiseId;

  const SettlementCompleteScreen({super.key, required this.promiseId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Depth2AppBarWidget(
        title: '정산 완료',
        actionIcon: PhosphorIcons.x(),
        actionOnPressed: () => context.go('/'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: kScreenPadding,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        '약속 정산이\n완료되었습니다.',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Container(
                        padding: kWidgetPadding,
                        decoration: BoxDecoration(
                          color: kWidgetBackgroundColor,
                          borderRadius: kWidgetBorderRadius,
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(
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
                            CurrencyDisplayWidget(value: '1,000', unit: '원'),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        padding: kWidgetPadding,
                        decoration: BoxDecoration(
                          color: kWidgetBackgroundColor,
                          borderRadius: kWidgetBorderRadius,
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '지급 포인트',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    '참석하지 않은 1명의 예약금 1,000원이 3명한테 333P씩 분배되었습니다.',
                                    style: TextStyle(color: kBodyTextColor),
                                  ),
                                ],
                              ),
                            ),
                            CurrencyDisplayWidget(value: '+333', unit: 'P'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            PrimaryButtonWidget(
              buttonText: '확인',
              onTap: () => context.push('/promise/$promiseId'),
              hasHorizontalMargin: true,
            ),
          ],
        ),
      ),
    );
  }
}
