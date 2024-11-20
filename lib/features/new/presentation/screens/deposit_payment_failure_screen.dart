import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:pravo_client/assets/constants.dart';
import 'package:pravo_client/features/core/presentation/widgets/depth2_app_bar_widget.dart';
import 'package:pravo_client/features/core/presentation/widgets/primary_button_widget.dart';

class DepositPaymentFailureScreen extends StatelessWidget {
  final String errorCode;
  final String errorMessage;

  const DepositPaymentFailureScreen({
    super.key,
    required this.errorCode,
    required this.errorMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Depth2AppBarWidget(
        title: '결제 실패',
        actionIcon: PhosphorIcons.x(),
        actionOnPressed: () => context.go('/'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: kScreenPadding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    const Row(
                      children: [
                        Text(
                          '결제가 실패했습니다.',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      errorMessage,
                      style: const TextStyle(
                        fontSize: 14,
                        color: kBodyTextColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            PrimaryButtonWidget(
              buttonText: '홈으로 이동하기',
              onTap: () => context.go('/'),
              hasHorizontalMargin: true,
            ),
          ],
        ),
      ),
    );
  }
}
