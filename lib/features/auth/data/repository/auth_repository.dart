import 'package:dio/dio.dart' hide Headers;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pravo_client/features/auth/data/models/platform.dart';
import 'package:pravo_client/features/auth/data/models/token_response_model.dart';
import 'package:pravo_client/features/auth/presentation/viewmodels/oauth_provider.dart';
import 'package:pravo_client/features/core/dio/dio_provider.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository(ref.read(dioProvider), ref.read(oauthProvider));
});

class AuthRepository {
  final Dio dio;
  final OAuthNotifier oAuthNotifier;

  AuthRepository(this.dio, this.oAuthNotifier);

  Future<LoginResponseModel> login(
    String oauthToken,
    Platform oauthPlatform,
  ) async {
    final request = {
      'socialToken': oauthToken,
    };

    final response = await dio.post(
      '/api/login/${oauthPlatform.name}',
      data: request,
    );

    return LoginResponseModel.fromJson(response.data);
  }
}
