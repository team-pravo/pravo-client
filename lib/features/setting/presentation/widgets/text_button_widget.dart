import 'package:flutter/material.dart';

class TextButtonWidget extends StatelessWidget {
  final String title;
  final VoidCallback actionOnTap;

  const TextButtonWidget({
    super.key,
    required this.title,
    required this.actionOnTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: actionOnTap,
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
        ),
      ),
    );
  }
}
