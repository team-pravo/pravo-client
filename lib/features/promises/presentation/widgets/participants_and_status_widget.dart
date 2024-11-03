import 'package:flutter/material.dart';
import 'package:pravo_client/features/promises/presentation/widgets/participant_and_status_widget.dart';

class ParticipantsAndStatusWidget extends StatelessWidget {
  const ParticipantsAndStatusWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '참여자',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(
          height: 16,
        ),
        ParticipantAndStatusWidget(
          isAttending: true,
        ),
        SizedBox(
          height: 12,
        ),
        ParticipantAndStatusWidget(
          isAttending: false,
        ),
      ],
    );
  }
}
