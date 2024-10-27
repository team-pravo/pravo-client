import 'package:flutter/material.dart';
import 'package:pravo_client/features/promises/presentation/widgets/participant_and_status_widget.dart';

class ParticipantsWidget extends StatelessWidget {
  const ParticipantsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '참여중인 사람',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          ParticipantAndStatusWidget(),
          ParticipantAndStatusWidget(),
          ParticipantAndStatusWidget(),
        ],
      ),
    );
  }
}
