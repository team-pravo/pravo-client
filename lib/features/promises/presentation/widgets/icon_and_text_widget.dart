import 'package:flutter/material.dart';
import 'package:pravo_client/assets/constants.dart';

class IconAndTextWidget extends StatelessWidget {
  final IconData iconData;
  final String title;
  const IconAndTextWidget({
    super.key,
    required this.iconData,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          iconData,
          color: kPrimaryColor,
          size: 20,
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
