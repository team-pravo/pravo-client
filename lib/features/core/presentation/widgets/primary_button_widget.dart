import 'package:flutter/material.dart';
import 'package:pravo_client/assets/constants.dart';

class PrimaryButtonWidget extends StatelessWidget {
  final String buttonText;
  final VoidCallback onTap;
  final bool isEnabled;
  final Color buttonColor;
  final Color textColor;
  final IconData? icon;
  final bool iconBeforeText; // 아이콘 위치 (디폴트: 텍스트 앞)
  final bool hasHorizontalMargin;

  const PrimaryButtonWidget({
    super.key,
    required this.buttonText,
    required this.onTap,
    this.isEnabled = true,
    this.buttonColor = kPrimaryColor,
    this.textColor = Colors.white,
    this.icon,
    this.iconBeforeText = true,
    this.hasHorizontalMargin = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isEnabled ? onTap : null,
      child: Container(
        margin: hasHorizontalMargin
            ? const EdgeInsets.symmetric(horizontal: kHorizontalPadding)
            : null,
        decoration: BoxDecoration(
          color: isEnabled ? buttonColor : kUnselectedIconColor,
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 30,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 아이콘이 존재하고, 텍스트 앞에 위치할 때
            if (icon != null && iconBeforeText) ...[
              Icon(
                icon,
                color: textColor,
                size: 16,
              ),
              const SizedBox(width: 4),
            ],
            Text(
              buttonText,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: textColor,
              ),
            ),
            // 아이콘이 존재하고, 아이콘이 텍스트 뒤에 위치할 때
            if (icon != null && !iconBeforeText) ...[
              const SizedBox(width: 4),
              Icon(
                icon,
                color: textColor,
                size: 16,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
