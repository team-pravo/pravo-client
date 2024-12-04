import 'package:pravo_client/features/payment/domain/entities/payment_response.dart';

abstract class JoinRepository {
  Future<void> joinPromise(int promiseId);
  Future<PaymentResponse> requestPayment(int promiseId);
}
