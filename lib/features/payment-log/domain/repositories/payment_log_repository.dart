import 'package:pravo_client/features/payment-log/domain/entities/payment_log.dart';

abstract class PaymentLogRepository {
  Future<List<PaymentLog>> getPaymentLogs();
}
