import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:pravo_client/features/promises/presentation/widgets/icon_and_text_widget.dart';
import 'package:pravo_client/features/promises/presentation/widgets/image_and_text_widget.dart';

class PromiseOverviewWidget extends StatelessWidget {
  const PromiseOverviewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ImageAndTextWidget(),
        const SizedBox(
          height: 12,
        ),
        const Text(
          '아보카도 농장 체험',
          style: TextStyle(
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
              title: '아보카도 농장',
            ),
            const SizedBox(
              height: 8,
            ),
            IconAndTextWidget(
              iconData: PhosphorIcons.calendarBlank(PhosphorIconsStyle.fill),
              title: '10월 1일 (수) 12:00AM',
            ),
          ],
        ),
      ],
    );
  }
}
