import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:pravo_client/assets/constants.dart';

class PromiseWidget extends StatelessWidget {
  final int promiseId;
  final String? promiseName; // FIXME: 수정할 코드가 많아져서 임시로 nullable하게 처리 했음!!
  final String? organizerName;
  final String? location;
  final DateTime? promiseDate;
  final String? organizerProfileImageUrl;

  const PromiseWidget({
    super.key,
    required this.promiseId,
    this.promiseName,
    this.organizerName,
    this.location,
    this.promiseDate,
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
                            promiseName ?? '아보카도 농장 체험',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            organizerName ?? 'Mr. Avocado',
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
                    location ?? '아보카도 농장',
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
                    promiseDate != null
                        ? '${promiseDate!.month}월 ${promiseDate!.day}일 ${promiseDate!.hour}:${promiseDate!.minute.toString().padLeft(2, '0')}'
                        : '10월 1일 12:00AM',
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
