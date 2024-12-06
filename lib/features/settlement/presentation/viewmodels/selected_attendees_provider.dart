import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pravo_client/features/settlement/domain/entites/attendee.dart';

final selectedAttendeesProvider = StateProvider<List<Attendee>>((ref) => []);
