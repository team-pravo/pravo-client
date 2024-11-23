import 'package:pravo_client/features/promise/domain/entities/promise.dart';
import 'package:pravo_client/features/promise/domain/repositories/promise_repository.dart';

class GetPromiseUseCase {
  final PromiseRepository repository;

  GetPromiseUseCase(this.repository);

  Future<Promise> getPromise(int id) {
    return repository.getPromise(id);
  }

  Future<void> deletePromise(int id) {
    return repository.deletePromise(id);
  }

  Future<void> cancelPromise(int id) {
    return repository.cancelPromise(id);
  }
}
