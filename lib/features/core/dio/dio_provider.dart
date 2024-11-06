import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:pravo_client/features/auth/presentation/viewmodels/auth_provider.dart';

final dioProvider = Provider<Dio>((ref) {
  final dio = Dio();
  const storage = FlutterSecureStorage();
  final authNotifier = ref.read(authProvider);
  dio.interceptors.add(
    CustomInterceptor(
      storage: storage,
      ref: ref,
      authNotifier: authNotifier,
    ),
  );
  dio.options = BaseOptions(
    sendTimeout: const Duration(seconds: 5),
  );
  return dio;
});

class CustomInterceptor extends Interceptor {
  final FlutterSecureStorage storage;
  final Ref ref;
  final AuthNotifier authNotifier;

  CustomInterceptor({
    required this.storage,
    required this.ref,
    required this.authNotifier,
  });

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await authNotifier.getAccessToken();
    options.headers.addAll({
      'Authorization': 'Bearer $token',
    });
    return super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    return handler.reject(err);
  }
}
