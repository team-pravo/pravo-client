class PaymentModel {
  final String orderId;

  PaymentModel({
    required this.orderId,
  });

  factory PaymentModel.fromJson(Map<String, dynamic> json) {
    return PaymentModel(orderId: json['orderId']); // BE와 API 응답에 대한 협의 필요
  }
}
