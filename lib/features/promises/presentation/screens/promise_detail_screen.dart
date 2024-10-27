import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pravo_client/assets/constants.dart';
import 'package:pravo_client/features/core/presentation/widgets/alert_dialog_widget.dart';
import 'package:pravo_client/features/core/presentation/widgets/depth2_app_bar_widget.dart';
import 'package:pravo_client/features/core/presentation/widgets/primary_button_widget.dart';
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
        actionOnPressed: () => {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialogWidget(
                title: '약속을 정말 삭제할까요?',
                content: '이미 만들어진 약속을 삭제하면\n참여한 사람들이 당황할 수 있어요.',
                actionOnPressed: () {},
                actionTitle: '삭제',
              );
            },
          ),
        },
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(27, 50, 38, 37),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const PromiseOverviewWidget(),
            const ParticipantsWidget(),
            const DepositWidget(),
            const Spacer(
              flex: 1,
            ),
            PrimaryButtonWidget(
              onTap: () {},
              buttonColor: kPrimaryColor,
              textColor: Colors.white,
              buttonText: '초대 링크 복사',
              icon: Icons.ios_share,
              iconBeforeText: true,
            ),
          ],
        ),
      ),
    );
  }
}
