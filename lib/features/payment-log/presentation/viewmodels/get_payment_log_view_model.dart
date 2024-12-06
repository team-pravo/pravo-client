import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pravo_client/features/payment-log/domain/entities/payment_log.dart';
import 'package:pravo_client/features/payment-log/domain/repositories/payment_log_repository.dart';
import 'package:pravo_client/features/payment-log/data/repositories/payment_log_repository_impl.dart';

class GetPaymentLogViewModel
    extends StateNotifier<AsyncValue<List<PaymentLog>>> {
  final PaymentLogRepository repository;

  GetPaymentLogViewModel({required this.repository})
      : super(const AsyncValue.loading()) {
    _fetchPaymentLogs();
  }

  Future<void> _fetchPaymentLogs() async {
    try {
      final logs = await repository.getPaymentLogs();
      state = AsyncValue.data(logs);
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }
}

final getPaymentLogViewModelProvider =
    StateNotifierProvider<GetPaymentLogViewModel, AsyncValue<List<PaymentLog>>>(
        (ref) {
  final repository = ref.watch(paymentLogRepositoryProvider);
  return GetPaymentLogViewModel(repository: repository);
});
