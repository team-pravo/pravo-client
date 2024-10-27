import 'package:flutter/material.dart';
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
            Text(selectedValue),
            const Icon(Icons.expand_more_rounded),
          ],
        ),
      ),
    );
  }
}
