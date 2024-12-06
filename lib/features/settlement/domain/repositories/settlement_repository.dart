import 'package:pravo_client/features/settlement/domain/entites/attendee.dart';
import 'package:pravo_client/features/settlement/domain/entites/settlement.dart';

abstract class SettlementRepository {
  Future<Settlement> confirmSettlement({
    required List<Attendee> attendees,
    required int promiseId,
  });
}
