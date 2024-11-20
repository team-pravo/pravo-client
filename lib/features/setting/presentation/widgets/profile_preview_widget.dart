import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:pravo_client/assets/constants.dart';

class ProfilePreviewWidget extends StatelessWidget {
  final String name;
  final String? profileImageUrl;
  const ProfilePreviewWidget({
    super.key,
    required this.name,
    this.profileImageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push('/profile/edit'),
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
                  backgroundImage: profileImageUrl != null
                      ? NetworkImage(profileImageUrl!)
                      : null,
                  child: profileImageUrl == null
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
                  name,
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
