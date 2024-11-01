import 'package:flutter/material.dart';

class CurrencyDisplayWidget extends StatelessWidget {
  final String value;
  final String unit;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;

  const CurrencyDisplayWidget({
    super.key,
    required this.value,
    required this.unit,
    this.color = Colors.black,
    this.fontSize = 16,
    this.fontWeight = FontWeight.w600,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: fontSize,
            color: color,
            fontWeight: fontWeight,
          ),
        ),
        const SizedBox(
          width: 4,
        ),
        Text(
          unit,
          style: TextStyle(
            fontSize: fontSize,
            color: color,
            fontWeight: fontWeight,
          ),
        ),
      ],
    );
  }
}
