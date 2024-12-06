import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pravo_client/features/core/dio/dio_provider.dart';
import 'package:pravo_client/features/settlement/data/models/settlement_request_model.dart';
import 'package:pravo_client/features/settlement/data/models/settlement_response_model.dart';
import 'package:pravo_client/features/settlement/domain/entites/attendee.dart';
import 'package:pravo_client/features/settlement/domain/entites/settlement.dart';
import 'package:pravo_client/features/settlement/domain/repositories/settlement_repository.dart';

class SettlementRepositoryImpl implements SettlementRepository {
  final Dio dio;

  SettlementRepositoryImpl(this.dio);

  @override
  Future<Settlement> confirmSettlement({
    required List<Attendee> attendees,
    required int promiseId,
  }) async {
    final requestBody = _toRequestModel(
      attendees: attendees,
      promiseId: promiseId,
    ).toJson();
    final response = await dio.post(
      '/api/promise/$promiseId/participants',
      data: requestBody,
    );
    final responseModel = SettlementResponseModel.fromJson(response.data);
    return _fromResponseModel(responseModel);
  }

  SettlementRequestModel _toRequestModel({
    required List<Attendee> attendees,
    required int promiseId,
  }) {
    return SettlementRequestModel(
      memberIds: attendees.map((p) => p.id).toList(),
      promiseId: promiseId,
    );
  }

  Settlement _fromResponseModel(SettlementResponseModel model) {
    return Settlement(
      id: model.id,
      name: model.name,
      deposit: model.deposit,
      earnedPoint: model.earnedPoint,
      attendanceCount: model.attendanceCount,
      absentCount: model.absentCount,
    );
  }
}

final settlementRepositoryProvider = Provider<SettlementRepository>((ref) {
  return SettlementRepositoryImpl(ref.read(dioProvider));
});
