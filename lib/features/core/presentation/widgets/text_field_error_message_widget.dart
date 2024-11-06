import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
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
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        PhosphorIcon(
          PhosphorIcons.warningCircle(PhosphorIconsStyle.bold),
          size: 16,
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
