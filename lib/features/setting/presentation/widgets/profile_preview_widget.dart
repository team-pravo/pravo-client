import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:pravo_client/assets/constants.dart';

class ProfilePreviewWidget extends StatelessWidget {
  const ProfilePreviewWidget({super.key});

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
                  radius: 24,
                  child: Padding(
                    padding: const EdgeInsets.all(7.0),
                    child: Image.asset(
                      'assets/images/avocado.png',
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                const Text(
                  'Mr. Avocado',
                  style: TextStyle(
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
