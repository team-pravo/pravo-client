import 'package:tosspayments_widget_sdk_flutter/payment_widget.dart';
import 'package:tosspayments_widget_sdk_flutter/widgets/agreement.dart';
import 'package:tosspayments_widget_sdk_flutter/widgets/payment_method.dart';

class JoinPaymentState {
  final PaymentWidget? paymentWidget;
  final PaymentMethodWidgetControl? paymentMethodWidgetControl;
  final AgreementWidgetControl? agreementWidgetControl;
  final bool isAgreementChecked;

  JoinPaymentState({
    this.paymentWidget,
    this.paymentMethodWidgetControl,
    this.agreementWidgetControl,
    this.isAgreementChecked = false,
  });

  JoinPaymentState copyWith({
    PaymentWidget? paymentWidget,
    PaymentMethodWidgetControl? paymentMethodWidgetControl,
    AgreementWidgetControl? agreementWidgetControl,
    bool? isAgreementChecked,
  }) {
    return JoinPaymentState(
      paymentWidget: paymentWidget ?? this.paymentWidget,
      paymentMethodWidgetControl:
          paymentMethodWidgetControl ?? this.paymentMethodWidgetControl,
      agreementWidgetControl:
          agreementWidgetControl ?? this.agreementWidgetControl,
      isAgreementChecked: isAgreementChecked ?? this.isAgreementChecked,
    );
  }
}
