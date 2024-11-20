import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:pravo_client/app/formatter.dart';
import 'package:pravo_client/features/core/presentation/widgets/divider_with_padding_widget.dart';
import 'package:pravo_client/features/promise/domain/entities/participant.dart';
import 'package:pravo_client/features/promise/presentation/widgets/icon_and_text_widget.dart';
import 'package:pravo_client/features/promise/presentation/widgets/image_and_text_widget.dart';

class PromiseOverviewWidget extends StatelessWidget {
  final String name;
  final String location;
  final DateTime promiseDate;
  final Participant organizer;

  const PromiseOverviewWidget({
    super.key,
    required this.name,
    required this.location,
    required this.promiseDate,
    required this.organizer,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ImageAndTextWidget(
          name: organizer.name,
          imageUrl: organizer.profileImageUrl,
        ),
        const SizedBox(
          height: 12,
        ),
        Text(
          name,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconAndTextWidget(
              iconData: PhosphorIcons.mapPin(PhosphorIconsStyle.fill),
              title: location,
            ),
            const SizedBox(
              height: 8,
            ),
            IconAndTextWidget(
              iconData: PhosphorIcons.calendarBlank(PhosphorIconsStyle.fill),
              title: Formatter.format(promiseDate),
            ),
          ],
        ),
        const DividerWithPaddingWidget(
          paddingHeight: 30,
        ),
      ],
    );
  }
}
