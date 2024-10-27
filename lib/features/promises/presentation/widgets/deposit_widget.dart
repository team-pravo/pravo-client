import 'package:flutter/material.dart';
import 'package:pravo_client/features/promises/presentation/widgets/icon_and_text_widget.dart';

class DepositWidget extends StatelessWidget {
  const DepositWidget({
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
            '예약금',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          IconAndTextWidget(
            iconData: Icons.wallet,
            title: '1,000',
          ),
        ],
      ),
    );
  }
}
