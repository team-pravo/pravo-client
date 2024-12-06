import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:pravo_client/assets/constants.dart';
import 'package:pravo_client/features/promise/presentation/widgets/image_and_text_widget.dart';

class AttendanceSelectorWidget extends StatefulWidget {
  const AttendanceSelectorWidget({
    super.key,
  });

  @override
  State<AttendanceSelectorWidget> createState() =>
      _AttendanceSelectorWidgetState();
}

class _AttendanceSelectorWidgetState extends State<AttendanceSelectorWidget> {
  bool isSelected = false;

  void toggleSelection() {
    setState(() {
      isSelected = !isSelected; // 클릭할 때마다 상태를 반전
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: toggleSelection,
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
            const ImageAndTextWidget(name: 'Mr. Avocado'), // FIXME
          ],
        ),
      ),
    );
  }
}
