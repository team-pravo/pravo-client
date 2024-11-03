import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:pravo_client/assets/constants.dart';
import 'package:pravo_client/features/core/presentation/widgets/depth2_app_bar_widget.dart';
import 'package:pravo_client/features/core/presentation/widgets/primary_button_widget.dart';

class DepositPaymentCompleteScreen extends StatelessWidget {
  const DepositPaymentCompleteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Depth2AppBarWidget(
        title: '결제 완료',
        actionIcon: PhosphorIcons.x(),
        actionOnPressed: () => context.pop(),
      ),
      body: SafeArea(
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
                    '10,000원',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: kPrimaryColor,
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    '결제가 완료되어',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const Text(
                '약속이 생성되었습니다.',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                '약속 정보를 상세 페이지에서 확인해 보세요!',
                style: TextStyle(
                  fontSize: 14,
                  color: kBodyTextColor,
                ),
              ),
              const Spacer(
                flex: 1,
              ),
              PrimaryButtonWidget(
                buttonText: '약속 확인하기',
                onTap: () => context.push('/promise/1'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
