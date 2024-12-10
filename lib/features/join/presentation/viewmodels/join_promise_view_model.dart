import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pravo_client/features/join/domain/entities/join_promise.dart';
import 'package:pravo_client/features/join/domain/usecases/convert_promise_to_join_promise_usecase.dart';
import 'package:pravo_client/features/promise/domain/entities/promise.dart';

class JoinPromiseViewModel extends StateNotifier<JoinPromise?> {
  final ConvertPromiseToJoinPromiseUseCase _convertUseCase;

  JoinPromiseViewModel(this._convertUseCase) : super(null);

  void convertAndSetJoinPromise(Promise promise) {
    final joinPromise = _convertUseCase.execute(promise);
    state = joinPromise;
  }
}

final joinPromiseProvider =
    StateNotifierProvider<JoinPromiseViewModel, JoinPromise?>((ref) {
  return JoinPromiseViewModel(ConvertPromiseToJoinPromiseUseCase());
});
