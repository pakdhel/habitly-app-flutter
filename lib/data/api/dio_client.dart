import 'package:dio/dio.dart';
import 'package:habitly/data/api/auth_interceptor.dart';
import 'package:habitly/data/storage/token_storage.dart';

class DioClient {
  final TokenStorage tokenStorage;
  late Dio dio;

  DioClient({required this.tokenStorage}) {
    dio = Dio(BaseOptions(baseUrl: 'https://dummyjson.com'));

    final authInterceptor = AuthInterceptor(
      tokenStorage: tokenStorage,
      dio: dio,
    );

    dio.interceptors.add(authInterceptor);
  }
}
