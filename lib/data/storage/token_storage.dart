import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenStorage {
  final storage = FlutterSecureStorage();

  Future<void> saveToken({
    required String accessToken,
    required String refreshToken,
  }) async {
    await storage.write(key: 'accessToken', value: accessToken);
    await storage.write(key: 'refreshToken', value: refreshToken);
  }

  Future<String?> readAccessToken() async {
    return await storage.read(key: 'accessToken') ;
  }

  Future<String?> readRefreshToken() async {
    return await storage.read(key: 'refreshToken');
  }

  Future<void> deleteAllToken() async {
    await storage.deleteAll();
  }
}
