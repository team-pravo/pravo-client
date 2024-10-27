import 'package:flutter/material.dart';
import 'package:pravo_client/assets/constants.dart';
import 'package:pravo_client/features/core/presentation/widgets/text_field_error_message_widget.dart';

class NicknameEditWidget extends StatelessWidget {
  const NicknameEditWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '닉네임',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          TextField(
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: kBorderColor),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: kBorderColor),
              ),
              hintText: 'Mr. Avocado',
              hintStyle: TextStyle(
                fontSize: 20,
                color: Color.fromRGBO(201, 201, 201, 1),
              ),
            ),
          ),
          SizedBox(height: 6),
          TextFieldErrorMessageWidget(
            title: '이미 사용 중인 닉네임이에요. 다른 닉네임을 골라볼까요?',
          ),
        ],
      ),
    );
  }
}
