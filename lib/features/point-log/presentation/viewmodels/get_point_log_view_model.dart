import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pravo_client/features/point-log/data/repositories/point_log_repository_impl.dart';
import 'package:pravo_client/features/point-log/domain/entities/point_log.dart';
import 'package:pravo_client/features/point-log/domain/repositories/point_log_repository.dart';

class GetPointLogViewModel extends StateNotifier<AsyncValue<List<PointLog>>> {
  final PointLogRepository repository;

  GetPointLogViewModel({required this.repository})
      : super(const AsyncValue.loading()) {
    fetchPointLogs();
  }

  Future<void> fetchPointLogs() async {
    try {
      final logs = await repository.getPointLogs();
      state = AsyncValue.data(logs);
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }
}

final getPointLogViewModelProvider =
    StateNotifierProvider<GetPointLogViewModel, AsyncValue<List<PointLog>>>(
        (ref) {
  final repository = ref.watch(pointLogRepositoryProvider);
  return GetPointLogViewModel(repository: repository);
});
