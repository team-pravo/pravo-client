import 'package:pravo_client/features/new/domain/entities/payment_request.dart';
import 'package:pravo_client/features/new/domain/entities/payment_response.dart';

abstract class PaymentRepository {
  Future<PaymentResponse> requestPayment(PaymentRequest request);
}
