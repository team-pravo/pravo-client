import 'package:flutter/material.dart';
import 'package:pravo_client/assets/constants.dart';

class TextFieldErrorMessageWidget extends StatelessWidget {
  final String title;

  const TextFieldErrorMessageWidget({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.error_outline,
          size: 20,
          color: kSecondaryColor,
        ),
        const SizedBox(
          width: 4,
        ),
        Text(
          title,
          style: const TextStyle(
            fontSize: 12,
            color: kSecondaryColor,
          ),
        ),
      ],
    );
  }
}
