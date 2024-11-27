import 'package:flutter/material.dart';
import 'package:pravo_client/assets/constants.dart';
import 'package:pravo_client/features/core/presentation/widgets/text_field_error_message_widget.dart';

class NicknameEditWidget extends StatelessWidget {
  final String name;
  const NicknameEditWidget({
    super.key,
    required this.name,
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
        ),
        const SizedBox(
          height: 8,
        ),
        const TextFieldErrorMessageWidget(
          // FIXME: 프로필 수정 API가 개발 완료되면, 프로필 수정 API의 호출 결과에 따라 노출하도록 수정할 것
          title: '이미 사용 중인 닉네임이에요. 다른 닉네임을 골라볼까요?',
        ),
      ],
    );
  }
}
