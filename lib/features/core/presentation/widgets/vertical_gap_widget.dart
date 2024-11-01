import 'package:flutter/material.dart';

class VerticalGapWidget extends StatelessWidget {
  final double gapHeight;

  const VerticalGapWidget({
    super.key,
    this.gapHeight = 16.0,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: gapHeight,
    );
  }
}
