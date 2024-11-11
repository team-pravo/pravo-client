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

  Future<List<Promise>> getUpcomingPromises(DateTime startDate) async {
    return Future.delayed(const Duration(milliseconds: 500), () {
      return [
        Promise(
          id: 1,
          name: '친구와 저녁식사',
          promiseDate: DateTime.now().add(const Duration(days: 5)),
          location: '서울 강남구',
          status: 'READY',
          organizerName: 'Alice',
          organizerProfileImageUrl:
              'https://avatars.githubusercontent.com/u/76519535?v=4',
        ),
        Promise(
          id: 2,
          name: '회사 회식',
          promiseDate: DateTime.now().add(const Duration(days: 10)),
          location: '서울 마포구',
          status: 'CONFIRMED',
          organizerName: 'Bob',
          organizerProfileImageUrl:
              'https://avatars.githubusercontent.com/u/90690578?v=4',
        ),
      ];
    });

    // FIXME: API 개발 완료되면 아래 코드로 대체할 것
    // final response = await dio.get(
    //   '/api/promises',
    //   queryParameters: {
    //     'startedAt': startDate.toIso8601String().split('T').first,
    //   },
    // );
    // return _mapResponseToPromises(response);
  }

  Future<List<Promise>> getPastPromises(DateTime endDate) async {
    return Future.delayed(const Duration(milliseconds: 500), () {
      return [
        Promise(
          id: 3,
          name: '가족 모임',
          promiseDate: DateTime.now().subtract(const Duration(days: 3)),
          location: '부산 해운대',
          status: 'COMPLETED',
          organizerName: 'Charlie',
          organizerProfileImageUrl:
              'https://avatars.githubusercontent.com/u/134353209?v=4',
        ),
        Promise(
          id: 4,
          name: '운동 모임',
          promiseDate: DateTime.now().subtract(const Duration(days: 7)),
          location: '서울 종로구',
          status: 'COMPLETED',
          organizerName: 'Dave',
          organizerProfileImageUrl:
              'https://avatars.githubusercontent.com/u/31067658?v=4',
        ),
      ];
    });

    // FIXME: API 개발 완료되면 아래 코드로 대체할 것
    // final response = await dio.get(
    //   '/api/promises',
    //   queryParameters: {
    //     'endedAt': endDate.toIso8601String().split('T').first,
    //   },
    // );
    // return _mapResponseToPromises(response);
  }

  List<Promise> _mapResponseToPromises(Response response) {
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
