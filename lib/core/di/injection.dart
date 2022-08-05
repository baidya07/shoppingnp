import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../modules/auth/di/injection.dart';
import '../data/remote/auth_interceptor.dart';
import '../data/remote/dio_client.dart';
import '../data/remote/network_info.dart';
import '../data/utils/api_endpoints.dart';

// final initializationProvider = FutureProvider<void>((ref) async {

  String get  baseUrl => APIPathHelper.baseUrl;
  final dioProvider = Provider((ref) => Dio());
  final sharedPrefsProvider = Provider((ref) => const FlutterSecureStorage());
  final connectionChecker = Provider((ref) => InternetConnectionChecker());
  final networkInfoProvider = Provider<NetworkInfo>((ref) => NetworkInfoImpl(dataConnectionChecker: ref.watch(connectionChecker)));
  final authInterceptorProvider =
  Provider((ref) => AuthInterceptor(ref.watch(dioProvider),ref.watch(sharedPrefsProvider),ref.watch(authProvider)));
  final dioClientProvider = Provider((ref) => DioClient(
      baseUrl: baseUrl,
      dio: ref.watch(dioProvider),
      interceptor: ref.watch(authInterceptorProvider)));
// });