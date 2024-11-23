import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:pravo_client/features/promise/data/repositories/promise_repository_impl.dart';
import 'package:pravo_client/features/promise/domain/entities/promise.dart';
import 'package:pravo_client/features/promise/domain/usecases/get_promise_usecase.dart';

class PromiseState {
  final Promise promise;
  final bool isOrganizer;

  PromiseState({
    required this.promise,
    required this.isOrganizer,
  });
}

class PromiseViewModel extends StateNotifier<AsyncValue<PromiseState>> {
  final _secureStorage = const FlutterSecureStorage();
  final GetPromiseUseCase _getPromiseUseCase;

  PromiseViewModel(this._getPromiseUseCase) : super(const AsyncValue.loading());

  Future<void> getPromise(int id) async {
    final promise = await _getPromiseUseCase.getPromise(id);
    final memberId = await _secureStorage.read(key: 'member_id');
    final isOrganizer = promise.participants.any(
      (participant) =>
          participant.role == 'ORGANIZER' &&
          participant.id.toString() == memberId,
    );

    state = AsyncValue.data(
      PromiseState(
        promise: promise,
        isOrganizer: isOrganizer,
      ),
    );
  }

  Future<void> deleteOrCancelPromise(int promiseId, bool isOrganizer) async {
    if (isOrganizer) {
      await _getPromiseUseCase.deletePromise(promiseId);
    } else {
      await _getPromiseUseCase.cancelPromise(promiseId);
    }
  }
}

final promiseViewModelProvider =
    StateNotifierProvider<PromiseViewModel, AsyncValue<PromiseState>>(
  (ref) => PromiseViewModel(
    GetPromiseUseCase(ref.read(promiseRepositoryProvider)),
  ),
);
