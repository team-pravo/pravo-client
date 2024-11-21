import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pravo_client/features/new/data/repositories/payment_repository_impl.dart';
import 'package:pravo_client/features/new/domain/entities/payment_request.dart';
import 'package:pravo_client/features/new/domain/entities/payment_response.dart';
import 'package:pravo_client/features/new/domain/usecases/request_payment_usecase.dart';

final paymentViewModelProvider =
    StateNotifierProvider<PaymentViewModel, AsyncValue<PaymentResponse>>((ref) {
  return PaymentViewModel(
    RequestPaymentUseCase(ref.read(paymentRepositoryProvider)),
  );
});

class PaymentViewModel extends StateNotifier<AsyncValue<PaymentResponse>> {
  final RequestPaymentUseCase _requestPaymentUseCase;

  PaymentViewModel(this._requestPaymentUseCase)
      : super(const AsyncValue.loading());

  Future<PaymentResponse> requestPayment(PaymentRequest request) async {
    try {
      final payment = await _requestPaymentUseCase.execute(request);
      state = AsyncValue.data(payment);
      return payment;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      rethrow;
    }
  }
}
