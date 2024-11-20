import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:pravo_client/assets/constants.dart';
import 'package:pravo_client/features/member/domain/entities/member.dart';

class ProfilePreviewWidget extends StatelessWidget {
  final Member member;
  const ProfilePreviewWidget({
    super.key,
    required this.member,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push('/profile/edit', extra: member),
      child: Container(
        padding: kWidgetPadding,
        decoration: BoxDecoration(
          color: kWidgetBackgroundColor,
          borderRadius: kWidgetBorderRadius,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: kAvatarBackgroundColor,
                  backgroundImage: member.profileImageUrl != null
                      ? NetworkImage(member.profileImageUrl!)
                      : null,
                  child: member.profileImageUrl == null
                      ? Padding(
                          padding: const EdgeInsets.all(6),
                          child: Image.asset(
                            'assets/images/avocado.png',
                          ),
                        )
                      : null,
                ),
                const SizedBox(width: 12),
                Text(
                  member.name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            PhosphorIcon(
              PhosphorIcons.caretRight(),
              size: 16,
            ),
          ],
        ),
      ),
    );
  }
}
