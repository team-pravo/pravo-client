import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:pravo_client/assets/constants.dart';
import 'package:pravo_client/features/promise/presentation/widgets/image_and_text_widget.dart';
import 'package:pravo_client/features/settlement/domain/entites/attendee.dart';

class AttendanceSelectorWidget extends StatelessWidget {
  final Attendee attendee;
  final bool isSelected;
  final ValueChanged<bool> onSelectionChanged;

  const AttendanceSelectorWidget({
    super.key,
    required this.attendee,
    required this.isSelected,
    required this.onSelectionChanged,
  });

  void _handleTap() {
    onSelectionChanged(!isSelected);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? kWidgetBackgroundColor : null,
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 12,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(
                4,
              ),
              decoration: BoxDecoration(
                color: isSelected ? kPrimaryColor : null,
                border: Border.all(
                  color: isSelected ? Colors.transparent : kUnselectedIconColor,
                ),
                borderRadius: BorderRadius.circular(30),
              ),
              child: PhosphorIcon(
                PhosphorIcons.check(PhosphorIconsStyle.bold),
                size: 14,
                color: isSelected ? Colors.white : kUnselectedIconColor,
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            ImageAndTextWidget(name: attendee.name),
          ],
        ),
      ),
    );
  }
}
