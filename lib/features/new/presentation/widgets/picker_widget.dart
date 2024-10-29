import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:pravo_client/assets/constants.dart';

class PickerWidget extends StatelessWidget {
  final String selectedValue;
  final VoidCallback onTap;

  const PickerWidget({
    super.key,
    required this.selectedValue,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 48,
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 15,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: kBorderColor,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              selectedValue,
              style: const TextStyle(
                fontSize: kInputTextFontSize,
              ),
            ),
            PhosphorIcon(
              PhosphorIcons.caretDown(),
              size: 16,
            ),
          ],
        ),
      ),
    );
  }
}
