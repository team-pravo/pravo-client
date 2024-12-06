import 'package:pravo_client/features/settlement/domain/entites/participant.dart';
import 'package:pravo_client/features/settlement/domain/entites/settlement.dart';

abstract class SettlementRepository {
  Future<Settlement> confirmSettlement({
    required List<Participant> participants,
    required int promiseId,
  });
}
