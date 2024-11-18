import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:pravo_client/assets/constants.dart';
import 'package:pravo_client/features/core/presentation/widgets/alert_dialog_widget.dart';
import 'package:pravo_client/features/core/presentation/widgets/depth2_app_bar_widget.dart';
import 'package:pravo_client/features/core/presentation/widgets/divider_with_padding_widget.dart';
import 'package:pravo_client/features/core/presentation/widgets/primary_button_widget.dart';
import 'package:pravo_client/features/promise/presentation/viewmodels/promise_view_model.dart';
import 'package:pravo_client/features/promise/presentation/widgets/deposit_widget.dart';
import 'package:pravo_client/features/promise/presentation/widgets/participants_and_status_widget.dart';
import 'package:pravo_client/features/promise/presentation/widgets/promise_overview_widget.dart';
import 'package:pravo_client/features/promise/presentation/widgets/promise_status_widget.dart';
import 'package:pravo_client/features/promise/domain/entities/promise.dart';

enum ButtonState {
  copyInvitationLink, // 초대 링크 복사 상태
  goToAttendanceConfirmation, // 참석 확인하러 가기 상태
  hidden, // 버튼 숨김 상태
}

final promiseProvider =
    FutureProvider.autoDispose.family<Promise, int>((ref, promiseId) {
  return ref.read(promiseViewModelProvider.notifier).getPromise(promiseId);
});

class PromiseDetailScreen extends ConsumerWidget {
  final int promiseId;
  final bool isAttendanceConfirmed;

  const PromiseDetailScreen({
    super.key,
    required this.promiseId,
    this.isAttendanceConfirmed = false,
  });

  ButtonState getButtonState() {
    return ButtonState.goToAttendanceConfirmation;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final buttonState = getButtonState();

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
              actionOnPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('약속이 삭제되었습니다.')),
                );
                Navigator.of(context).pop();
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
                  child: Consumer(
                    builder: (context, ref, child) {
                      final promiseAsync =
                          ref.watch(promiseProvider(promiseId));
                      return promiseAsync.when(
                        data: (promise) => Column(
                          children: [
                            PromiseOverviewWidget(
                              name: promise.name,
                              location: promise.location,
                              promiseDate: promise.promiseDate,
                              organizer: promise.participants.firstWhere(
                                (participant) =>
                                    participant.role == 'ORGANIZER',
                                orElse: () => throw Exception(
                                  'No participant with role ORGANIZER found',
                                ),
                              ),
                            ),
                            const DividerWithPaddingWidget(
                              paddingHeight: 30,
                            ),
                            ParticipantsAndStatusWidget(
                              participants: promise.participants,
                            ),
                            const DividerWithPaddingWidget(
                              paddingHeight: 30,
                            ),
                            DepositWidget(
                              deposit: promise.deposit,
                            ),
                            const DividerWithPaddingWidget(
                              paddingHeight: 30,
                            ),
                            const PromiseStatusWidget(),
                          ],
                        ),
                        loading: () => const CircularProgressIndicator(),
                        error: (error, stack) =>
                            Center(child: Text('Error: $error')),
                      );
                    },
                  ),
                ),
              ),
            ),
            if (buttonState != ButtonState.hidden)
              PrimaryButtonWidget(
                isEnabled: true,
                onTap: () {
                  if (buttonState == ButtonState.copyInvitationLink) {
                    Clipboard.setData(const ClipboardData(text: '초대 링크'));
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('초대 링크가 복사되었습니다.')),
                    );
                  } else if (buttonState ==
                      ButtonState.goToAttendanceConfirmation) {
                    context.push('/promise/$promiseId/confirm-attendance');
                  }
                },
                buttonColor: kPrimaryColor,
                textColor: Colors.white,
                buttonText: buttonState == ButtonState.copyInvitationLink
                    ? '초대 링크 복사'
                    : '참석 확인하러 가기',
                icon: buttonState == ButtonState.copyInvitationLink
                    ? PhosphorIcons.link(PhosphorIconsStyle.bold)
                    : null,
                iconBeforeText: true,
                hasHorizontalMargin: true,
              ),
          ],
        ),
      ),
    );
  }
}
