import 'package:pravo_client/features/promise/domain/entities/participant.dart';

class Promise {
  final int id;
  final String name;
  final DateTime scheduledAt;
  final String location;
  final String status;
  final int deposit;
  final List<Participant> participants;

  Promise({
    required this.id,
    required this.name,
    required this.scheduledAt,
    required this.location,
    required this.status,
    required this.deposit,
    required this.participants,
  });
}
