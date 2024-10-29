import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:pravo_client/assets/constants.dart';

class CurrencyInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // 숫자만 남기고 나머지 문자는 제거
    final newText = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');

    if (newText.isEmpty) {
      return newValue.copyWith(text: '');
    }

    // 숫자를 금액 형식으로 포맷팅
    final formatter = NumberFormat('#,###');
    final newString = formatter.format(int.parse(newText));

    // 커서 위치 설정
    return newValue.copyWith(
      text: newString,
      selection: TextSelection.collapsed(offset: newString.length),
    );
  }
}

class InputFieldWidget extends StatelessWidget {
  final TextInputType inputType;
  final String placeholder;

  const InputFieldWidget({
    super.key,
    required this.inputType,
    required this.placeholder,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextField(
        keyboardType: inputType,
        // inputType이 number일 경우 숫자만 입력받도록 설정
        inputFormatters: inputType == TextInputType.number
            ? <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly,
                CurrencyInputFormatter(), // 금액 형식 추가
              ]
            : null,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 15,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              color: kBorderColor,
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              color: kPrimaryColor,
              width: 2,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              color: kBorderColor,
              width: 1,
            ),
          ),
          hintText: placeholder,
          hintStyle: const TextStyle(
            color: kPlaceholderColor,
          ),
        ),
        style: const TextStyle(
          fontSize: kInputTextFontSize,
        ),
      ),
    );
  }
}
