import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pravo_client/features/join/data/repositories/join_repository_impl.dart';
import 'package:pravo_client/features/join/domain/usecases/change_participant_status_usecase.dart';
import 'package:pravo_client/features/join/domain/usecases/confirm_payment_usecase.dart';
import 'package:pravo_client/features/join/domain/usecases/join_promise_usecase.dart';
import 'package:pravo_client/features/join/domain/usecases/request_payment_usecase.dart';
import 'package:pravo_client/features/join/presentation/viewmodels/join_promise_view_model.dart';
import 'package:pravo_client/features/join/presentation/viewmodels/payment_response_provider.dart';
import 'package:pravo_client/features/payment/domain/entities/payment_response.dart';

class JoinViewModel extends StateNotifier<AsyncValue<PaymentResponse>> {
  final Ref ref;
  final JoinPromiseUseCase _joinPromiseUseCase;
  final RequestPaymentUsecase _requestPaymentUsecase;
  final ConfirmPaymentUseCase _confirmPaymentUseCase;
  final ChangeParticipantStatusUseCase _changeParticipantStatusUseCase;

  JoinViewModel(
    this.ref,
    this._joinPromiseUseCase,
    this._requestPaymentUsecase,
    this._confirmPaymentUseCase,
    this._changeParticipantStatusUseCase,
  ) : super(const AsyncValue.loading());

  Future<void> joinPromiseAndRequestPayment(int promiseId) async {
    await _joinPromiseUseCase.execute(promiseId);
    final paymentResponse = await _requestPaymentUsecase.execute(promiseId);
    ref.read(paymentResponseProvider.notifier).state = paymentResponse;
    state = AsyncValue.data(paymentResponse);
  }

  Future<void> confirmPaymentAndChangeParticipantStatus(
    String paymentKey,
  ) async {
    final paymentResponse = ref.read(paymentResponseProvider)!;
    final joinPromise = ref.read(joinPromiseProvider)!;

    await _confirmPaymentUseCase.execute(
      paymentKey: paymentKey,
      orderId: paymentResponse.orderId,
      amount: joinPromise.deposit,
    );
    await _changeParticipantStatusUseCase.execute(paymentResponse.promiseId);
  }
}

final joinViewModelProvider =
    StateNotifierProvider<JoinViewModel, AsyncValue<PaymentResponse>>(
  (ref) => JoinViewModel(
    ref,
    JoinPromiseUseCase(ref.read(joinRepositoryProvider)),
    RequestPaymentUsecase(ref.read(joinRepositoryProvider)),
    ConfirmPaymentUseCase(ref.read(joinRepositoryProvider)),
    ChangeParticipantStatusUseCase(ref.read(joinRepositoryProvider)),
  ),
);
