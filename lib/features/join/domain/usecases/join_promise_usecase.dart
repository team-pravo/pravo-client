import 'package:pravo_client/features/join/domain/repositories/join_repository.dart';

class JoinPromiseUseCase {
  final JoinRepository repository;

  JoinPromiseUseCase(this.repository);

  Future<void> joinPromise(int promiseId) {
    return repository.joinPromise(promiseId);
  }
}
