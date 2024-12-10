class PaymentResponseModel {
  final String orderId;
  final int promiseId;

  PaymentResponseModel({required this.orderId, required this.promiseId});

  factory PaymentResponseModel.fromJson(Map<String, dynamic> json) {
    return PaymentResponseModel(
      orderId: json['orderId'],
      promiseId: json['promiseId'],
    );
  }
}
