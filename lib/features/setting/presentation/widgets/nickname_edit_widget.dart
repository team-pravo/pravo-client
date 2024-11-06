import 'package:flutter/material.dart';
import 'package:pravo_client/assets/constants.dart';
import 'package:pravo_client/features/core/presentation/widgets/text_field_error_message_widget.dart';

class NicknameEditWidget extends StatelessWidget {
  const NicknameEditWidget({
    super.key,
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
            hintText: '닉네임을 입력하세요',
          ),
          style: const TextStyle(
            fontSize: kInputTextFontSize,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        const TextFieldErrorMessageWidget(
          title: '이미 사용 중인 닉네임이에요. 다른 닉네임을 골라볼까요?',
        ),
      ],
    );
  }
}
