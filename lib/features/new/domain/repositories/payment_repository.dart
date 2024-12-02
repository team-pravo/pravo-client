import 'package:pravo_client/features/new/domain/entities/payment_request.dart';
import 'package:pravo_client/features/new/domain/entities/payment_response.dart';

abstract class PaymentRepository {
  Future<PaymentResponse> requestPayment(PaymentRequest request);

  Future<void> confirmPayment({
    required String paymentKey,
    required String orderId,
    required int amount,
  });

  Future<void> changePromiseStatus({
    required int promiseId,
  });
}
