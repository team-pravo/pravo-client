import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pravo_client/features/core/dio/dio_provider.dart';
import 'package:pravo_client/features/payment-log/data/models/payment_log_model.dart';
import 'package:pravo_client/features/payment-log/domain/entities/payment_log.dart';
import 'package:pravo_client/features/payment-log/domain/entities/payment_status.dart';
import 'package:pravo_client/features/payment-log/domain/repositories/payment_log_repository.dart';

final paymentLogRepositoryProvider = Provider<PaymentLogRepository>((ref) {
  return PaymentLogRepositoryImpl(dio: ref.read(dioProvider));
});

class PaymentLogRepositoryImpl implements PaymentLogRepository {
  final Dio dio;

  PaymentLogRepositoryImpl({required this.dio});

  @override
  Future<List<PaymentLog>> getPaymentLogs() async {
    final response = await dio.get('/api/member/payment-log');

    List<dynamic> data = response.data;
    return data
        .map((item) => PaymentLogModel.fromJson(item))
        .map((model) => _mapModelToEntity(model))
        .toList();
  }

  PaymentLog _mapModelToEntity(PaymentLogModel model) {
    return PaymentLog(
      promiseName: model.promiseName,
      paymentAmount: model.paymentAmount,
      paymentStatus: PaymentStatus.values.firstWhere(
        (e) => e.name == model.paymentStatus,
      ),
      paymentDate: model.paymentDate,
      updatedDate: model.updatedDate,
    );
  }
}
