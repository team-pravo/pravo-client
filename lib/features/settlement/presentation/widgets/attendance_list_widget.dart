import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pravo_client/features/core/presentation/widgets/vertical_gap_widget.dart';
import 'package:pravo_client/features/settlement/presentation/viewmodels/attendees_view_model.dart';
import 'package:pravo_client/features/settlement/presentation/viewmodels/selected_attendees_view_model.dart';
import 'package:pravo_client/features/settlement/presentation/widgets/attendance_selector_widget.dart';

class AttendanceListWidget extends ConsumerWidget {
  const AttendanceListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final attendees = ref.watch(attendeesProvider);
    final selectedAttendees = ref.watch(selectedAttendeesProvider);

    if (attendees.isEmpty) {
      return const Center(
        child: Text('약속에 참여한 사람이 없습니다.'),
      );
    }

    return Column(
      children: [
        ListView.separated(
          shrinkWrap: true, // <==== limit height. 리스트뷰 크기 고정
          primary: false,
          itemCount: attendees.length,
          itemBuilder: (_, index) {
            final attendee = attendees[index];
            final isSelected = selectedAttendees.contains(attendee);
            return AttendanceSelectorWidget(
              attendee: attendee,
              isSelected: isSelected,
              onSelectionChanged: (bool selected) {
                ref.read(selectedAttendeesProvider.notifier).toggle(attendee);
              },
            );
          },
          separatorBuilder: (_, __) => const VerticalGapWidget(
            gapHeight: 12,
          ),
        ),
      ],
    );
  }
}
