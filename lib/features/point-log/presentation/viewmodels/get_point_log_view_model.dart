import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pravo_client/features/point-log/domain/entities/point_log.dart';
import 'package:pravo_client/features/point-log/domain/entities/point_status.dart';

class GetPointLogViewModel extends StateNotifier<AsyncValue<List<PointLog>>> {
  // final PointLogRepository repository;

  // GetPointLogViewModel({required this.repository})
  //     : super(const AsyncValue.loading()) {
  //   _fetchPointLogs();
  // }

  GetPointLogViewModel() : super(const AsyncValue.loading()) {
    fetchPointLogs();
  }

  Future<void> fetchPointLogs() async {
    final pointLogs = [
      PointLog(
        promiseName: '흰둥이 산책하기',
        pointStatus: PointStatus.PLUS,
        pointAmount: 333,
        pointDate: DateTime.now(),
      ),
      PointLog(
        promiseName: '흰둥이 산책하기',
        pointStatus: PointStatus.MINUS,
        pointAmount: 333,
        pointDate: DateTime.now(),
      ),
      PointLog(
        promiseName: '고양이 산책하기',
        pointStatus: PointStatus.PLUS,
        pointAmount: 250,
        pointDate: DateTime.now(),
      ),
    ];

    state = AsyncValue.data(pointLogs);
    // try {
    //   throw Exception('');
    // } catch (e, stack) {
    //   state = AsyncValue.error(e, stack);
    // }

    // try {
    //   final logs = await repository.getPointLogs();
    //   state = AsyncValue.data(logs);
    // } catch (e, stack) {
    //   state = AsyncValue.error(e, stack);
    // }
  }
}

final getPointLogViewModelProvider =
    StateNotifierProvider<GetPointLogViewModel, AsyncValue<List<PointLog>>>(
        (ref) {
  // final repository = ref.watch(pointLogRepositoryProvider);
  return GetPointLogViewModel();
});
