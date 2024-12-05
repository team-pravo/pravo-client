import 'package:pravo_client/features/setting/domain/entities/payment_status.dart';

class PaymentLog {
  final String promiseName;
  final int promiseAmount;
  final PaymentStatus paymentStatus;
  final DateTime paymentDate;
  final DateTime updatedDate;

  PaymentLog({
    required this.promiseName,
    required this.promiseAmount,
    required this.paymentStatus,
    required this.paymentDate,
    required this.updatedDate,
  });
}
