import 'package:pravo_client/features/notification/domain/repositories/notification_repository.dart';

class SendFcmTokenUseCase {
  final NotificationRepository repository;

  SendFcmTokenUseCase({required this.repository});

  Future<void> execute(String token) {
    return repository.sendFcmToken(token);
  }
}
