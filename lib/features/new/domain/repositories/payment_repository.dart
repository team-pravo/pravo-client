import 'package:pravo_client/features/new/domain/entities/payment.dart';

abstract class PaymentRepository {
  Future<Payment> getPayment();
}
