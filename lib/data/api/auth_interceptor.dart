import 'package:dio/dio.dart';
import 'package:habitly/data/storage/token_storage.dart';

class AuthInterceptor extends Interceptor {
  final TokenStorage tokenStorage;

  AuthInterceptor({required this.tokenStorage});

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
}
