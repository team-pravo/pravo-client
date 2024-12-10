import 'package:pravo_client/features/join/domain/repositories/join_repository.dart';

class ChangeParticipantStatusUseCase {
  final JoinRepository repository;

  ChangeParticipantStatusUseCase(this.repository);

  Future<void> execute(int promiseId) {
    return repository.changeParticipantStatus(promiseId);
  }
}
