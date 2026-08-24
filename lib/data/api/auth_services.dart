import 'package:dio/dio.dart';
import 'package:habitly/data/storage/token_storage.dart';

class AuthServices {
  Dio dio = Dio();
  TokenStorage tokenStorage = TokenStorage();

  Future<void> login({
    required String username,
    required String password,
  }) async {
    final response = await dio.post(
      'https://dummyjson.com/auth/login',
      data: {'username': username, 'password': password},
    );

    tokenStorage.saveToken(
      accessToken: response.data['accessToken'],
      refreshToken: response.data['refreshToken'],
    );
  }
}
