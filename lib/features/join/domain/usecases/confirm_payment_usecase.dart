import 'package:pravo_client/features/join/domain/repositories/join_repository.dart';

class ConfirmPaymentUseCase {
  final JoinRepository repository;

  ConfirmPaymentUseCase(this.repository);

  Future<void> execute({
    required String paymentKey,
    required String orderId,
    required int amount,
  }) {
    return repository.confirmPayment(
      paymentKey: paymentKey,
      orderId: orderId,
      amount: amount,
    );
  }
}
