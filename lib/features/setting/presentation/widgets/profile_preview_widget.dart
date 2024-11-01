import 'package:flutter/material.dart';
import 'package:pravo_client/assets/constants.dart';
import 'package:pravo_client/features/setting/presentation/screens/profile_edit_screen.dart';

class ProfilePreviewWidget extends StatelessWidget {
  const ProfilePreviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ProfileEditScreen(),
          ),
        );
      },
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: kAvatarBackgroundColor,
            radius: 24,
            child: Padding(
              padding: const EdgeInsets.all(7.0),
              child: Image.asset(
                'assets/images/avocado.png',
              ),
            ),
          ),
          const SizedBox(width: 10),
          const Text(
            'Mr. Avocado',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
