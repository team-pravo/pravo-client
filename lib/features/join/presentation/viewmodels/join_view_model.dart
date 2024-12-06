import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pravo_client/features/join/data/repositories/join_repository_impl.dart';
import 'package:pravo_client/features/join/domain/usecases/join_promise_usecase.dart';
import 'package:pravo_client/features/join/domain/usecases/request_payment_usecase.dart';
import 'package:pravo_client/features/new/domain/entities/payment_response.dart';

class JoinViewModel extends StateNotifier<AsyncValue<PaymentResponse>> {
  final JoinPromiseUseCase _joinPromiseUseCase;
  final RequestPaymentUsecase _requestPaymentUsecase;

  JoinViewModel(this._joinPromiseUseCase, this._requestPaymentUsecase)
      : super(const AsyncValue.loading());

  Future<void> joinPromiseAndRequestPayment(int promiseId) async {
    await _joinPromiseUseCase.execute(promiseId);
    final paymentResponse = await _requestPaymentUsecase.execute(promiseId);
    state = AsyncValue.data(paymentResponse);
  }
}

final joinViewModelProvider =
    StateNotifierProvider<JoinViewModel, AsyncValue<PaymentResponse>>(
  (ref) => JoinViewModel(
    JoinPromiseUseCase(ref.read(joinRepositoryProvider)),
    RequestPaymentUsecase(ref.read(joinRepositoryProvider)),
  ),
);
