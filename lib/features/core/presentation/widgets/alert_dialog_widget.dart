import 'package:flutter/material.dart';
import 'package:pravo_client/assets/constants.dart';

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
      titlePadding: const EdgeInsets.fromLTRB(30, 20, 30, 12),
      contentPadding: const EdgeInsets.fromLTRB(30, 12, 30, 12),
      actionsPadding: const EdgeInsets.fromLTRB(30, 12, 30, 20),
      actionsAlignment: MainAxisAlignment.spaceBetween,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
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
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.black,
            backgroundColor: kWidgetBackgroundColor,
            minimumSize: const Size(115, 30),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: const Text(
            '취소',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        ElevatedButton(
          onPressed: actionOnPressed,
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: kPrimaryColor,
            minimumSize: const Size(115, 30),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Text(
            actionTitle,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
