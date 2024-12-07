import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pravo_client/assets/constants.dart';
import 'package:pravo_client/features/core/presentation/widgets/depth2_app_bar_widget.dart';
import 'package:pravo_client/features/core/presentation/widgets/primary_button_widget.dart';
import 'package:pravo_client/features/settlement/domain/entites/settlement.dart';
import 'package:pravo_client/features/settlement/presentation/viewmodels/settlement_view_model.dart';
import 'package:pravo_client/features/settlement/presentation/widgets/payout_points_widget.dart';
import 'package:pravo_client/features/settlement/presentation/widgets/refund_amount_widget.dart';

class SettlementCompleteScreen extends ConsumerWidget {
  final int promiseId;

  const SettlementCompleteScreen({super.key, required this.promiseId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settlementState = ref.watch(settlementViewModelProvider);

    ref.listen<AsyncValue<Settlement>>(settlementViewModelProvider,
        (previous, next) {
      next.whenOrNull(
        error: (error, stack) {
          context.go(
            '/error',
            extra: {
              'appBarTitle': '오류',
              'errorTitle': '정산 실패',
              'errorMessage': '정산 처리 중 문제가 발생했어요. 다시 시도해주세요.',
            },
          );
        },
      );
    });

    return Scaffold(
      appBar: const Depth2AppBarWidget(
        title: '정산 완료',
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: kScreenPadding,
                  child: settlementState.when(
                    data: (settlement) => Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        const Text(
                          '🎉',
                          style: TextStyle(fontSize: 50),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          '약속 정산이\n완료되었어요',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        RefundAmountWidget(
                          deposit: settlement.deposit,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        PayoutPointsWidget(
                          absentCount: settlement.absentCount,
                          deposit: settlement.deposit,
                          attendanceCount: settlement.attendanceCount,
                          earnedPoint: settlement.earnedPoint,
                        ),
                      ],
                    ),
                    error: (_, __) => const SizedBox.shrink(),
                    loading: () =>
                        const Center(child: CircularProgressIndicator()),
                  ),
                ),
              ),
            ),
            PrimaryButtonWidget(
              buttonText: '확인',
              onTap: () => context.go('/promise/$promiseId'),
              hasHorizontalMargin: true,
            ),
          ],
        ),
      ),
    );
  }
}
