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
        actionOnPressed: () => context.go('/'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const Expanded(
              child: Padding(
                padding: kScreenPadding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Row(
                      children: [
                        Text(
                          '🎉 새로운 약속이 생성되었습니다!',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      '이제 친구들을 초대하여 즐거운 약속을 시작해보세요!\n\n아래 버튼을 통해 약속을 관리하고 초대 링크를 공유할 수 있습니다.',
                      style: TextStyle(
                        fontSize: 14,
                        color: kBodyTextColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            PrimaryButtonWidget(
              buttonText: '약속 확인하기',
              onTap: () => context.go('/promise/1'),
              hasHorizontalMargin: true,
            ),
          ],
        ),
      ),
    );
  }
}
