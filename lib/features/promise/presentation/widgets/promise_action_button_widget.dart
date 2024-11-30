import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:pravo_client/features/core/presentation/widgets/primary_button_widget.dart';
import 'package:pravo_client/features/promise/domain/entities/button_status.dart';

class PromiseActionButtonWidget extends StatelessWidget {
  final ButtonStatus buttonStatus;
  final int promiseId;

  const PromiseActionButtonWidget({
    super.key,
    required this.buttonStatus,
    required this.promiseId,
  });

  String generateInviteLink(int promiseId) {
    final Uri inviteUri = Uri.parse('pravo://pravo.com/promise/$promiseId');
    return inviteUri.toString();
  }

  @override
  Widget build(BuildContext context) {
    return buttonStatus != ButtonStatus.HIDDEN
        ? PrimaryButtonWidget(
            buttonText: buttonStatus.text,
            onTap: () {
              if (buttonStatus == ButtonStatus.COPY_INVITATION_LINK) {
                final inviteLink = generateInviteLink(promiseId);
                Clipboard.setData(ClipboardData(text: inviteLink));
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('초대 링크가 복사되었습니다.')),
                );
              } else if (buttonStatus ==
                  ButtonStatus.GO_TO_ATTENDANCE_CONFIRMATION) {
                context.push('/promise/$promiseId/settlement/attendance');
              } else if (buttonStatus == ButtonStatus.JOIN_PROMISE) {
                context.push('/promise/$promiseId/join/deposit');
              }
            },
            hasHorizontalMargin: true,
            icon: buttonStatus == ButtonStatus.COPY_INVITATION_LINK
                ? PhosphorIcons.link(PhosphorIconsStyle.bold)
                : null,
            iconBeforeText: true,
          )
        : const SizedBox.shrink();
  }
}
