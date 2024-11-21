import 'package:dio/dio.dart' hide Headers;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pravo_client/features/core/dio/dio_provider.dart';
import 'package:pravo_client/features/promise/data/models/promise_model.dart';
import 'package:pravo_client/features/promise/domain/entities/participant_status.dart';
import 'package:pravo_client/features/promise/domain/entities/promise.dart';
import 'package:pravo_client/features/promise/domain/entities/participant.dart';
import 'package:pravo_client/features/promise/domain/repositories/promise_repository.dart';

final promiseRepositoryProvider = Provider<PromiseRepository>((ref) {
  return PromiseRepositoryImpl(ref.read(dioProvider));
});

class PromiseRepositoryImpl implements PromiseRepository {
  final Dio dio;

  PromiseRepositoryImpl(this.dio);

  @override
  Future<Promise> getPromise(int id) async {
    final response = await dio.get(
      '/api/promise/$id',
    );
    final promiseModel = PromiseModel.fromJson(response.data);

    return Promise(
      id: promiseModel.id,
      name: promiseModel.name,
      promiseDate: promiseModel.promiseDate,
      location: promiseModel.location,
      status: promiseModel.status,
      deposit: promiseModel.deposit,
      participants: promiseModel.participants
          .map(
            (participantModel) => Participant(
              id: participantModel.id,
              name: participantModel.name,
              profileImageUrl: participantModel.profileImageUrl,
              status: ParticipantStatus.values.firstWhere(
                (status) => status.name == participantModel.status,
                orElse: () => throw Exception(
                  'Invalid participant status: ${participantModel.status}',
                ),
              ),
              role: participantModel.role,
            ),
          )
          .toList(),
    );
  }

  @override
  Future<void> deletePromise(int id) async {
    await dio.delete(
      '/api/promise/$id',
    );
  }
}
