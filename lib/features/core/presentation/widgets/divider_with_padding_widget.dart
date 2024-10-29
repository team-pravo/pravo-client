import 'package:flutter/material.dart';
import 'package:pravo_client/assets/constants.dart';

class DividerWithPaddingWidget extends StatelessWidget {
  final double paddingHeight;

  const DividerWithPaddingWidget({
    super.key,
    this.paddingHeight = 16.0,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: paddingHeight,
      ),
      child: const Divider(
        height: 1,
        color: kDividerColor,
      ),
    );
  }
}
