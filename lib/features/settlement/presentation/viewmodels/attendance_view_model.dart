import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pravo_client/features/promise/domain/entities/participant.dart';
import 'package:pravo_client/features/settlement/domain/entites/attendee.dart';

class AttendanceViewModel extends StateNotifier<List<Attendee>> {
  AttendanceViewModel() : super([]);

  void setAttendees(WidgetRef ref, List<Participant> participants) {
    final attendees = participants.map((participant) {
      return Attendee(
        id: participant.id,
        name: participant.name,
      );
    }).toList();
    state = attendees;
  }
}

final attendanceViewModelProvider =
    StateNotifierProvider<AttendanceViewModel, List<Attendee>>(
  (ref) => AttendanceViewModel(),
);
