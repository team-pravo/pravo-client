import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:pravo_client/features/auth/data/models/platform.dart';

final authProvider =
    ChangeNotifierProvider<AuthNotifier>((ref) => AuthNotifier(ref: ref));

class AuthNotifier extends ChangeNotifier {
  final Ref ref;
  final _secureStorage = const FlutterSecureStorage();
  bool _isTokenRead = false;
  String? _token;
  Platform? _platform;

  bool get isTokenRead => _isTokenRead;

  AuthNotifier({required this.ref}) {
    _readTokenFromStorage(); // 초기화 시 토큰 확인
  }

  // 저장소에 저장된 토큰 확인
  Future<void> _readTokenFromStorage() async {
    _token = await _secureStorage.read(key: 'token');
    _isTokenRead = true;
    notifyListeners();
  }

  Future<bool> isTokenValid() async {
    if (!_isTokenRead) {
      await _readTokenFromStorage();
    }
    return _token != null;
  }

  // 토큰 저장 로직
  Future<void> login(String newToken, Platform newPlatform) async {
    await _secureStorage.write(key: 'token', value: newToken);
    _token = newToken;
    _platform = newPlatform;
    notifyListeners();
  }

  // 토큰 삭제 로직
  Future<void> logout() async {
    await _secureStorage.delete(key: 'token');
    _token = null;
    _platform = null;
    notifyListeners();
  }
}
