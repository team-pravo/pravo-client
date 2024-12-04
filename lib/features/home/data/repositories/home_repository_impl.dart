import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pravo_client/features/core/dio/dio_provider.dart';
import 'package:pravo_client/features/home/data/models/home_model.dart';
import 'package:pravo_client/features/home/domain/entities/home.dart';
import 'package:pravo_client/features/home/domain/repositories/home_repository.dart';

final homeRepositoryProvider = Provider<HomeRepository>((ref) {
  return HomeRepositoryImpl(ref.read(dioProvider));
});

class HomeRepositoryImpl extends HomeRepository {
  final Dio dio;

  HomeRepositoryImpl(this.dio);

  @override
  Future<Home> getHome() async {
    final response = await dio.get('/api/home');
    final model = HomeModel.fromJson(response.data);

    return Home(
      todayPromises: model.todayPromises
          .map(
            (m) => TodayPromise(
              id: m.id,
              name: m.name,
              scheduledAt: DateTime.parse(m.scheduledAt),
              location: m.location,
              status: m.status,
              organizerName: m.organizerName,
              organizerProfileImageUrl: m.organizerProfileImageUrl,
            ),
          )
          .toList(),
      point: model.point,
      upcomingPromises: model.upcomingPromises
          .map(
            (m) => UpcomingPromise(
              scheduledAt: DateTime.parse(m.scheduledAt),
              name: m.name,
            ),
          )
          .toList(),
    );
  }
}
