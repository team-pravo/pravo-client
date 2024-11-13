import 'package:pravo_client/features/promises/domain/entity/promise.dart';
import 'package:pravo_client/features/promises/domain/repository/promises_repository.dart';

class GetPromisesUseCase {
  final PromisesRepository repository;

  GetPromisesUseCase(this.repository);

  Future<List<Promise>> getUpcomingPromises(DateTime startDate) {
    return repository.getUpcomingPromises(startDate);
  }

  Future<List<Promise>> getPastPromises(DateTime endDate) {
    return repository.getPastPromises(endDate);
  }
}
