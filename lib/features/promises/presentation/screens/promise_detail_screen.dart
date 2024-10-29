import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:pravo_client/assets/constants.dart';
import 'package:pravo_client/features/core/presentation/widgets/alert_dialog_widget.dart';
import 'package:pravo_client/features/core/presentation/widgets/depth2_app_bar_widget.dart';
import 'package:pravo_client/features/core/presentation/widgets/divider_with_padding_widget.dart';
import 'package:pravo_client/features/core/presentation/widgets/primary_button_widget.dart';
import 'package:pravo_client/features/promises/presentation/widgets/deposit_widget.dart';
import 'package:pravo_client/features/promises/presentation/widgets/participants_and_status_widget.dart';
import 'package:pravo_client/features/promises/presentation/widgets/promise_overview_widget.dart';
import 'package:pravo_client/features/promises/presentation/widgets/promise_status_widget.dart';

class PromiseDetailScreen extends ConsumerWidget {
  const PromiseDetailScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: Depth2AppBarWidget(
        title: '약속 상세',
        leadingIcon: PhosphorIcons.caretLeft(),
        leadingOnPressed: () => context.pop(),
        actionIcon: PhosphorIcons.trash(),
        actionOnPressed: () => {
          showDialog(
            context: context,
            builder: (context) => AlertDialogWidget(
              title: '약속을 삭제할까요?',
              content: '이미 만들어진 약속을 삭제하면\n참여한 사람들이 당황할 수 있어요.',
              actionOnPressed: () {},
              actionTitle: '삭제',
            ),
          ),
        },
      ),
      body: Padding(
        padding: kScreenPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const PromiseOverviewWidget(),
            const DividerWithPaddingWidget(
              paddingHeight: 30,
            ),
            const ParticipantsAndStatusWidget(),
            const DividerWithPaddingWidget(
              paddingHeight: 30,
            ),
            const DepositWidget(),
            const DividerWithPaddingWidget(
              paddingHeight: 30,
            ),
            const PromiseStatusWidget(),
            const Spacer(
              flex: 1,
            ),
            PrimaryButtonWidget(
              onTap: () {},
              buttonColor: kPrimaryColor,
              textColor: Colors.white,
              buttonText: '초대 링크 복사',
              icon: PhosphorIcons.link(PhosphorIconsStyle.bold),
              iconBeforeText: true,
            ),
          ],
        ),
      ),
    );
  }
}
