import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pravo_client/features/settlement/data/repositories/settlement_repository_impl.dart';
import 'package:pravo_client/features/settlement/domain/entites/attendee.dart';
import 'package:pravo_client/features/settlement/domain/entites/settlement.dart';
import 'package:pravo_client/features/settlement/domain/usecases/confirm_settlement_usecase.dart';

class SettlementViewModel extends StateNotifier<AsyncValue<Settlement>> {
  final ConfirmSettlementUseCase confirmSettlementUseCase;

  SettlementViewModel(this.confirmSettlementUseCase)
      : super(const AsyncValue.loading());

  Future<void> confirmSettlement({
    required List<Attendee> attendees,
    required int promiseId,
  }) async {
    state = const AsyncValue.loading();
    try {
      final settlement = await confirmSettlementUseCase.execute(
        attendees: attendees,
        promiseId: promiseId,
      );
      state = AsyncValue.data(settlement);
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
  }
}

final settlementViewModelProvider =
    StateNotifierProvider<SettlementViewModel, AsyncValue<Settlement>>((ref) {
  final repository = ref.read(settlementRepositoryProvider);
  final useCase = ConfirmSettlementUseCase(repository);
  return SettlementViewModel(useCase);
});
