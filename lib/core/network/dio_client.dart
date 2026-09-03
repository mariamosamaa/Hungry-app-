import 'package:dio/dio.dart';
import 'package:hangry/core/utils/pref_helper.dart';

class DioClient {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'http://192.168.1.21:8000/api',
      contentType: 'application/json',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      sendTimeout: const Duration(seconds: 10),
    ),
  );
  DioClient() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await PrefHelper.gettoken();
          if (token != null && token.isNotEmpty) {
            options.headers["Authorization"] = 'Bearer $token';
          }
          return handler.next(options);
        },
      ),
    );
  }
  Dio get dio => _dio;
}
