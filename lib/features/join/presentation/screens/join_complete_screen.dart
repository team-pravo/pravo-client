import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pravo_client/assets/constants.dart';
import 'package:pravo_client/features/core/presentation/widgets/depth2_app_bar_widget.dart';
import 'package:pravo_client/features/core/presentation/widgets/primary_button_widget.dart';
import 'package:pravo_client/features/join/presentation/viewmodels/join_promise_view_model.dart';

class JoinCompleteScreen extends ConsumerWidget {
  const JoinCompleteScreen({super.key});

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
                      '결제 완료',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '약속에 성공적으로 참가 신청되었습니다.\n아래 버튼을 눌러 약속 정보를 확인하세요.',
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
              onTap: () => context.go(
                '/promise/${ref.read(joinPromiseProvider)!.id}',
              ),
              hasHorizontalMargin: true,
            ),
          ],
        ),
      ),
    );
  }
}
