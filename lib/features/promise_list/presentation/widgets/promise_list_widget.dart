import 'package:flutter/material.dart';
import 'package:pravo_client/features/core/presentation/widgets/promise_widget.dart';

class PromiseListWidget extends StatelessWidget {
  const PromiseListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
      child: ListView.builder(
        key: super.key,
        itemCount: 2,
        itemBuilder: (context, index) {
          return PromiseWidget();
        },
      ),
    );
  }
}
