import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pravo_client/features/auth/data/models/member_model.dart';

final memberProvider = StateNotifierProvider<MemberStateNotifier, MemberModel?>(
  (ref) => MemberStateNotifier(),
);

class MemberStateNotifier extends StateNotifier<MemberModel?> {
  MemberStateNotifier() : super(null);

  void logout() {
    state = null;
  }
}
