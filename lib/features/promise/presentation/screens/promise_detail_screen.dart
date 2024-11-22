import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:pravo_client/assets/constants.dart';
import 'package:pravo_client/features/core/presentation/widgets/alert_dialog_widget.dart';
import 'package:pravo_client/features/core/presentation/widgets/depth2_app_bar_widget.dart';
import 'package:pravo_client/features/core/presentation/widgets/primary_button_widget.dart';
import 'package:pravo_client/features/promise/domain/entities/button_status.dart';
import 'package:pravo_client/features/promise/presentation/viewmodels/promise_view_model.dart';
import 'package:pravo_client/features/promise/presentation/widgets/deposit_widget.dart';
import 'package:pravo_client/features/promise/presentation/widgets/participants_and_status_widget.dart';
import 'package:pravo_client/features/promise/presentation/widgets/promise_overview_widget.dart';
import 'package:pravo_client/features/promise/presentation/widgets/promise_status_widget.dart';

class PromiseDetailScreen extends ConsumerStatefulWidget {
  final int promiseId;
  final bool isAttendanceConfirmed;

  const PromiseDetailScreen({
    super.key,
    required this.promiseId,
    this.isAttendanceConfirmed = false,
  });

  @override
  ConsumerState<PromiseDetailScreen> createState() =>
      _PromiseDetailScreenState();
}

class _PromiseDetailScreenState extends ConsumerState<PromiseDetailScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(promiseViewModelProvider.notifier).getPromise(widget.promiseId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final promiseState = ref.watch(promiseViewModelProvider);

    return promiseState.when(
      data: (state) {
        final promise = state.promise;
        final isOrganizer = state.isOrganizer;
        final buttonStatus =
            ButtonStatus.getButtonStatus(isOrganizer, promise.promiseDate);

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
                  actionOnPressed: () async {
                    await ref
                        .read(promiseViewModelProvider.notifier)
                        .deleteOrCancelPromise(
                          promise.id,
                          isOrganizer,
                        );
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('약속이 삭제되었습니다.')),
                      );
                      context.go('/');
                    }
                  },
                  actionTitle: '삭제',
                ),
              ),
            },
          ),
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Padding(
                    padding: kScreenPadding,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          PromiseOverviewWidget(
                            name: promise.name,
                            location: promise.location,
                            promiseDate: promise.promiseDate,
                            organizer: promise.participants.firstWhere(
                              (participant) => participant.role == 'ORGANIZER',
                            ),
                          ),
                          ParticipantsAndStatusWidget(
                            participants: promise.participants,
                          ),
                          DepositWidget(
                            deposit: promise.deposit,
                          ),
                          const PromiseStatusWidget(),
                        ],
                      ),
                    ),
                  ),
                ),
                if (buttonStatus != ButtonStatus.hidden)
                  PrimaryButtonWidget(
                    isEnabled: true,
                    onTap: () {
                      if (buttonStatus == ButtonStatus.copyInvitationLink) {
                        Clipboard.setData(const ClipboardData(text: '초대 링크'));
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('초대 링크가 복사되었습니다.')),
                        );
                      } else if (buttonStatus ==
                          ButtonStatus.goToAttendanceConfirmation) {
                        context.push(
                          '/promise/${widget.promiseId}/confirm-attendance',
                        );
                      }
                    },
                    buttonColor: kPrimaryColor,
                    textColor: Colors.white,
                    buttonText: buttonStatus.text,
                    icon: buttonStatus == ButtonStatus.copyInvitationLink
                        ? PhosphorIcons.link(PhosphorIconsStyle.bold)
                        : null,
                    iconBeforeText: true,
                    hasHorizontalMargin: true,
                  ),
              ],
            ),
          ),
        );
      },
      loading: () => const Scaffold(
        appBar: Depth2AppBarWidget(title: '약속 상세'),
        body: Center(child: CircularProgressIndicator()),
      ),
      error: (error, stack) => Scaffold(
        appBar: const Depth2AppBarWidget(title: '약속 상세'),
        body: Center(child: Text('Error: $error')),
      ),
    );
  }
}
