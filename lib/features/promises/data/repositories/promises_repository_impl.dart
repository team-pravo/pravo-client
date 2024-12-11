import 'package:dio/dio.dart' hide Headers;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pravo_client/features/core/dio/dio_provider.dart';
import 'package:pravo_client/features/promises/data/models/promise_model.dart';
import 'package:pravo_client/features/promises/domain/entities/promise.dart';
import 'package:pravo_client/features/promises/domain/repositories/promises_repository.dart';

final promisesRepositoryProvider = Provider<PromisesRepository>((ref) {
  return PromisesRepositoryImpl(ref.read(dioProvider));
});

class PromisesRepositoryImpl implements PromisesRepository {
  final Dio dio;

  PromisesRepositoryImpl(this.dio);

  @override
  Future<List<Promise>> getUpcomingPromises(DateTime startDate) async {
    final response = await dio.get(
      '/api/promise',
      queryParameters: {
        'startedAt': startDate.toIso8601String().split('T').first,
      },
    );
    final currentTime = DateTime.now();
    return _mapResponseToPromises(response)
        .where((promise) => promise.scheduledAt.isAfter(currentTime))
        .toList();
  }

  @override
  Future<List<Promise>> getPastPromises(DateTime endDate) async {
    final response = await dio.get(
      '/api/promise',
      queryParameters: {
        'endedAt': endDate.toIso8601String().split('T').first,
      },
    );
    final currentTime = DateTime.now();
    return _mapResponseToPromises(response)
        .where((promise) => promise.scheduledAt.isBefore(currentTime))
        .toList();
  }

  List<Promise> _mapResponseToPromises(Response response) {
    return (response.data as List)
        .map((promise) => PromiseModel.fromJson(promise))
        .map(
          (model) => Promise(
            id: model.id,
            name: model.name,
            scheduledAt: model.scheduledAt,
            location: model.location,
            status: model.status,
            organizerName: model.organizerName,
            organizerProfileImageUrl: model.organizerProfileImageUrl,
          ),
        )
        .toList();
  }
}
