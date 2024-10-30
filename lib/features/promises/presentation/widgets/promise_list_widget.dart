import 'package:flutter/material.dart';
import 'package:pravo_client/assets/constants.dart';
import 'package:pravo_client/features/core/presentation/widgets/promise_widget.dart';
import 'package:pravo_client/features/core/presentation/widgets/vertical_gap_widget.dart';

class PromiseListWidget extends StatelessWidget {
  const PromiseListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kScreenPadding,
      child: ListView.separated(
        key: super.key,
        itemCount: 5,
        itemBuilder: (context, index) {
          return const PromiseWidget();
        },
        separatorBuilder: (BuildContext context, int index) {
          return const VerticalGapWidget(
            gapHeight: 30,
          );
        },
      ),
    );
  }
}
