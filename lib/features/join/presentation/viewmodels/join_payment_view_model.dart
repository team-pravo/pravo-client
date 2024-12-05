import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pravo_client/features/join/presentation/viewmodels/join_payment_state.dart';
import 'package:pravo_client/features/join/presentation/viewmodels/join_promise_view_model.dart';
import 'package:tosspayments_widget_sdk_flutter/model/payment_info.dart';
import 'package:tosspayments_widget_sdk_flutter/model/payment_widget_options.dart';
import 'package:tosspayments_widget_sdk_flutter/payment_widget.dart';

class JoinPaymentViewModel extends StateNotifier<JoinPaymentState> {
  final Ref ref;

  JoinPaymentViewModel(this.ref) : super(JoinPaymentState()) {
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
    final paymentWidget = state.paymentWidget!;

    paymentWidget
        .renderPaymentMethods(
      selector: 'methods',
      amount: Amount(
        value: ref.watch(joinPromiseProvider)!.deposit,
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

final joinPaymentViewModelProvider =
    StateNotifierProvider<JoinPaymentViewModel, JoinPaymentState>(
  (ref) => JoinPaymentViewModel(ref),
);
