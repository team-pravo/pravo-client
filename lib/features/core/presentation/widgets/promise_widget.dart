import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:pravo_client/assets/constants.dart';

class PromiseWidget extends StatelessWidget {
  final int promiseId;
  final String promiseName;
  final String organizerName;
  final String location;
  final DateTime scheduledAt;
  final String? organizerProfileImageUrl;

  const PromiseWidget({
    super.key,
    required this.promiseId,
    required this.promiseName,
    required this.organizerName,
    required this.location,
    required this.scheduledAt,
    this.organizerProfileImageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push('/promise/$promiseId'),
      child: Container(
        padding: kWidgetPadding,
        decoration: BoxDecoration(
          color: kWidgetBackgroundColor,
          borderRadius: kWidgetBorderRadius,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: kAvatarBackgroundColor,
                      backgroundImage: organizerProfileImageUrl != null
                          ? NetworkImage(organizerProfileImageUrl!)
                          : null,
                      child: organizerProfileImageUrl == null
                          ? Padding(
                              padding: const EdgeInsets.all(6),
                              child: Image.asset(
                                'assets/images/avocado.png',
                              ),
                            )
                          : null,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            promiseName,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            organizerName,
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                PhosphorIcon(
                  PhosphorIcons.caretRight(
                    PhosphorIconsStyle.regular,
                  ),
                  size: 16,
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(
                top: 16,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    location,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  const Text(
                    '•',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    '${scheduledAt.month}월 ${scheduledAt.day}일 ${scheduledAt.hour}:${scheduledAt.minute.toString().padLeft(2, '0')}',
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
