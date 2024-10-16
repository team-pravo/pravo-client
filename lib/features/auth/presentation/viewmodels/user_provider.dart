import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pravo_client/features/auth/data/models/user_model.dart';

final userProvider = StateNotifierProvider<UserStateNotifer, UserModel?>(
  (ref) => UserStateNotifer(),
);

class UserStateNotifer extends StateNotifier<UserModel?> {
  UserStateNotifer() : super(null);

  void appleLogin({required String name}) {
    state = UserModel(name: name, platform: Platform.apple);
  }

  void kakaoLogin({required String name}) {
    state = UserModel(name: name, platform: Platform.kakao);
  }

  void logout() {
    state = null;
  }
}
