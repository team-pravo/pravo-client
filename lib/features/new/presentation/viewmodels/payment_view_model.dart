import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pravo_client/features/new/data/repositories/payment_repository_impl.dart';
import 'package:pravo_client/features/new/domain/entities/payment_response.dart';
import 'package:pravo_client/features/new/domain/entities/promise_information.dart';
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

  Future<PaymentResponse> requestPayment(PromiseInformation promise) async {
    try {
      final paymentRequest = promise.toPaymentRequest();
      final response = await _requestPaymentUseCase.execute(paymentRequest);
      state = AsyncValue.data(response);
      return response;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      rethrow;
    }
  }
}
