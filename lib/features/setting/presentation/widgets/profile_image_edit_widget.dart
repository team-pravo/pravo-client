import 'dart:io';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pravo_client/assets/constants.dart';

class ProfileImageEditWidget extends StatelessWidget {
  final String? profileImageUrl;
  final void Function(File file) onImageSelected;
  final VoidCallback onResetToDefault;

  const ProfileImageEditWidget({
    super.key,
    this.profileImageUrl,
    required this.onImageSelected,
    required this.onResetToDefault,
  });

  Future<void> _pickImage(BuildContext context) async {
    final picker = ImagePicker();
    try {
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        onImageSelected(File(pickedFile.path));
      }
    } catch (e) {
      log(e.toString(), error: e);
    }
  }

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
            child: PopupMenuButton<int>(
              onSelected: (value) {
                if (value == 1) {
                  _pickImage(context);
                } else if (value == 2) {
                  onResetToDefault();
                }
              },
              icon: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.add_circle_rounded,
                  color: kPrimaryColor,
                  size: 28,
                ),
              ),
              itemBuilder: (context) => [
                const PopupMenuItem(
                  value: 1,
                  child: Text('갤러리에서 사진 선택'),
                ),
                const PopupMenuItem(
                  value: 2,
                  child: Text('기본 이미지 적용'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
