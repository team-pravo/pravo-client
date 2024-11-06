import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:pravo_client/assets/constants.dart';

class PromiseWidget extends StatelessWidget {
  final int promiseId;

  const PromiseWidget({super.key, required this.promiseId});

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
                      child: Padding(
                        padding: const EdgeInsets.all(6),
                        child: Image.asset(
                          'assets/images/avocado.png',
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 12),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '아보카도 농장 체험',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            'Mr. Avocado',
                            style: TextStyle(
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
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    '아보카도 농장',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Text(
                    '•',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Text(
                    '10월 1일 12:00AM',
                    style: TextStyle(
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
