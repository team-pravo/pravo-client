import 'package:pravo_client/features/point-log/domain/entities/point_status.dart';

class PointLog {
  final String promiseName;
  final PointStatus pointStatus;
  final int pointAmount;
  final DateTime pointDate;

  PointLog({
    required this.promiseName,
    required this.pointStatus,
    required this.pointAmount,
    required this.pointDate,
  });
}
