import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pravo_client/features/auth/presentation/viewmodels/router_provider.dart';
import 'package:pravo_client/features/new/data/repositories/payment_repository_impl.dart';
import 'package:pravo_client/features/new/domain/usecases/change_promise_status_usecase.dart';
import 'package:pravo_client/features/new/domain/usecases/confirm_payment_usecase.dart';
import 'package:pravo_client/features/new/presentation/viewmodels/payment_view_model.dart';
import 'package:pravo_client/features/new/presentation/viewmodels/promise_details_view_model.dart';
import 'package:pravo_client/features/new/presentation/viewmodels/promise_id_provider.dart';

class OrganizerPaymentViewModel {
  final Ref ref;
  final ConfirmPaymentUseCase confirmPaymentUseCase;
  final ChangePromiseStatusUseCase changePromiseStatusUseCase;

  OrganizerPaymentViewModel({
    required this.ref,
    required this.confirmPaymentUseCase,
    required this.changePromiseStatusUseCase,
  });

  Future<void> handlePayment(String paymentKey) async {
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

final organizerPaymentViewModelProvider = Provider(
  (ref) => OrganizerPaymentViewModel(
    ref: ref,
    confirmPaymentUseCase:
        ConfirmPaymentUseCase(ref.read(paymentRepositoryProvider)),
    changePromiseStatusUseCase:
        ChangePromiseStatusUseCase(ref.read(paymentRepositoryProvider)),
  ),
);
