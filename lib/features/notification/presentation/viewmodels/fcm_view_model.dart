import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pravo_client/features/notification/data/repositories/notification_repository_impl.dart';
import 'package:pravo_client/features/notification/domain/usecases/send_fcm_token_usecase.dart';

final fcmViewModelProvider = Provider<FcmViewModel>((ref) {
  return FcmViewModel(
    sendFcmTokenUseCase: SendFcmTokenUseCase(
      repository: ref.read(notificationRepositoryProvider),
    ),
  );
});

class FcmViewModel {
  final SendFcmTokenUseCase sendFcmTokenUseCase;

  FcmViewModel({required this.sendFcmTokenUseCase});

  Future<void> sendFcmToken(String token) async {
    await sendFcmTokenUseCase.execute(token);
  }
}
