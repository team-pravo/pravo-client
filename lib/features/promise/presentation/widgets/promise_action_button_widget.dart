import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:pravo_client/features/core/presentation/widgets/primary_button_widget.dart';
import 'package:pravo_client/features/join/presentation/viewmodels/join_view_model.dart';
import 'package:pravo_client/features/promise/domain/entities/button_status.dart';

class PromiseActionButtonWidget extends ConsumerStatefulWidget {
  final ButtonStatus buttonStatus;
  final int promiseId;

  const PromiseActionButtonWidget({
    super.key,
    required this.buttonStatus,
    required this.promiseId,
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
    final joinState = ref.watch(joinViewModelProvider);

    joinState.when(
      data: (paymentResponse) =>
          context.push('/promise/${widget.promiseId}/join/deposit'),
      error: (error, stackTrace) {},
      loading: () {},
    );

    return widget.buttonStatus != ButtonStatus.HIDDEN
        ? PrimaryButtonWidget(
            buttonText: widget.buttonStatus.text,
            onTap: () async {
              if (widget.buttonStatus == ButtonStatus.COPY_INVITATION_LINK) {
                final inviteLink = generateInviteLink(widget.promiseId);
                Clipboard.setData(ClipboardData(text: inviteLink));
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('초대 링크가 복사되었습니다.')),
                );
              } else if (widget.buttonStatus ==
                  ButtonStatus.GO_TO_ATTENDANCE_CONFIRMATION) {
                context
                    .push('/promise/${widget.promiseId}/settlement/attendance');
              } else if (widget.buttonStatus == ButtonStatus.JOIN_PROMISE) {
                await ref
                    .read(joinViewModelProvider.notifier)
                    .joinPromiseAndRequestPayment(widget.promiseId);
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
