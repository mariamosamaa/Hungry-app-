import 'package:dio/dio.dart';
import 'package:hangry/core/network/api_error.dart';

class ApiExceptions {
  static ApiError handleerror(DioException error) {
    print('🔴 DioException type: ${error.type}');
    print('🔴 DioException message: ${error.message}');
    print('🔴 Response data: ${error.response?.data}');

    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return ApiError(message: "Connection timeout, please check your internet");

      case DioExceptionType.receiveTimeout:
        return ApiError(message: "Server took too long to respond");

      case DioExceptionType.sendTimeout:
        return ApiError(message: "Sending data took too long");

      case DioExceptionType.connectionError:
        return ApiError(message: "Can't reach the server, check your connection or the server address");

      case DioExceptionType.badResponse:
        final data = error.response?.data;
        String message = "Something went wrong";
        if (data is Map<String, dynamic> && data['message'] != null) {
          message = data['message'];
        }
        return ApiError(message: message);

      case DioExceptionType.cancel:
        return ApiError(message: "Request was cancelled");

      default:
        return ApiError(message: "Something went wrong");
    }
  }
}