import 'package:pravo_client/features/promises/domain/entities/promise.dart';

abstract class PromisesRepository {
  Future<List<Promise>> getUpcomingPromises(DateTime startDate);
  Future<List<Promise>> getPastPromises(DateTime endDate);
}
