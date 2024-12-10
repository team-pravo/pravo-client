import 'package:pravo_client/features/join/domain/repositories/join_repository.dart';
import 'package:pravo_client/features/payment/domain/entities/payment_response.dart';

class RequestPaymentUsecase {
  final JoinRepository repository;

  RequestPaymentUsecase(this.repository);

  Future<PaymentResponse> execute(int promiseId) {
    return repository.requestPayment(promiseId);
  }
}
