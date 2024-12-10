import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pravo_client/features/core/dio/dio_provider.dart';
import 'package:pravo_client/features/point-log/data/models/point_log_model.dart';
import 'package:pravo_client/features/point-log/domain/entities/point_log.dart';
import 'package:pravo_client/features/point-log/domain/entities/point_status.dart';
import 'package:pravo_client/features/point-log/domain/repositories/point_log_repository.dart';

final pointLogRepositoryProvider = Provider<PointLogRepository>((ref) {
  return PointLogRepositoryImpl(dio: ref.read(dioProvider));
});

class PointLogRepositoryImpl extends PointLogRepository {
  final Dio dio;

  PointLogRepositoryImpl({required this.dio});

  @override
  Future<List<PointLog>> getPointLogs() async {
    final response = await dio.get('/api/member/point-log');

    List<dynamic> data = response.data;
    return data
        .map((item) => PointLogModel.fromJson(item))
        .map((model) => _mapModelToEntity(model))
        .toList();
  }

  PointLog _mapModelToEntity(PointLogModel model) {
    return PointLog(
      promiseName: model.promiseName,
      pointAmount: model.pointAmount,
      pointStatus: PointStatus.values.firstWhere(
        (e) => e.name == model.pointLogStatus,
      ),
      pointDate: model.pointDate,
    );
  }
}
