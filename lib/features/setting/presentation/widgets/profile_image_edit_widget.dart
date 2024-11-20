import 'package:flutter/material.dart';
import 'package:pravo_client/assets/constants.dart';

class ProfileImageEditWidget extends StatelessWidget {
  final String? profileImageUrl;
  const ProfileImageEditWidget({
    super.key,
    this.profileImageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          CircleAvatar(
            backgroundColor: kAvatarBackgroundColor,
            radius: 42,
            backgroundImage:
                profileImageUrl != null ? NetworkImage(profileImageUrl!) : null,
            child: profileImageUrl == null
                ? Padding(
                    padding: const EdgeInsets.all(7.0),
                    child: Image.asset(
                      'assets/images/avocado.png',
                    ),
                  )
                : null,
          ),
          Positioned(
            bottom: 2,
            right: -2,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.white,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: GestureDetector(
                onTap: () {},
                child: const Icon(
                  Icons.add_circle_rounded,
                  color: kPrimaryColor,
                  size: 28,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
