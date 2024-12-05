// ignore_for_file: constant_identifier_names

enum PaymentStatus {
  COMPLETED('결제'),
  CANCELED('취소');

  final String label;

  const PaymentStatus(this.label);
}
