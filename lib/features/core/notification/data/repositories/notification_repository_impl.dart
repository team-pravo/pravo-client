import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pravo_client/features/core/dio/dio_provider.dart';
import 'package:pravo_client/features/core/notification/domain/repositories/notification_repository.dart';

final notificationRepositoryProvider = Provider<NotificationRepository>((ref) {
  return NotificationRepositoryImpl(ref.read(dioProvider));
});

class NotificationRepositoryImpl extends NotificationRepository {
  Dio dio;

  NotificationRepositoryImpl(this.dio);

  @override
  Future<void> sendFcmToken(String token) async {
    await dio.post('/api/token', data: {'token': token});
  }
}
