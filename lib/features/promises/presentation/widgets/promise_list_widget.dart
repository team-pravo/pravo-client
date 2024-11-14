import 'package:flutter/material.dart';
import 'package:pravo_client/assets/constants.dart';
import 'package:pravo_client/features/core/presentation/widgets/promise_widget.dart';
import 'package:pravo_client/features/core/presentation/widgets/vertical_gap_widget.dart';
import 'package:pravo_client/features/promises/domain/entities/promise.dart';

class PromiseListWidget extends StatelessWidget {
  final List<Promise> promises;
  const PromiseListWidget({
    super.key,
    required this.promises,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kScreenPadding,
      child: ListView.separated(
        key: super.key,
        itemCount: promises.length,
        itemBuilder: (context, index) {
          final promise = promises[index];
          return PromiseWidget(
            promiseId: promise.id,
            promiseName: promise.name,
            promiseDate: promise.promiseDate,
            location: promise.location,
            organizerName: promise.organizerName,
            organizerProfileImageUrl: promise.organizerProfileImageUrl,
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const VerticalGapWidget(
            gapHeight: 20,
          );
        },
      ),
    );
  }
}
