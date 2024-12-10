import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pravo_client/features/new/presentation/viewmodels/promise_details_view_model.dart';
import 'package:pravo_client/features/payment/presentation/viewmodels/deposit_payment_state.dart';
import 'package:tosspayments_widget_sdk_flutter/model/payment_info.dart';
import 'package:tosspayments_widget_sdk_flutter/model/payment_widget_options.dart';
import 'package:tosspayments_widget_sdk_flutter/payment_widget.dart';

class DepositPaymentViewModel extends StateNotifier<DepositPaymentState> {
  final Ref ref;

  DepositPaymentViewModel({
    required this.ref,
  }) : super(DepositPaymentState()) {
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
    final promiseDetails = ref.read(promiseDetailsViewModelProvider);
    final depositAmount = promiseDetails.deposit!;
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
    });

    paymentWidget.renderAgreement(selector: 'agreement').then(
      (control) {
        state = state.copyWith(agreementWidgetControl: control);
        _updateAgreementStatus();
      },
    );
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

  Future<String?> getPaymentKey(
    String orderId,
    String orderName,
  ) async {
    final paymentResult = await state.paymentWidget?.requestPayment(
      paymentInfo: PaymentInfo(
        orderId: orderId,
        orderName: orderName,
      ),
    );

    if (paymentResult?.success != null) {
      return paymentResult!.success!.paymentKey;
    }

    return null;
  }
}

final depositPaymentViewModelProvider =
    StateNotifierProvider<DepositPaymentViewModel, DepositPaymentState>(
  (ref) => DepositPaymentViewModel(
    ref: ref,
  ),
);
