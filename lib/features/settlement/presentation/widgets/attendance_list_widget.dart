import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pravo_client/features/core/presentation/widgets/vertical_gap_widget.dart';
import 'package:pravo_client/features/settlement/domain/entites/attendee.dart';
import 'package:pravo_client/features/settlement/presentation/viewmodels/attendees_view_model.dart';
import 'package:pravo_client/features/settlement/presentation/viewmodels/selected_attendees_provider.dart';
import 'package:pravo_client/features/settlement/presentation/widgets/attendance_selector_widget.dart';

class AttendanceListWidget extends ConsumerWidget {
  const AttendanceListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final attendees = ref.watch(attendeesProvider);
    final selectedAttendees = ref.watch(selectedAttendeesProvider);

    void handleSelectionChanged(Attendee attendee, bool isSelected) {
      final notifier = ref.read(selectedAttendeesProvider.notifier);
      if (isSelected) {
        if (!notifier.state.contains(attendee)) {
          notifier.update((state) => [...state, attendee]);
        }
      } else {
        notifier.update(
          (state) => state.where((a) => a.id != attendee.id).toList(),
        );
      }
    }

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
                handleSelectionChanged(attendee, selected);
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
