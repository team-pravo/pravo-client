import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final authProvider =
    ChangeNotifierProvider<AuthNotifier>((ref) => AuthNotifier(ref: ref));

class AuthNotifier extends ChangeNotifier {
  final Ref ref;
  final _secureStorage = const FlutterSecureStorage();
  bool _isTokenChecked = false;
  String? _token;

  bool get isTokenChecked => _isTokenChecked;

  AuthNotifier({required this.ref}) {
    _checkToken(); // 초기화 시 토큰 확인
  }

  // 저장소에 저장된 토큰 확인
  Future<void> _checkToken() async {
    _token = await _secureStorage.read(key: 'token');
    _isTokenChecked = true;
    notifyListeners();
  }

  Future<bool> isTokenValid() async {
    if (!_isTokenChecked) {
      await _checkToken();
    }
    return _token != null;
  }

  // 토큰 저장 로직
  Future<void> login(String newToken) async {
    await _secureStorage.write(key: 'token', value: newToken);
    _token = newToken;
    notifyListeners();
  }

  // 토큰 삭제 로직
  Future<void> logout() async {
    await _secureStorage.delete(key: 'token');
    _token = null;
    notifyListeners();
  }
}
