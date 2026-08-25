import 'package:dio/dio.dart';
import 'package:habitly/data/storage/token_storage.dart';

class AuthInterceptor extends Interceptor {
  final TokenStorage tokenStorage;
  final Dio dio;

  AuthInterceptor({required this.tokenStorage, required this.dio});

  final Dio _refreshDio = Dio(BaseOptions(baseUrl: 'https://dummyjson.com'));

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // TODO: implement onRequest
    try {
      final accessToken = await tokenStorage.readAccessToken();
      if (accessToken != null) {
        options.headers['Authorization'] = 'Bearer $accessToken';
      }
    } catch (e) {}

    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    // TODO: implement onErro

    if (err.response?.statusCode != 401) {
      handler.next(err);
    } else {
      final refreshToken = await tokenStorage.readRefreshToken();
      if (refreshToken == null) {
        handler.next(err);
      } else {
        try {
          final newResponse = await _refreshDio.post(
            '/auth/refresh',
            data: {'refreshToken': refreshToken},
          );

          tokenStorage.saveToken(
            accessToken: newResponse.data['accessToken'],
            refreshToken: newResponse.data['refreshToken'],
          );

          final retryResponse = await dio.fetch(err.requestOptions);
          handler.resolve(retryResponse);
        } catch (e) {
          handler.next(err);
        }
      }
    }
  }
}
