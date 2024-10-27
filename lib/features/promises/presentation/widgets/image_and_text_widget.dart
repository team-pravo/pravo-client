import 'package:flutter/material.dart';
import 'package:pravo_client/assets/constants.dart';

class ImageAndTextWidget extends StatelessWidget {
  const ImageAndTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: kAvatarBackgroundColor,
          radius: 12,
          child: Image.asset(
            'assets/images/avocado.png',
          ),
        ),
        const SizedBox(
          width: 7,
        ),
        const Text(
          'Mr. Avocado',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
