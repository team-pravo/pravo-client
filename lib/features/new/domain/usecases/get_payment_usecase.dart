import 'package:pravo_client/features/new/domain/entities/payment.dart';
import 'package:pravo_client/features/new/domain/repositories/payment_repository.dart';

class GetPaymentUseCase {
  final PaymentRepository repository;

  GetPaymentUseCase(this.repository);

  Future<Payment> getPayment() {
    return repository.getPayment();
  }
}
