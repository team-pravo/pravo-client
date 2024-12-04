import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pravo_client/assets/constants.dart';

class ProfileImageEditWidget extends StatefulWidget {
  final String? profileImageUrl;
  final void Function(File? file, bool resetToDefault) onImageChanged;

  const ProfileImageEditWidget({
    super.key,
    this.profileImageUrl,
    required this.onImageChanged,
  });

  @override
  State<ProfileImageEditWidget> createState() => _ProfileImageEditWidgetState();
}

class _ProfileImageEditWidgetState extends State<ProfileImageEditWidget> {
  File? _selectedImage;
  bool _resetToDefault = false;

  Future<void> _pickImage(BuildContext context) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final file = File(pickedFile.path);
      setState(() {
        _selectedImage = file;
        _resetToDefault = false;
      });
      widget.onImageChanged(_selectedImage, _resetToDefault);
    }
  }

  void _resetImage() {
    setState(() {
      _selectedImage = null;
      _resetToDefault = true;
    });
    widget.onImageChanged(_selectedImage, _resetToDefault);
  }

  @override
  Widget build(BuildContext context) {
    ImageProvider? backgroundImage;
    if (_selectedImage != null) {
      backgroundImage = FileImage(_selectedImage!); // 선택된 로컬 이미지
    } else if (widget.profileImageUrl != null && !_resetToDefault) {
      backgroundImage = NetworkImage(widget.profileImageUrl!); // 기존 등록된 이미지
    }

    return Center(
      child: Stack(
        children: [
          CircleAvatar(
            key: ValueKey(backgroundImage),
            backgroundColor: kAvatarBackgroundColor,
            radius: 42,
            backgroundImage: backgroundImage,
            child: backgroundImage == null // 아무 이미지도 없을 때 기본 이미지 표시
                ? Padding(
                    padding: const EdgeInsets.all(7.0),
                    child: Image.asset(
                      'assets/images/avocado.png',
                    ),
                  )
                : null,
          ),
          Positioned(
            bottom: -10,
            right: -10,
            child: PopupMenuButton<int>(
              onSelected: (value) {
                if (value == 1) {
                  _pickImage(context);
                } else if (value == 2) {
                  _resetImage();
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
