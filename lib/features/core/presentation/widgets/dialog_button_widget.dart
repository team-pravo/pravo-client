import 'package:flutter/material.dart';

class DialogButtonWidget extends StatelessWidget {
  final String buttonText;
  final VoidCallback onTap;
  final Color buttonColor;
  final Color textColor;
  final FontWeight? fontWeight;
  final double? width;

  const DialogButtonWidget({
    super.key,
    required this.buttonText,
    required this.onTap,
    required this.buttonColor,
    required this.textColor,
    this.fontWeight = FontWeight.w600,
    this.width = 115.0,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 8,
        ),
        width: width,
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(
              fontSize: 16,
              fontWeight: fontWeight,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}
