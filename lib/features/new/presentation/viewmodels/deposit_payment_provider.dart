import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pravo_client/features/new/presentation/viewmodels/deposit_payment_state.dart';
import 'package:pravo_client/features/new/presentation/viewmodels/promise_details_provider.dart';
import 'package:tosspayments_widget_sdk_flutter/model/payment_info.dart';
import 'package:tosspayments_widget_sdk_flutter/model/payment_widget_options.dart';
import 'package:tosspayments_widget_sdk_flutter/payment_widget.dart';

final depositPaymentProvider =
    StateNotifierProvider<DepositPaymentNotifier, DepositPaymentState>(
  (ref) => DepositPaymentNotifier(ref: ref),
);

class DepositPaymentNotifier extends StateNotifier<DepositPaymentState> {
  final Ref ref;

  DepositPaymentNotifier({required this.ref}) : super(DepositPaymentState()) {
    _initializePaymentWidget();
  }

  void _initializePaymentWidget() {
    final paymentWidget = PaymentWidget(
      clientKey: dotenv.env['TOSS_CLIENT_KEY']!,
      customerKey: 'a1b2c3d4e5f67890',
    );

    state = state.copyWith(paymentWidget: paymentWidget);
  }

  void renderWidgets() {
    final depositAmount = ref.read(promiseDetailsProvider).deposit;
    final paymentWidget = state.paymentWidget!;

    paymentWidget
        .renderPaymentMethods(
      selector: 'methods',
      amount: Amount(
        value: depositAmount,
        currency: Currency.KRW,
        country: 'KR',
      ),
    )
        .then((control) {
      state = state.copyWith(paymentMethodWidgetControl: control);
    }).catchError((error) {
      print('Error rendering payment methods: $error');
    });

    paymentWidget.renderAgreement(selector: 'agreement').then(
      (control) {
        state = state.copyWith(agreementWidgetControl: control);
        _updateAgreementStatus();
      },
    ).catchError((error) {
      print('Error rendering agreement: $error');
    });
  }

  Future<void> _updateAgreementStatus() async {
    final agreementStatus =
        await state.agreementWidgetControl?.getAgreementStatus();
    state = state.copyWith(
      isAgreementChecked: agreementStatus?.agreedRequiredTerms ?? false,
    );
  }

  void setAgreementStatus(bool status) {
    state = state.copyWith(isAgreementChecked: status);
  }

  Future<void> requestPayment(
    String orderId,
    String orderName,
    BuildContext context,
  ) async {
    final paymentResult = await state.paymentWidget?.requestPayment(
      paymentInfo: PaymentInfo(
        orderId: orderId,
        orderName: orderName,
      ),
    );

    if (paymentResult?.success != null) {
      print(
        '[결제 성공: 주문번호 ${paymentResult?.success?.orderId}] paymentKey - ${paymentResult?.success?.paymentKey}',
      );
      if (!context.mounted) return; // Navigator 사용 전 mounted 확인
      context.push(
        '/new/deposit/complete',
      );
    } else if (paymentResult?.fail != null) {
      print(
        '[결제 실패] 오류 코드: ${paymentResult?.fail?.errorCode}, 메시지: ${paymentResult?.fail?.errorMessage}',
      );
    }
  }
}
