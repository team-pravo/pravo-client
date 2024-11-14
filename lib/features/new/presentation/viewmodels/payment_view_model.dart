import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pravo_client/features/new/data/repositories/payment_repository_impl.dart';
import 'package:pravo_client/features/new/domain/entities/payment.dart';
import 'package:pravo_client/features/new/domain/usecases/get_payment_usecase.dart';

final paymentViewModelProvider =
    StateNotifierProvider<PaymentViewModel, AsyncValue<Payment>>((ref) {
  return PaymentViewModel(
    GetPaymentUseCase(ref.read(paymentRepositoryProvider)),
  );
});

class PaymentViewModel extends StateNotifier<AsyncValue<Payment>> {
  final GetPaymentUseCase _getPaymentUseCase;

  PaymentViewModel(this._getPaymentUseCase) : super(const AsyncValue.loading());

  Future<Payment> fetchPayment() async {
    try {
      final payment = await _getPaymentUseCase.getPayment();
      state = AsyncValue.data(payment);
      return payment;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      rethrow;
    }
  }
}
