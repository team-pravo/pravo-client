class PaymentRequest {
  final String name;
  final String location;
  final int deposit;
  final DateTime scheduledAt;

  PaymentRequest({
    required this.name,
    required this.location,
    required this.deposit,
    required this.scheduledAt,
  });

  PaymentRequest copyWith({
    String? name,
    String? location,
    int? deposit,
    DateTime? scheduledAt,
  }) {
    return PaymentRequest(
      name: name ?? this.name,
      location: location ?? this.location,
      deposit: deposit ?? this.deposit,
      scheduledAt: scheduledAt ?? this.scheduledAt,
    );
  }
}
