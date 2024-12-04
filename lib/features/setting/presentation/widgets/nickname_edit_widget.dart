import 'package:flutter/material.dart';
import 'package:pravo_client/assets/constants.dart';

class NicknameEditWidget extends StatelessWidget {
  final String name;
  final ValueChanged<String> onNameChanged;
  const NicknameEditWidget({
    super.key,
    required this.name,
    required this.onNameChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '닉네임',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        TextField(
          decoration: kInputFieldDecoration.copyWith(
            hintText: name,
          ),
          style: const TextStyle(
            fontSize: kInputTextFontSize,
          ),
          onChanged: onNameChanged,
        ),
      ],
    );
  }
}
