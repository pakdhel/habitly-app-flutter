import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habitly/data/api/auth_services.dart';
import 'package:habitly/data/api/dio_client.dart';
import 'package:habitly/data/api/habit_services.dart';
import 'package:habitly/data/storage/token_storage.dart';

final tokenStorageProvider = Provider<TokenStorage>((ref) {
  return TokenStorage();
});

final dioClientProvider = Provider<DioClient>((ref) {
  final tokenStorage = ref.read(tokenStorageProvider);
  return DioClient(tokenStorage: tokenStorage);
});

final authServicesProvider = Provider<AuthServices>((ref) {
  final dioClient = ref.read(dioClientProvider);
  final tokenStorage = ref.read(tokenStorageProvider);
  return AuthServices(dio: dioClient.dio, tokenStorage: tokenStorage);
});

final habitServicesProvider = Provider<HabitServices>((ref) {
  final dioClient = ref.read(dioClientProvider);
  return HabitServices(dio: dioClient.dio);
});
