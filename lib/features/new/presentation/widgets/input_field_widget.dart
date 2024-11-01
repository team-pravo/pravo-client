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

    // 예약금 백만원 이하로 제한 (추후 정책에 따라 변경 예정)
    final value = int.tryParse(newText) ?? 0;
    if (value > 1000000) {
      return oldValue;
    }

    // 숫자를 금액 형식으로 포맷팅
    final formatter = NumberFormat('#,###');
    final newString = formatter.format(value);

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
  final ValueChanged<String> onChanged;

  const InputFieldWidget({
    super.key,
    required this.inputType,
    required this.placeholder,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: inputType,
      onChanged: onChanged,
      inputFormatters: inputType == TextInputType.number
          ? <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly,
              CurrencyInputFormatter(), // 금액 형식
            ]
          : null,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          vertical: 10,
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
    );
  }
}
