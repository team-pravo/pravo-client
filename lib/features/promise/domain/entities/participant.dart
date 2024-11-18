import 'package:pravo_client/features/promise/domain/entities/participant_status.dart';

class Participant {
  final int id;
  final String name;
  final String? profileImageUrl;
  final ParticipantStatus status;
  final String role;

  Participant({
    required this.id,
    required this.name,
    this.profileImageUrl,
    required this.status,
    required this.role,
  });
}
