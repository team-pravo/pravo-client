import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:pravo_client/features/core/presentation/widgets/depth2_app_bar_widget.dart';
import 'package:pravo_client/features/core/presentation/widgets/primary_button_widget.dart';
import 'package:pravo_client/features/payment/presentation/viewmodels/deposit_payment_view_model.dart';
import 'package:tosspayments_widget_sdk_flutter/widgets/agreement.dart';
import 'package:tosspayments_widget_sdk_flutter/widgets/payment_method.dart';

class JoinDepositScreen extends ConsumerStatefulWidget {
  const JoinDepositScreen({super.key});

  @override
  ConsumerState<JoinDepositScreen> createState() => _JoinDepositScreenState();
}

class _JoinDepositScreenState extends ConsumerState<JoinDepositScreen> {
  @override
  Widget build(BuildContext context) {
    final paymentState = ref.watch(depositPaymentViewModelProvider);
    final paymentNotifier = ref.read(depositPaymentViewModelProvider.notifier);

    const promiseId = 'promiseId';
    const promiseName = 'promiseName';
    const depositAmount = '1,000';
    const orderId = 'orderId';

    return Scaffold(
      appBar: Depth2AppBarWidget(
        title: '예약금 결제',
        leadingIcon: PhosphorIcons.caretLeft(),
        leadingOnPressed: () => context.pop(),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    if (paymentState.paymentWidget != null) ...[
                      PaymentMethodWidget(
                        paymentWidget: paymentState.paymentWidget!,
                        selector: 'methods',
                      ),
                      AgreementWidget(
                        paymentWidget: paymentState.paymentWidget!,
                        selector: 'agreement',
                        onChange: (status) {
                          paymentNotifier
                              .setAgreementStatus(status.agreedRequiredTerms);
                        },
                      ),
                    ],
                  ],
                ),
              ),
            ),
            PrimaryButtonWidget(
              buttonText: '$depositAmount원 결제하기',
              isEnabled: paymentState.isAgreementChecked,
              onTap: () async {
                await paymentNotifier.getPaymentKey(orderId, promiseName);
              },
              hasHorizontalMargin: true,
            ),
          ],
        ),
      ),
    );
  }
}
