import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../../../../core/data/utils/storage_const.dart';

abstract class AuthLocalDataSource {
  Future<String?> getLastAccessToken();

  Future<String?> getLastRefreshToken();

  Future<void> cacheToken({required String accessToken, required String refreshToken});

  Future<void> cacheLoginData(String data);

  Future<void> cacheUserNamePassword(String data);

  Future<void> clearTokenCache();
}

class AuthLocalDataSourceImpl extends AuthLocalDataSource {
  final FlutterSecureStorage secureStorage;

  AuthLocalDataSourceImpl({required this.secureStorage});

  @override
  Future<String?> getLastAccessToken() async {
    return await secureStorage.read(key: LocalStorageConst.kAccessToken);
  }

  @override
  Future<String?> getLastRefreshToken() async {
    return await secureStorage.read(key: LocalStorageConst.kRefreshToken);
  }

  @override
  Future<void> clearTokenCache() async {
    await secureStorage.delete(key: LocalStorageConst.kAccessToken);
    await secureStorage.delete(key: LocalStorageConst.kRefreshToken);
  }

  @override
  Future<void> cacheToken({required String accessToken, required String refreshToken}) async {
    await secureStorage.write(key: LocalStorageConst.kAccessToken, value: accessToken);
    await secureStorage.write(key: LocalStorageConst.kRefreshToken, value: refreshToken);
  }

  @override
  Future<void> cacheLoginData(String data) async {
    await secureStorage.write(key: LocalStorageConst.kLoginData, value: data);
  }

  @override
  Future<void> cacheUserNamePassword(String data) async {
    await secureStorage.write(
        key: LocalStorageConst.kRefreshToken, value: data);
  }
}
