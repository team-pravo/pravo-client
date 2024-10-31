import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pravo_client/features/core/presentation/widgets/depth2_app_bar_widget.dart';
import 'package:pravo_client/features/core/presentation/widgets/primary_button_widget.dart';
import 'package:pravo_client/features/new/presentation/viewmodels/promise_details_provider.dart';
import 'package:tosspayments_widget_sdk_flutter/model/payment_info.dart';
import 'package:tosspayments_widget_sdk_flutter/model/payment_widget_options.dart';
import 'package:tosspayments_widget_sdk_flutter/payment_widget.dart';
import 'package:tosspayments_widget_sdk_flutter/widgets/agreement.dart';
import 'package:tosspayments_widget_sdk_flutter/widgets/payment_method.dart';

class DepositPaymentScreen extends ConsumerStatefulWidget {
  const DepositPaymentScreen({super.key});

  @override
  ConsumerState<DepositPaymentScreen> createState() =>
      _DepositPaymentScreenState();
}

class _DepositPaymentScreenState extends ConsumerState<DepositPaymentScreen> {
  late PaymentWidget _paymentWidget;
  PaymentMethodWidgetControl? _paymentMethodWidgetControl;
  AgreementWidgetControl? _agreementWidgetControl;
  bool isAgreementChecked = false;

  @override
  void initState() {
    final int despositAmount = ref.read(promiseDetailsProvider).deposit;

    super.initState();

    _paymentWidget = PaymentWidget(
      clientKey: dotenv.env['TOSS_CLIENT_KEY']!,
      customerKey: 'a1b2c3d4e5f67890',
    );

    _paymentWidget
        .renderPaymentMethods(
      selector: 'methods',
      amount: Amount(
        value: despositAmount,
        currency: Currency.KRW,
        country: 'KR',
      ),
    )
        .then((control) {
      _paymentMethodWidgetControl = control;
    });

    _paymentWidget.renderAgreement(selector: 'agreement').then((control) {
      _agreementWidgetControl = control;
      _updateAgreementStatus();
    });
  }

  Future<void> _updateAgreementStatus() async {
    final agreementStatus = await _agreementWidgetControl?.getAgreementStatus();
    setState(() {
      isAgreementChecked = agreementStatus?.agreedRequiredTerms ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final depositAmount = ref.watch(promiseDetailsProvider).deposit;
    const orderId = 'OrderId_123'; // 수정 예정

    return Scaffold(
      appBar: Depth2AppBarWidget(
        title: '예약금 결제',
        leadingIcon: Icons.chevron_left_rounded,
        leadingOnPressed: () => context.pop(),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    PaymentMethodWidget(
                      paymentWidget: _paymentWidget,
                      selector: 'methods',
                    ),
                    AgreementWidget(
                      paymentWidget: _paymentWidget,
                      selector: 'agreement',
                      onChange: (status) {
                        setState(() {
                          isAgreementChecked = status.agreedRequiredTerms;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: PrimaryButtonWidget(
                buttonText: '$depositAmount원 결제하기',
                isEnabled: isAgreementChecked,
                onTap: () async {
                  final String promiseName =
                      ref.watch(promiseDetailsProvider).name;
                  final paymentResult = await _paymentWidget.requestPayment(
                    paymentInfo: PaymentInfo(
                      orderId: orderId,
                      orderName: promiseName,
                    ),
                  );
                  if (paymentResult.success != null) {
                    // 결제 성공 처리
                    print('[Toss] 결제성공 ${paymentResult.success}');
                  } else if (paymentResult.fail != null) {
                    // 결제 실패 처리
                    print('[Toss] 결제실패 ${paymentResult.fail}');
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
