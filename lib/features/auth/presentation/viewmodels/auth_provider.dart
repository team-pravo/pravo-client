import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:pravo_client/features/auth/data/models/platform.dart';
import 'package:pravo_client/features/auth/data/models/token_response_model.dart';
import 'package:pravo_client/features/auth/data/repository/auth_repository.dart';

final authProvider =
    ChangeNotifierProvider<AuthNotifier>((ref) => AuthNotifier(ref: ref));

class AuthNotifier extends ChangeNotifier {
  final Ref ref;
  final _secureStorage = const FlutterSecureStorage();
  final AuthRepository authRepository;

  AuthNotifier({required this.ref})
      : authRepository = ref.read(authRepositoryProvider);

  Future<bool> isTokenValid() async {
    final token = await _secureStorage.read(key: 'access_token');
    return token != null;
  }

  Future<void> login(
    String oauthToken,
    Platform oauthPlatform,
  ) async {
    LoginResponseModel response =
        await authRepository.login(oauthToken, oauthPlatform);
    final accessToken = response.jwtTokens.accessToken;
    final memberId = response.memberId;
    await _secureStorage.write(key: 'access_token', value: accessToken);
    await _secureStorage.write(key: 'member_id', value: memberId.toString());
    notifyListeners();
  }

  Future<void> logout() async {
    await _secureStorage.delete(key: 'access_token');
    await _secureStorage.delete(key: 'member_id');
    notifyListeners();
  }
}
