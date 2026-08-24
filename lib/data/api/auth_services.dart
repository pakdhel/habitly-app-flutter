import 'package:dio/dio.dart';
import 'package:habitly/data/storage/token_storage.dart';

class AuthServices {
  final Dio dio;
  final TokenStorage tokenStorage;
  AuthServices({required this.dio, required this.tokenStorage});

  Future<void> login({
    required String username,
    required String password,
  }) async {
    final response = await dio.post(
      '/auth/login',
      data: {'username': username, 'password': password},
    );

    tokenStorage.saveToken(
      accessToken: response.data['accessToken'],
      refreshToken: response.data['refreshToken'],
    );
  }

  Future<void> getMe() async {
    final response = await dio.get('/auth/me');
    print(response.data);
  }
}
