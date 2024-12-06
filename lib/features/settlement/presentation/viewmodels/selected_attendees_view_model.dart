import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pravo_client/features/settlement/domain/entites/attendee.dart';

class SelectedAttendeesViewModel extends StateNotifier<List<Attendee>> {
  SelectedAttendeesViewModel() : super([]);

  bool _containsAttendee(Attendee attendee) {
    return state.any((a) => a.id == attendee.id);
  }

  void toggle(Attendee attendee) {
    if (_containsAttendee(attendee)) {
      state = state.where((a) => a.id != attendee.id).toList();
    } else {
      state = [...state, attendee];
    }
  }
}

final selectedAttendeesProvider =
    StateNotifierProvider<SelectedAttendeesViewModel, List<Attendee>>(
  (ref) => SelectedAttendeesViewModel(),
);
