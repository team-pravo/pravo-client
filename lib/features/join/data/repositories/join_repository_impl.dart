import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pravo_client/features/core/dio/dio_provider.dart';
import 'package:pravo_client/features/join/domain/repositories/join_repository.dart';
import 'package:pravo_client/features/payment/data/models/payment_response_model.dart';
import 'package:pravo_client/features/payment/domain/entities/payment_response.dart';

class JoinRepositoryImpl implements JoinRepository {
  final Dio dio;

  JoinRepositoryImpl(this.dio);

  @override
  Future<void> joinPromise(int promiseId) async {
    await dio.post('/api/promise/$promiseId/join');
  }

  @override
  Future<PaymentResponse> requestPayment(int promiseId) async {
    final response = await dio.post('/api/payment/request/$promiseId');
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
    await dio.post(
      '/api/payment/confirm',
      data: {
        'paymentKey': paymentKey,
        'orderId': orderId,
        'amount': amount,
      },
    );
  }

  @override
  Future<void> changeParticipantStatus(int promiseId) async {
    await dio.post('/api/promise/$promiseId/participant/change');
  }
}

final joinRepositoryProvider = Provider<JoinRepository>(
  (ref) => JoinRepositoryImpl(ref.read(dioProvider)),
);
