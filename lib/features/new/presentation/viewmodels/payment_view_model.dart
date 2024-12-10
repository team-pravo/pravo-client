import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pravo_client/features/new/data/repositories/payment_repository_impl.dart';
import 'package:pravo_client/features/new/domain/entities/promise_information.dart';
import 'package:pravo_client/features/new/domain/usecases/request_payment_usecase.dart';
import 'package:pravo_client/features/new/presentation/viewmodels/promise_id_provider.dart';
import 'package:pravo_client/features/payment/domain/entities/payment_response.dart';

final paymentViewModelProvider =
    StateNotifierProvider<PaymentViewModel, AsyncValue<PaymentResponse>>((ref) {
  return PaymentViewModel(
    RequestPaymentUseCase(ref.read(paymentRepositoryProvider)),
    ref.read(promiseIdProvider.notifier),
  );
});

class PaymentViewModel extends StateNotifier<AsyncValue<PaymentResponse>> {
  final RequestPaymentUseCase _requestPaymentUseCase;
  final PromiseIdNotifier _promiseIdNotifier;

  PaymentViewModel(this._requestPaymentUseCase, this._promiseIdNotifier)
      : super(const AsyncValue.loading());

  Future<PaymentResponse> requestPayment(PromiseInformation promise) async {
    try {
      final paymentRequest = promise.toPaymentRequest();
      final response = await _requestPaymentUseCase.execute(paymentRequest);
      _promiseIdNotifier.setPromiseId(response.promiseId);
      state = AsyncValue.data(response);
      return response;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      rethrow;
    }
  }
}
