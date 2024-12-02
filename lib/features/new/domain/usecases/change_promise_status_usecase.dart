import 'package:pravo_client/features/new/domain/repositories/payment_repository.dart';

class ChangePromiseStatusUseCase {
  final PaymentRepository repository;

  ChangePromiseStatusUseCase(this.repository);

  Future<void> execute(int promiseId) {
    return repository.changePromiseStatus(promiseId: promiseId);
  }
}
