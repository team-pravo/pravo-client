import 'package:pravo_client/features/settlement/domain/entites/attendee.dart';
import 'package:pravo_client/features/settlement/domain/entites/settlement.dart';
import 'package:pravo_client/features/settlement/domain/repositories/settlement_repository.dart';

class ConfirmSettlementUseCase {
  final SettlementRepository repository;

  ConfirmSettlementUseCase(this.repository);

  Future<Settlement> execute({
    required List<Attendee> attendees,
    required int promiseId,
  }) {
    return repository.confirmSettlement(
      attendees: attendees,
      promiseId: promiseId,
    );
  }
}
