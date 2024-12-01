import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:pravo_client/assets/constants.dart';
import 'package:pravo_client/features/core/presentation/widgets/depth2_app_bar_widget.dart';
import 'package:pravo_client/features/core/presentation/widgets/text_field_error_message_widget.dart';
import 'package:pravo_client/features/member/domain/entities/member.dart';
import 'package:pravo_client/features/setting/presentation/viewmodels/edit_member_view_model.dart';
import 'package:pravo_client/features/setting/presentation/widgets/nickname_edit_widget.dart';
import 'package:pravo_client/features/setting/presentation/widgets/profile_image_edit_widget.dart';

class ProfileEditScreen extends ConsumerWidget {
  final Member member;

  const ProfileEditScreen({super.key, required this.member});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final editMemberViewModel = ref.watch(editMemberViewModelProvider);
    final editMemberNotifier = ref.read(editMemberViewModelProvider.notifier);

    String name = member.name;
    File? profileImageFile;
    bool resetToDefaultImage = false;

    ref.listen<AsyncValue<void>>(editMemberViewModelProvider, (previous, next) {
      if (next is AsyncData) {
        if (context.mounted) {
          context.pushReplacement('/setting');
        }
      }
    });

    return Scaffold(
      appBar: Depth2AppBarWidget(
        title: '프로필 설정',
        actionIconText: '완료',
        actionOnPressed: () async {
          await editMemberNotifier.editMember(
            name: name,
            file: profileImageFile,
            resetToDefaultImage: resetToDefaultImage,
          );
        },
        leadingIcon: PhosphorIcons.caretLeft(),
        leadingOnPressed: () {
          Navigator.pop(context);
        },
      ),
      body: Padding(
        padding: kScreenPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProfileImageEditWidget(
              profileImageUrl: member.profileImageUrl,
              onImageSelected: (file) async {
                profileImageFile = file;
                resetToDefaultImage = false;
              },
              onResetToDefault: () {
                profileImageFile = null;
                resetToDefaultImage = true;
              },
            ),
            const SizedBox(
              height: 50,
            ),
            NicknameEditWidget(
              name: member.name,
              onNameChanged: (newName) {
                name = newName;
              },
            ),
            const SizedBox(
              height: 8,
            ),
            editMemberViewModel.when(
              data: (_) => const SizedBox.shrink(),
              loading: () => const SizedBox.shrink(),
              error: (error, _) => TextFieldErrorMessageWidget(
                title: editMemberNotifier.errorMessage!,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
