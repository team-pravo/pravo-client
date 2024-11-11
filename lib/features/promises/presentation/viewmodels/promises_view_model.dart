import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pravo_client/features/core/dio/dio_provider.dart';
import 'package:pravo_client/features/promises/data/repository/promise_repository.dart';
import 'package:pravo_client/features/promises/domain/entity/promise.dart';
import 'package:pravo_client/features/promises/domain/usecase/get_promises_usecase.dart';

class PromisesViewModel extends StateNotifier<AsyncValue<List<Promise>>> {
  final GetPromisesUseCase _getPromisesUseCase;

  PromisesViewModel(this._getPromisesUseCase)
      : super(const AsyncValue.loading()) {
    fetchPromises();
  }

  Future<void> fetchPromises() async {
    try {
      final promises = await _getPromisesUseCase();
      state = AsyncValue.data(promises);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}

final promisesViewModelProvider =
    StateNotifierProvider<PromisesViewModel, AsyncValue<List<Promise>>>(
  (ref) => PromisesViewModel(
    GetPromisesUseCase(PromisesRepository(ref.read(dioProvider))),
  ),
);
