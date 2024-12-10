import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pravo_client/features/promise/domain/entities/participant.dart';
import 'package:pravo_client/features/settlement/domain/entites/attendee.dart';

class AttendeesViewModel extends StateNotifier<List<Attendee>> {
  AttendeesViewModel() : super([]);

  void setAttendees(WidgetRef ref, List<Participant> participants) {
    final attendees = participants.map((participant) {
      return Attendee(
        id: participant.id,
        name: participant.name,
        profileImageUrl: participant.profileImageUrl,
      );
    }).toList();
    state = attendees;
  }
}

final attendeesProvider =
    StateNotifierProvider<AttendeesViewModel, List<Attendee>>(
  (ref) => AttendeesViewModel(),
);
