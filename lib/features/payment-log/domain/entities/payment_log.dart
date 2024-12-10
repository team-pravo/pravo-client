import 'package:pravo_client/features/payment-log/domain/entities/payment_status.dart';

class PaymentLog {
  final String promiseName;
  final int paymentAmount;
  final PaymentStatus paymentStatus;
  final DateTime paymentDate;
  final DateTime updatedDate;

  PaymentLog({
    required this.promiseName,
    required this.paymentAmount,
    required this.paymentStatus,
    required this.paymentDate,
    required this.updatedDate,
  });
}
