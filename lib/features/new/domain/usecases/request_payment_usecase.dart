import 'package:pravo_client/features/new/domain/entities/payment_request.dart';
import 'package:pravo_client/features/new/domain/repositories/payment_repository.dart';
import 'package:pravo_client/features/payment/domain/entities/payment_response.dart';

class RequestPaymentUseCase {
  final PaymentRepository repository;

  RequestPaymentUseCase(this.repository);

  Future<PaymentResponse> execute(PaymentRequest request) {
    return repository.requestPayment(request);
  }
}
