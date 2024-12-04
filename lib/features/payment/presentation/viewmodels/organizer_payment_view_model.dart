import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pravo_client/features/auth/presentation/viewmodels/router_provider.dart';
import 'package:pravo_client/features/new/data/repositories/payment_repository_impl.dart';
import 'package:pravo_client/features/new/domain/usecases/change_promise_status_usecase.dart';
import 'package:pravo_client/features/new/domain/usecases/confirm_payment_usecase.dart';
import 'package:pravo_client/features/new/presentation/viewmodels/payment_view_model.dart';
import 'package:pravo_client/features/new/presentation/viewmodels/promise_details_view_model.dart';
import 'package:pravo_client/features/new/presentation/viewmodels/promise_id_provider.dart';

class ParticipantPaymentViewModel {
  final Ref ref;

  ParticipantPaymentViewModel(this.ref);

  Future<void> handlePayment(String paymentKey) async {
    final confirmPaymentUseCase = ConfirmPaymentUseCase(
      ref.read(paymentRepositoryProvider),
    );
    final changePromiseStatusUseCase = ChangePromiseStatusUseCase(
      ref.read(paymentRepositoryProvider),
    );

    final orderId = ref
        .watch(paymentViewModelProvider)
        .whenData((payment) => payment)
        .value!
        .orderId;
    final depositAmount = ref.read(promiseDetailsViewModelProvider).deposit!;

    await confirmPaymentUseCase.execute(
      paymentKey: paymentKey,
      orderId: orderId,
      amount: depositAmount,
    );
    await changePromiseStatusUseCase.execute(ref.read(promiseIdProvider)!);

    ref.read(routerProvider).pushReplacement('/new/deposit/complete');
  }
}

final participantPaymentViewModelProvider = Provider(
  (ref) => ParticipantPaymentViewModel(ref),
);
