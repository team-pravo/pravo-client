import 'package:dio/dio.dart' hide Headers;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pravo_client/features/core/dio/dio_provider.dart';
import 'package:pravo_client/features/promises/data/models/promise_model.dart';
import 'package:pravo_client/features/promises/domain/entity/promise.dart';

final promisesRepositoryProvider = Provider<PromisesRepository>((ref) {
  return PromisesRepository(ref.read(dioProvider));
});

class PromisesRepository {
  final Dio dio;

  PromisesRepository(this.dio);

  Future<List<Promise>> getPromises() async {
    final response = await dio.get('/api/promises');
    return (response.data as List)
        .map((promise) => PromiseModel.fromJson(promise))
        .map(
          (model) => Promise(
            id: model.id,
            name: model.name,
            promiseDate: model.promiseDate,
            location: model.location,
            status: model.status,
            organizerName: model.organizerName,
            organizerProfileImageUrl: model.organizerProfileImageUrl,
          ),
        )
        .toList();
  }
}
