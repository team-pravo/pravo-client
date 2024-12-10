import 'package:pravo_client/features/join/domain/entities/join_promise.dart';
import 'package:pravo_client/features/promise/domain/entities/promise.dart';

class ConvertPromiseToJoinPromiseUseCase {
  JoinPromise execute(Promise promise) {
    return JoinPromise(
      id: promise.id,
      name: promise.name,
      deposit: promise.deposit,
    );
  }
}
