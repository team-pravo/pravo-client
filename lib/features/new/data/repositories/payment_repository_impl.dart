import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pravo_client/features/core/dio/dio_provider.dart';
import 'package:pravo_client/features/new/data/models/payment_model.dart';
import 'package:pravo_client/features/new/domain/entities/payment.dart';
import 'package:pravo_client/features/new/domain/repositories/payment_repository.dart';

final paymentRepositoryProvider = Provider<PaymentRepositoryImpl>((ref) {
  return PaymentRepositoryImpl(ref.read(dioProvider));
});

class PaymentRepositoryImpl implements PaymentRepository {
  final Dio dio;

  PaymentRepositoryImpl(this.dio);

  @override
  Future<Payment> getPayment() async {
    return Future.delayed(const Duration(milliseconds: 500), () {
      return Payment(orderId: 'OrderId_999');
    });

    // FIXME: API 개발 완료 시 연동
    // final response = await dio.get(
    //   '/api/payment',
    // );
    // return _mapResponseToPayment(response);
  }

  Payment _mapResponseToPayment(Response response) {
    return Payment(
      orderId: PaymentModel.fromJson(response.data).orderId,
    );
  }
}
