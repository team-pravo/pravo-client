import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:pravo_client/features/auth/data/models/platform.dart';

final authProvider =
    ChangeNotifierProvider<AuthNotifier>((ref) => AuthNotifier(ref: ref));

class AuthNotifier extends ChangeNotifier {
  final Ref ref;
  final _secureStorage = const FlutterSecureStorage();
  bool _isCredentialsLoaded = false;
  String? _token;
  Platform? _platform;

  AuthNotifier({required this.ref}) {
    _loadCredentialsFromStorage(); // 초기화 시 토큰 확인
  }

  Platform? getPlatform() {
    return _platform;
  }

  /// 저장소에 저장된 정보 확인
  Future<void> _loadCredentialsFromStorage() async {
    _token = await _secureStorage.read(key: 'token');

    String? platform = await _secureStorage.read(key: 'platform');
    if (platform == Platform.apple.name) {
      _platform = Platform.apple;
    } else if (platform == Platform.kakao.name) {
      _platform = Platform.kakao;
    }

    _isCredentialsLoaded = true;
    notifyListeners();
  }

  Future<bool> isTokenValid() async {
    if (!_isCredentialsLoaded) {
      await _loadCredentialsFromStorage();
    }
    return _token != null;
  }

  /// 로그인
  Future<void> login(String newToken, Platform newPlatform) async {
    await _secureStorage.write(key: 'token', value: newToken);
    await _secureStorage.write(key: 'platform', value: newPlatform.name);
    _token = newToken;
    _platform = newPlatform;
    notifyListeners();
  }

  /// 로그아웃
  Future<void> logout() async {
    await _secureStorage.delete(key: 'token');
    await _secureStorage.delete(key: 'platform');
    _token = null;
    _platform = null;
    notifyListeners();
  }
}
