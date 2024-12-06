import 'package:flutter/material.dart';
import 'package:pravo_client/features/core/presentation/widgets/vertical_gap_widget.dart';
import 'package:pravo_client/features/settlement/presentation/widgets/attendance_selector_widget.dart';

class AttendanceListWidget extends StatelessWidget {
  const AttendanceListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.separated(
          shrinkWrap: true, // <==== limit height. 리스트뷰 크기 고정
          primary: false,
          itemCount: 10,
          itemBuilder: (_, __) => const AttendanceSelectorWidget(),
          separatorBuilder: (_, __) => const VerticalGapWidget(
            gapHeight: 12,
          ),
        ),
      ],
    );
  }
}
