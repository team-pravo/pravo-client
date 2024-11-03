import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:pravo_client/assets/constants.dart';
import 'package:pravo_client/features/core/presentation/widgets/depth2_app_bar_widget.dart';
import 'package:pravo_client/features/setting/presentation/widgets/nickname_edit_widget.dart';
import 'package:pravo_client/features/setting/presentation/widgets/profile_image_edit_widget.dart';

class ProfileEditScreen extends StatelessWidget {
  const ProfileEditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Depth2AppBarWidget(
        title: '프로필 설정',
        actionIconText: '완료',
        actionOnPressed: () {
          Navigator.pop(context);
        },
        leadingIcon: PhosphorIcons.caretLeft(),
        leadingOnPressed: () {
          Navigator.pop(context);
        },
      ),
      body: const Padding(
        padding: kScreenPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProfileImageEditWidget(),
            SizedBox(
              height: 50,
            ),
            NicknameEditWidget(),
          ],
        ),
      ),
    );
  }
}