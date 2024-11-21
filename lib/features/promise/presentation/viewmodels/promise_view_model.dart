import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pravo_client/features/promise/data/repositories/promise_repository_impl.dart';
import 'package:pravo_client/features/promise/domain/entities/promise.dart';
import 'package:pravo_client/features/promise/domain/usecases/get_promise_usecase.dart';

class PromiseViewModel extends StateNotifier<AsyncValue<Promise?>> {
  final GetPromiseUseCase _getPromiseUseCase;

  PromiseViewModel(this._getPromiseUseCase) : super(const AsyncValue.loading());

  Future<Promise> getPromise(int id) async {
    final promise = await _getPromiseUseCase.getPromise(id);
    state = AsyncValue.data(promise);
    return promise;
  }

  Future<void> deletePromise(int id) async {
    await _getPromiseUseCase.deletePromise(id);
    state = const AsyncValue.data(null);
  }
}

final promiseViewModelProvider =
    StateNotifierProvider<PromiseViewModel, AsyncValue<Promise?>>(
  (ref) => PromiseViewModel(
    GetPromiseUseCase(ref.read(promiseRepositoryProvider)),
  ),
);
