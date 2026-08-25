import 'package:dio/dio.dart';
import 'package:habitly/data/models/user.dart';
import 'package:habitly/data/storage/token_storage.dart';

class AuthServices {
  final Dio dio;
  final TokenStorage tokenStorage;
  AuthServices({required this.dio, required this.tokenStorage});

  Future<User> login({
    required String username,
    required String password,
  }) async {
    final response = await dio.post(
      '/auth/login',
      data: {'username': username, 'password': password},
    );

    await tokenStorage.saveToken(
      accessToken: response.data['accessToken'],
      refreshToken: response.data['refreshToken'],
    );

    try {
      return User.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to login');
    }
  }

  Future<User> getMe() async {
    final response = await dio.get('/auth/me');
    try {
      return User.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to load user');
    }    
  }
}
