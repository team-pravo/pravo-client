import 'package:pravo_client/features/setting/domain/entities/payment_log.dart';

abstract class PaymentLogRepository {
  Future<List<PaymentLog>> getPaymentLogs();
}
