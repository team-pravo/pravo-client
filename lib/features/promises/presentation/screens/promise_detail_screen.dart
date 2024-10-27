import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pravo_client/features/core/presentation/widgets/depth2_app_bar_widget.dart';
import 'package:pravo_client/features/promises/presentation/widgets/deposit_widget.dart';
import 'package:pravo_client/features/promises/presentation/widgets/participants_widget.dart';
import 'package:pravo_client/features/promises/presentation/widgets/promise_overview_widget.dart';

class PromiseDetailScreen extends ConsumerWidget {
  const PromiseDetailScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: Depth2AppBarWidget(
        title: '약속 상세',
        leadingIcon: Icons.chevron_left_rounded,
        leadingOnPressed: () => context.pop(),
        actionIcon: Icons.delete_outline,
        actionOnPressed: () => {},
      ),
      body: const Padding(
        padding: EdgeInsets.fromLTRB(27, 50, 38, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PromiseOverviewWidget(),
            ParticipantsWidget(),
            DepositWidget(),
          ],
        ),
      ),
    );
  }
}
