import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pravo_client/assets/constants.dart';
import 'package:pravo_client/features/core/presentation/widgets/depth2_app_bar_widget.dart';
import 'package:pravo_client/features/core/presentation/widgets/primary_button_widget.dart';
import 'package:pravo_client/features/new/presentation/viewmodels/promise_id_provider.dart';

class DepositPaymentCompleteScreen extends ConsumerWidget {
  const DepositPaymentCompleteScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const Depth2AppBarWidget(
        title: '결제 완료',
      ),
      body: SafeArea(
        child: Column(
          children: [
            const Expanded(
              child: Padding(
                padding: kScreenPadding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 70,
                    ),
                    Text(
                      '🎉',
                      style: TextStyle(fontSize: 50),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      '약속 생성 완료',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '아래 버튼을 통해 약속을 관리하고\n초대 링크를 공유하여 친구들을 초대해보세요!',
                      textAlign: TextAlign.center,
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
              onTap: () =>
                  context.go('/promise/${ref.read(promiseIdProvider)}'),
              hasHorizontalMargin: true,
            ),
          ],
        ),
      ),
    );
  }
}
