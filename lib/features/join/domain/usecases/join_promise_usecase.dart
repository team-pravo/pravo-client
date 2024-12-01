import 'package:pravo_client/features/join/domain/repositories/join_repository.dart';

class JoinPromiseUseCase {
  final JoinRepository repository;

  JoinPromiseUseCase(this.repository);

  Future<void> execute(int promiseId) {
    return repository.joinPromise(promiseId);
  }
}
