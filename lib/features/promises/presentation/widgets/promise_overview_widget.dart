import 'package:flutter/material.dart';
import 'package:pravo_client/features/promises/presentation/widgets/icon_and_text_widget.dart';

class PromiseOverviewWidget extends StatelessWidget {
  const PromiseOverviewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '아보카도 농장 체험',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          IconAndTextWidget(
            iconData: Icons.location_on,
            title: '아보카도 농장',
          ),
          SizedBox(
            height: 10,
          ),
          IconAndTextWidget(
            iconData: Icons.calendar_month,
            title: '10월 1일, 12:00AM',
          ),
        ],
      ),
    );
  }
}
