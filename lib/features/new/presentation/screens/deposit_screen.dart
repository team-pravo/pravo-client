import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pravo_client/features/core/presentation/widgets/depth2_app_bar_widget.dart';

class DepositScreen extends StatelessWidget {
  const DepositScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Depth2AppBarWidget(
        title: '예약금 결제',
        leadingIcon: Icons.chevron_left_rounded,
        leadingOnPressed: () => context.pop(),
      ),
    );
  }
}
