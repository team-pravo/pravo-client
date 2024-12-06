import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:pravo_client/features/core/presentation/widgets/primary_button_widget.dart';
import 'package:pravo_client/features/join/presentation/viewmodels/join_promise_view_model.dart';
import 'package:pravo_client/features/join/presentation/viewmodels/join_view_model.dart';
import 'package:pravo_client/features/promise/domain/entities/button_status.dart';
import 'package:pravo_client/features/promise/domain/entities/promise.dart';
import 'package:pravo_client/features/settlement/presentation/viewmodels/attendees_view_model.dart';

class PromiseActionButtonWidget extends ConsumerStatefulWidget {
  final ButtonStatus buttonStatus;
  final Promise promise;

  const PromiseActionButtonWidget({
    super.key,
    required this.buttonStatus,
    required this.promise,
  });

  @override
  ConsumerState<PromiseActionButtonWidget> createState() =>
      _PromiseActionButtonWidgetState();
}

class _PromiseActionButtonWidgetState
    extends ConsumerState<PromiseActionButtonWidget> {
  String generateInviteLink(int promiseId) {
    final Uri inviteUri = Uri.parse('pravo://pravo.com/promise/$promiseId');
    return inviteUri.toString();
  }

  @override
  Widget build(BuildContext context) {
    return widget.buttonStatus != ButtonStatus.HIDDEN
        ? PrimaryButtonWidget(
            buttonText: widget.buttonStatus.text,
            onTap: () async {
              if (widget.buttonStatus == ButtonStatus.COPY_INVITATION_LINK) {
                final inviteLink = generateInviteLink(widget.promise.id);
                Clipboard.setData(ClipboardData(text: inviteLink));
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('초대 링크가 복사되었습니다.')),
                );
              } else if (widget.buttonStatus ==
                  ButtonStatus.GO_TO_ATTENDANCE_CONFIRMATION) {
                ref
                    .read(attendeesProvider.notifier)
                    .setAttendees(ref, widget.promise.participants);
                context.push(
                  '/promise/${widget.promise.id}/settlement/attendance',
                );
              } else if (widget.buttonStatus == ButtonStatus.JOIN_PROMISE) {
                await ref
                    .read(joinViewModelProvider.notifier)
                    .joinPromiseAndRequestPayment(widget.promise.id);

                ref
                    .read(joinPromiseProvider.notifier)
                    .convertAndSetJoinPromise(widget.promise);

                if (context.mounted) {
                  context.push('/promise/${widget.promise.id}/join/deposit');
                }
              }
            },
            hasHorizontalMargin: true,
            icon: widget.buttonStatus == ButtonStatus.COPY_INVITATION_LINK
                ? PhosphorIcons.link(PhosphorIconsStyle.bold)
                : null,
            iconBeforeText: true,
          )
        : const SizedBox.shrink();
  }
}
