import 'package:pravo_client/features/promise/domain/entities/promise.dart';

abstract class PromiseRepository {
  Future<Promise> getPromise(int id);
  Future<void> deletePromise(int id);
  Future<void> cancelPromise(int id);
}
