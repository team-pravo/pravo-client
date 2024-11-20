import 'package:flutter/material.dart';
import 'package:pravo_client/assets/constants.dart';

class ImageAndTextWidget extends StatelessWidget {
  final String name;
  final String? imageUrl;
  const ImageAndTextWidget({
    super.key,
    required this.name,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: kAvatarBackgroundColor,
          radius: 12,
          child: CircleAvatar(
            backgroundColor: kAvatarBackgroundColor,
            backgroundImage: imageUrl != null ? NetworkImage(imageUrl!) : null,
            child: imageUrl == null
                ? Padding(
                    padding: const EdgeInsets.all(6),
                    child: Image.asset(
                      'assets/images/avocado.png',
                    ),
                  )
                : null,
          ),
        ),
        const SizedBox(
          width: 12,
        ),
        Text(
          name,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
