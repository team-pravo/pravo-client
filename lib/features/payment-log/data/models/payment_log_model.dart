class PaymentLogModel {
  final String promiseName;
  final int paymentAmount;
  final String paymentStatus;
  final DateTime paymentDate;
  final DateTime updatedDate;

  PaymentLogModel({
    required this.promiseName,
    required this.paymentAmount,
    required this.paymentStatus,
    required this.paymentDate,
    required this.updatedDate,
  });

  factory PaymentLogModel.fromJson(Map<String, dynamic> json) {
    return PaymentLogModel(
      promiseName: json['promiseName'],
      paymentAmount: json['paymentAmount'],
      paymentStatus: json['paymentStatus'],
      paymentDate: DateTime.parse(json['paymentDate']),
      updatedDate: DateTime.parse(json['updatedDate']),
    );
  }
}
