import 'package:pravo_client/features/new/domain/repositories/payment_repository.dart';

class ConfirmPaymentUseCase {
  final PaymentRepository repository;

  ConfirmPaymentUseCase(this.repository);

  Future<void> execute({
    required String paymentKey,
    required String orderId,
    required int amount,
  }) async {
    await repository.confirmPayment(
      paymentKey: paymentKey,
      orderId: orderId,
      amount: amount,
    );
  }
}
