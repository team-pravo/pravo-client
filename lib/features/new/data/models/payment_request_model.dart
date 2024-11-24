class PaymentRequestModel {
  final String name;
  final DateTime scheduledAt;
  final String location;
  final int deposit;

  PaymentRequestModel({
    required this.name,
    required this.scheduledAt,
    required this.location,
    required this.deposit,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'scheduledAt': scheduledAt.toIso8601String(),
      'location': location,
      'deposit': deposit,
    };
  }
}
