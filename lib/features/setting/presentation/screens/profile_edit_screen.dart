import 'package:flutter/material.dart';
import 'package:pravo_client/features/core/presentation/widgets/depth2_app_bar_widget.dart';
import 'package:pravo_client/features/setting/presentation/widgets/profile_image_edit_widget.dart';
import 'package:pravo_client/features/setting/presentation/widgets/nickname_edit_widget.dart';

class ProfileEditScreen extends StatelessWidget {
  const ProfileEditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Depth2AppBarWidget(
        title: '프로필 설정',
        actionIcon: Icons.check_rounded,
        actionOnPressed: () {
          Navigator.pop(context);
        },
        leadingIcon: Icons.chevron_left_rounded,
        leadingOnPressed: () {
          Navigator.pop(context);
        },
      ),
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 42,
          ),
          ProfileImageEditWidget(),
          SizedBox(
            height: 65,
          ),
          NicknameEditWidget(),
        ],
      ),
    );
  }
}
