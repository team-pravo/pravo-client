import 'package:flutter/material.dart';
import 'package:pravo_client/assets/constants.dart';
import 'package:pravo_client/features/promise/domain/entities/participant_status.dart';

class ParticipationStatusLabelWidget extends StatelessWidget {
  final ParticipantStatus status;

  const ParticipationStatusLabelWidget({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    final labelText = status.label;
    final fontColor =
        status == ParticipantStatus.ATTENDED ? Colors.white : kBodyTextColor;
    final backgroundColor = status == ParticipantStatus.ATTENDED
        ? kPrimaryColor
        : kWidgetBackgroundColor;

    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(6),
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 2,
        horizontal: 8,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            labelText,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: fontColor,
            ),
          ),
        ],
      ),
    );
  }
}
