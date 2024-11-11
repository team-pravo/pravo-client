import 'package:pravo_client/features/promises/data/repository/promise_repository.dart';
import 'package:pravo_client/features/promises/domain/entity/promise.dart';

class GetPromisesUseCase {
  final PromisesRepository repository;

  GetPromisesUseCase(this.repository);

  Future<List<Promise>> call() async {
    return await repository.getPromises();
  }
}
