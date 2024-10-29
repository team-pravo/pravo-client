import 'package:flutter/material.dart';
import 'package:pravo_client/assets/constants.dart';
import 'package:pravo_client/features/core/presentation/widgets/dialog_button_widget.dart';

class AlertDialogWidget extends StatelessWidget {
  final String title;
  final String content;
  final VoidCallback actionOnPressed;
  final String actionTitle;

  const AlertDialogWidget({
    super.key,
    required this.title,
    required this.content,
    required this.actionOnPressed,
    required this.actionTitle,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      titlePadding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
      contentPadding: const EdgeInsets.fromLTRB(30, 24, 30, 0),
      actionsPadding: const EdgeInsets.fromLTRB(30, 24, 30, 30),
      actionsAlignment: MainAxisAlignment.spaceBetween,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
      content: Text(
        content,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
      ),
      actions: [
        DialogButtonWidget(
          buttonText: '취소',
          onTap: () => Navigator.of(context).pop(),
          buttonColor: kWidgetBackgroundColor,
          textColor: Colors.black,
        ),
        DialogButtonWidget(
          buttonText: actionTitle,
          onTap: actionOnPressed,
          buttonColor: kPrimaryColor,
          textColor: Colors.white,
        ),
      ],
    );
  }
}
