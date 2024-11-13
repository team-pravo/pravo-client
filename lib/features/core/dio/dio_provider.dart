import 'package:dio/dio.dart';
import 'dart:developer';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pravo_client/features/core/data/models/api_response_model.dart';

final dioProvider = Provider<Dio>((ref) {
  final dio = Dio();
  const storage = FlutterSecureStorage();
  dio.interceptors.add(
    CustomInterceptor(
      storage: storage,
      ref: ref,
    ),
  );
  dio.options = BaseOptions(
    baseUrl: dotenv.env['PRAVO_BASE_URL']!,
    sendTimeout: const Duration(seconds: 5),
  );
  return dio;
});

class CustomInterceptor extends Interceptor {
  final FlutterSecureStorage storage;
  final Ref ref;

  CustomInterceptor({
    required this.storage,
    required this.ref,
  });

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await storage.read(key: 'access_token');
    options.headers.addAll({
      'Authorization': 'Bearer $token',
    });

    log('${options.method} ${options.uri}');
    log('${options.headers}');
    log('${options.data}');
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) {
    log('${response.statusCode} - ${response.data}');

    final body = ApiResponseModel.fromJson(response.data);
    response.data = body.data; // 공통 Response에서 data 부분만 추출하여 가져옴

    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    log('${err.message} - ${err.response?.data}');
    return handler.reject(err);
  }
}
