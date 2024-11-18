import 'package:flutter/material.dart';
import 'package:pravo_client/features/promise/domain/entities/participant.dart';
import 'package:pravo_client/features/promise/presentation/widgets/participant_and_status_widget.dart';

class ParticipantsAndStatusWidget extends StatelessWidget {
  final List<Participant> participants;

  const ParticipantsAndStatusWidget({super.key, required this.participants});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '참여자',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        ...participants.map((participant) {
          return Column(
            children: [
              ParticipantAndStatusWidget(
                name: participant.name,
                profileImageUrl: participant.profileImageUrl,
                status: participant.status,
              ),
              const SizedBox(height: 12),
            ],
          );
        }),
      ],
    );
  }
}
