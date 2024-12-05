import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:pravo_client/app/formatter.dart';
import 'package:pravo_client/features/auth/presentation/viewmodels/router_provider.dart';
import 'package:pravo_client/features/core/presentation/widgets/depth2_app_bar_widget.dart';
import 'package:pravo_client/features/core/presentation/widgets/primary_button_widget.dart';
import 'package:pravo_client/features/join/presentation/viewmodels/join_promise_view_model.dart';
import 'package:pravo_client/features/join/presentation/viewmodels/join_view_model.dart';
import 'package:pravo_client/features/join/presentation/viewmodels/payment_response_provider.dart';
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

    final joinPromise = ref.watch(joinPromiseProvider)!;
    final promiseId = joinPromise.id;
    final promiseName = joinPromise.name;
    final formattedDepositAmount =
        Formatter.formatWithComma(joinPromise.deposit);
    final orderId = ref.watch(paymentResponseProvider)!.orderId;

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
              buttonText: '$formattedDepositAmount원 결제하기',
              isEnabled: paymentState.isAgreementChecked,
              onTap: () async {
                final paymentKey =
                    await paymentNotifier.getPaymentKey(orderId, promiseName);

                if (paymentKey != null) {
                  await ref
                      .read(joinViewModelProvider.notifier)
                      .confirmPaymentAndChangeParticipantStatus(paymentKey);

                  ref
                      .read(routerProvider)
                      .pushReplacement('/promise/$promiseId/join/complete');
                }
              },
              hasHorizontalMargin: true,
            ),
          ],
        ),
      ),
    );
  }
}
