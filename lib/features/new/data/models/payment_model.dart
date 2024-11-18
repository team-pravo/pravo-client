class PaymentModel {
  final String orderId;

  PaymentModel({
    required this.orderId,
  });

  factory PaymentModel.fromJson(Map<String, dynamic> json) {
    return PaymentModel(orderId: json['orderId']);
  }
}
