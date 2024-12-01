import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pravo_client/features/core/dio/dio_provider.dart';
import 'package:pravo_client/features/new/data/models/payment_request_model.dart';
import 'package:pravo_client/features/new/data/models/payment_response_model.dart';
import 'package:pravo_client/features/new/domain/entities/payment_request.dart';
import 'package:pravo_client/features/new/domain/entities/payment_response.dart';
import 'package:pravo_client/features/new/domain/repositories/payment_repository.dart';

final paymentRepositoryProvider = Provider<PaymentRepositoryImpl>((ref) {
  return PaymentRepositoryImpl(ref.read(dioProvider));
});

class PaymentRepositoryImpl implements PaymentRepository {
  final Dio dio;

  PaymentRepositoryImpl(this.dio);

  @override
  Future<PaymentResponse> requestPayment(PaymentRequest request) async {
    final requestModel = PaymentRequestModel(
      name: request.name,
      scheduledAt: request.scheduledAt,
      location: request.location,
      deposit: request.deposit,
    );

    final response = await dio.post(
      '/api/payment/request',
      data: requestModel.toJson(),
    );

    final responseModel = PaymentResponseModel.fromJson(response.data);

    return PaymentResponse(
      orderId: responseModel.orderId,
      promiseId: responseModel.promiseId,
    );
  }

  @override
  Future<void> confirmPayment({
    required String paymentKey,
    required String orderId,
    required int amount,
  }) async {
    final response = await dio.post(
      '/api/payment/confirm',
      data: {
        'paymentKey': paymentKey,
        'orderId': orderId,
        'amount': amount,
      },
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to confirm payment');
    }
  }
}
