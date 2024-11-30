import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:pravo_client/assets/constants.dart';
import 'package:pravo_client/features/core/presentation/widgets/alert_dialog_widget.dart';
import 'package:pravo_client/features/core/presentation/widgets/depth2_app_bar_widget.dart';
import 'package:pravo_client/features/promise/domain/entities/button_status.dart';
import 'package:pravo_client/features/promise/presentation/viewmodels/promise_view_model.dart';
import 'package:pravo_client/features/promise/presentation/widgets/deposit_widget.dart';
import 'package:pravo_client/features/promise/presentation/widgets/participants_and_status_widget.dart';
import 'package:pravo_client/features/promise/presentation/widgets/promise_action_button_widget.dart';
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
        final isInvitedGuest = state.isInvitedGuest;
        final buttonStatus = ButtonStatus.getButtonStatus(
          isOrganizer,
          isInvitedGuest,
          promise.promiseDate,
        );

        return Scaffold(
          appBar: Depth2AppBarWidget(
            title: '약속 상세',
            leadingIcon: PhosphorIcons.caretLeft(),
            leadingOnPressed: () {
              if (Navigator.canPop(context)) {
                context.pop();
              } else {
                context.go('/');
              }
            },
            actionIcon: isInvitedGuest
                ? null
                : isOrganizer
                    ? PhosphorIcons.trash()
                    : PhosphorIcons.signOut(),
            actionOnPressed: () => {
              showDialog(
                context: context,
                builder: (context) => AlertDialogWidget(
                  title: isOrganizer ? '약속을 삭제할까요?' : '약속을 취소할까요?',
                  content: isOrganizer
                      ? '약속을 삭제하면 모두의 예약금이 환급돼요.'
                      : '약속을 취소하면 예약금이 환급되지 않아요.',
                  actionOnPressed: () async {
                    await ref
                        .read(promiseViewModelProvider.notifier)
                        .deleteOrCancelPromise(
                          promise.id,
                          isOrganizer,
                        );
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            isOrganizer ? '약속이 삭제되었습니다.' : '약속이 취소되었습니다.',
                          ),
                        ),
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
                  child: SingleChildScrollView(
                    padding: kScreenPadding,
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
                PromiseActionButtonWidget(
                  buttonStatus: buttonStatus,
                  promiseId: widget.promiseId,
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
