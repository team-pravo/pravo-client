import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pravo_client/assets/constants.dart';
import 'package:pravo_client/features/core/presentation/widgets/alert_dialog_widget.dart';
import 'package:pravo_client/features/core/presentation/widgets/primary_button_widget.dart';
import 'package:pravo_client/features/new/domain/entities/payment.dart';
import 'package:pravo_client/features/new/presentation/viewmodels/payment_view_model.dart';
import 'package:pravo_client/features/new/presentation/viewmodels/promise_details_provider.dart';

class GoToDepositScreenButtonWidget extends ConsumerWidget {
  const GoToDepositScreenButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final promiseDetails = ref.watch(promiseDetailsProvider);

    final isButtonEnabled = promiseDetails.name.isNotEmpty &&
        promiseDetails.location.isNotEmpty &&
        promiseDetails.deposit > 0 &&
        promiseDetails.dateTime != null;

    ref.listen<AsyncValue<Payment>>(paymentViewModelProvider, (previous, next) {
      next.when(
        data: (payment) {
          context.push('/new/deposit');
        },
        error: (error, stackTrace) {
          showDialog(
            context: context,
            builder: (context) => AlertDialogWidget(
              title: '잠시후 다시 시도해주세요.',
              content: '네트워크 연결이 불안정하거나\n서버 요청에 실패했습니다.',
              actionOnPressed: () {
                Navigator.of(context).pop();
                ref.read(paymentViewModelProvider.notifier).fetchPayment();
              },
              actionTitle: '다시 시도',
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
      );
    });

    return PrimaryButtonWidget(
      isEnabled: isButtonEnabled,
      onTap: () => ref.read(paymentViewModelProvider.notifier).fetchPayment(),
      buttonText: '예약금 결제하기',
      buttonColor: kPrimaryColor,
      textColor: Colors.white,
      hasHorizontalMargin: true,
    );
  }
}
