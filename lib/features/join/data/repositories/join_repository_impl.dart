import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pravo_client/features/core/dio/dio_provider.dart';
import 'package:pravo_client/features/join/domain/repositories/join_repository.dart';
import 'package:pravo_client/features/new/data/models/payment_response_model.dart';
import 'package:pravo_client/features/new/domain/entities/payment_response.dart';

class JoinRepositoryImpl implements JoinRepository {
  final Dio dio;

  JoinRepositoryImpl(this.dio);

  @override
  Future<void> joinPromise(int promiseId) async {
    await dio.post('/api/promise/$promiseId/join');
  }

  @override
  Future<PaymentResponse> requestPayment(int promiseId) async {
    final response = await dio.post('/api/promise/request/$promiseId');
    final responseModel = PaymentResponseModel.fromJson(response.data);

    return PaymentResponse(
      orderId: responseModel.orderId,
      promiseId: responseModel.promiseId,
    );
  }
}

final joinRepositoryProvider = Provider<JoinRepository>(
  (ref) => JoinRepositoryImpl(ref.read(dioProvider)),
);
