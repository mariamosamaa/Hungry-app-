import 'package:dio/dio.dart';
import 'package:hangry/core/network/api_error.dart';
import 'package:hangry/core/network/api_exceptions.dart';
import 'package:hangry/core/network/api_service.dart';
import 'package:hangry/core/utils/pref_helper.dart';
import 'package:hangry/feature/auth/data/user_Model.dart';

class authrepo {
  ApiService apiService = ApiService();
  bool isGuest = false;
  // ignore: unused_field
  UserModel? _currentUser;

  // login
  Future<UserModel?> login(String email, String password) async {
    try {
      final response = await apiService.post('/login', {
        'email': email,
        'password': password,
      });

      if (response is ApiError) {
        throw response;
      }

      if (response is Map<String, dynamic>) {
        final code = response['code'];
        final msg = response['message'];
        final data = response['data'];

        if (code != 200 && code != 201) {
          throw ApiError(message: msg ?? 'Unknown error');
        }

        final userJson = data['user'];
        final token = data['token'];

        final user = UserModel.fromJson(userJson, token: token);

        if (user.token != null) {
          await PrefHelper.savetoken(user.token!);
        }

        isGuest = false;
        _currentUser = user;
        return user;
      } else {
        throw ApiError(message: 'UnExpected Error From Server');
      }
    } on DioException catch (e) {
      throw ApiExceptions.handleerror(e);
    } on ApiError {
      rethrow;
    } catch (e) {
      throw ApiError(message: e.toString());
    }
  }

  // register
  // ✅ الباك إند (routes/auth.js) بيطلب name + email + phone + password الأربعة سوا
  // فلازم الميثود هنا تستقبل الـ phone وتبعته في جسم الـ request
  Future<UserModel?> signup(
    String name,
    String email,
    String phone,
    String password,
  ) async {
    try {
      final response = await apiService.post('/register', {
        'name': name,
        'email': email,
        'phone': phone,
        'password': password,
      });

      if (response is ApiError) {
        throw response;
      }

      if (response is Map<String, dynamic>) {
        final code = response['code'];
        final msg = response['message'];
        final data = response['data'];

        if (code != 200 && code != 201) {
          throw ApiError(message: msg ?? 'Unknown error');
        }

        final userJson = data['user'];
        final token = data['token'];

        final user = UserModel.fromJson(userJson, token: token);

        if (user.token != null) {
          await PrefHelper.savetoken(user.token!);
        }

        isGuest = false;
        _currentUser = user;
        return user;
      } else {
        throw ApiError(message: 'UnExpected Error From Server');
      }
    } on DioException catch (e) {
      throw ApiExceptions.handleerror(e);
    } on ApiError {
      rethrow;
    } catch (e) {
      throw ApiError(message: e.toString());
    }
  }

  //Get profile data
  // Get profile data
Future<UserModel?> getprofdata() async {
  try {
    final response = await apiService.get('/profile');
    return UserModel.fromJson(response['data']);
  } on DioException catch (e) {
    ApiExceptions.handleerror(e);
    rethrow;
  } catch (e) {
    throw ApiError(message: e.toString());
  }
}
  // update

  //logout profile date
}
