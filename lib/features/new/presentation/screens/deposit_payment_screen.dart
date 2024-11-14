import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:pravo_client/features/core/presentation/widgets/depth2_app_bar_widget.dart';
import 'package:pravo_client/features/core/presentation/widgets/primary_button_widget.dart';
import 'package:pravo_client/features/new/presentation/viewmodels/deposit_payment_provider.dart';
import 'package:pravo_client/features/new/presentation/viewmodels/payment_view_model.dart';
import 'package:pravo_client/features/new/presentation/viewmodels/promise_details_provider.dart';
import 'package:tosspayments_widget_sdk_flutter/widgets/agreement.dart';
import 'package:tosspayments_widget_sdk_flutter/widgets/payment_method.dart';

class DepositPaymentScreen extends ConsumerStatefulWidget {
  const DepositPaymentScreen({super.key});

  @override
  ConsumerState<DepositPaymentScreen> createState() =>
      _DepositPaymentScreenState();
}

class _DepositPaymentScreenState extends ConsumerState<DepositPaymentScreen> {
  @override
  void initState() {
    super.initState();

    // 위젯이 빌드된 후에 renderWidgets 호출
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final paymentNotifier = ref.read(depositPaymentProvider.notifier);
      paymentNotifier.renderWidgets();
    });
  }

  @override
  Widget build(BuildContext context) {
    final paymentState = ref.watch(depositPaymentProvider);
    final paymentNotifier = ref.read(depositPaymentProvider.notifier);
    final depositAmount = ref.watch(promiseDetailsProvider).deposit;
    final promiseName = ref.watch(promiseDetailsProvider).name;
    final orderId = ref
        .watch(paymentViewModelProvider)
        .whenData((payment) => payment)
        .value!
        .orderId;

    final formattedDepositAmount = NumberFormat('#,###').format(depositAmount);

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
                await paymentNotifier.requestPayment(orderId, promiseName);
              },
              hasHorizontalMargin: true,
            ),
          ],
        ),
      ),
    );
  }
}
