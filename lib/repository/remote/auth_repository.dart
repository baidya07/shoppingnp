import 'networks/api_result.dart';

abstract class AuthRepository{
  // String? fetchToken() {
  //   return localDataSource.getLastToken();
  // }
  Future<String?> lastRefreshToken();
  Future<String?> lastAccessToken();
  Future<bool> isAuthenticated();
  // Future<ApiResult<String?>> logOutUser();
  Future<void> clearTokens();
}