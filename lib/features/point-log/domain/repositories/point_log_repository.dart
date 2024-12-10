import 'package:pravo_client/features/point-log/domain/entities/point_log.dart';

abstract class PointLogRepository {
  Future<List<PointLog>> getPointLogs();
}
