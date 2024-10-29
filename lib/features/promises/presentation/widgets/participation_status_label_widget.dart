import 'package:flutter/material.dart';
import 'package:pravo_client/assets/constants.dart';

class ParticipationStatusLabelWidget extends StatelessWidget {
  const ParticipationStatusLabelWidget({super.key});

  @override
  Widget build(BuildContext context) {
    const fontSize = 12.0;
    const fontColor = Colors.white;

    return Container(
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 2,
        horizontal: 8,
      ),
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '참석',
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.w500,
              color: fontColor,
            ),
          ),
        ],
      ),
    );
  }
}
