import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pravo_client/features/promises/data/repository/promises_repository_impl.dart';
import 'package:pravo_client/features/promises/domain/entity/promise.dart';
import 'package:pravo_client/features/promises/domain/usecase/get_promises_usecase.dart';

class PromisesViewModel extends StateNotifier<AsyncValue<List<Promise>>> {
  final GetPromisesUseCase _getPromisesUseCase;

  PromisesViewModel(this._getPromisesUseCase)
      : super(const AsyncValue.loading());

  Future<List<Promise>> fetchUpcomingPromises(DateTime startDate) async {
    final promises = await _getPromisesUseCase.getUpcomingPromises(startDate);
    state = AsyncValue.data(promises);
    return promises;
  }

  Future<List<Promise>> fetchPastPromises(DateTime endDate) async {
    final promises = await _getPromisesUseCase.getPastPromises(endDate);
    state = AsyncValue.data(promises);
    return promises;
  }
}

final promisesViewModelProvider =
    StateNotifierProvider<PromisesViewModel, AsyncValue<List<Promise>>>(
  (ref) => PromisesViewModel(
    GetPromisesUseCase(ref.read(promisesRepositoryProvider)),
  ),
);
