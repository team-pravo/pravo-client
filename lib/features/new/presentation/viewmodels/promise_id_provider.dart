import 'package:flutter_riverpod/flutter_riverpod.dart';

class PromiseIdNotifier extends StateNotifier<int?> {
  PromiseIdNotifier() : super(null);

  void setPromiseId(int promiseId) {
    state = promiseId;
  }
}

final promiseIdProvider = StateNotifierProvider<PromiseIdNotifier, int?>((ref) {
  return PromiseIdNotifier();
});
