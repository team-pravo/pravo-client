import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pravo_client/assets/constants.dart';
import 'package:pravo_client/features/core/presentation/widgets/primary_button_widget.dart';
import 'package:pravo_client/features/new/domain/entities/payment.dart';
import 'package:pravo_client/features/new/presentation/viewmodels/payment_view_model.dart';
import 'package:pravo_client/features/new/presentation/viewmodels/promise_details_provider.dart';
import 'package:pravo_client/features/new/presentation/viewmodels/time_provider.dart';

class GoToDepositScreenButtonWidget extends ConsumerWidget {
  const GoToDepositScreenButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final promiseDetails = ref.watch(promiseDetailsProvider);
    final selectedTime = ref.watch(timeProvider);

    final isButtonEnabled = promiseDetails.name.isNotEmpty &&
        promiseDetails.location.isNotEmpty &&
        promiseDetails.deposit > 0 &&
        selectedTime != null;

    ref.listen<AsyncValue<Payment>>(paymentViewModelProvider, (previous, next) {
      next.when(
        data: (payment) {
          context.push('/new/deposit');
        },
        error: (error, stackTrace) {
          context.push('/new/error');
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
