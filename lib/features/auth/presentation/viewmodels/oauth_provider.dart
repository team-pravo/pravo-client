import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:pravo_client/features/auth/data/models/platform.dart';

final oauthProvider =
    ChangeNotifierProvider<OAuthNotifier>((ref) => OAuthNotifier(ref: ref));

class OAuthNotifier extends ChangeNotifier {
  final Ref ref;
  final _secureStorage = const FlutterSecureStorage();
  Platform? _platform;

  OAuthNotifier({required this.ref});

  Platform? getPlatform() {
    return _platform;
  }

  /// 로그인
  Future<void> login(String newToken, Platform newPlatform) async {
    await _secureStorage.write(key: 'oauth_token', value: newToken);
    await _secureStorage.write(key: 'oauth_platform', value: newPlatform.name);
    _platform = newPlatform;
    notifyListeners();
  }

  /// 로그아웃
  Future<void> logout() async {
    await _secureStorage.delete(key: 'oauth_token');
    await _secureStorage.delete(key: 'oauth_platform');
    _platform = null;
    notifyListeners();
  }
}
