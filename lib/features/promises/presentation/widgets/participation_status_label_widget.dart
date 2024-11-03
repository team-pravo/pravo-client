import 'package:flutter/material.dart';
import 'package:pravo_client/assets/constants.dart';

class ParticipationStatusLabelWidget extends StatelessWidget {
  final bool isAttending;

  const ParticipationStatusLabelWidget({super.key, required this.isAttending});

  @override
  Widget build(BuildContext context) {
    final labelText = isAttending ? '참석' : '불참';
    final fontColor = isAttending ? Colors.white : kBodyTextColor;
    final backgroundColor =
        isAttending ? kPrimaryColor : kWidgetBackgroundColor;

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
