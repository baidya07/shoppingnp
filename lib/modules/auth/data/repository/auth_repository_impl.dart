

import '../../../../repository/remote/auth_repository.dart';
import '../../../../repository/remote/networks/network_info.dart';
import '../datasource/local/auth_local_datasource.dart';


class AuthRepositoryImpl extends AuthRepository {
  final AuthLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  AuthRepositoryImpl({
    required this.localDataSource,
    required this.networkInfo,
  });

  //instead of just access token [save whole token object locally]

  @override
  Future<String?> lastRefreshToken() async {
    return localDataSource.getLastRefreshToken();
  }

  @override
  Future<bool> isAuthenticated() async {
    final _token = await localDataSource.getLastAccessToken();
    final _rfToken = await localDataSource.getLastRefreshToken();
    return _token != null && _rfToken != null;
  }

  @override
  Future<String?> lastAccessToken() async {
    return localDataSource
        .getLastAccessToken(); // fetch according to condition [and save it]
  }

  // @override
  // Future<ApiResult<String?>> logOutUser() async {
  //   if (await networkInfo.isConnected) {
  //     try {
  //       return const ApiResult.success(data: '');
  //       // final remoteData = await remoteDataSource.logOutUser();
  //       // localDataSource.clearTokenCache();
  //       // return ApiResult.success(data: remoteData['message']);
  //     } catch (e) {
  //       await localDataSource.clearTokenCache(); //clear local_storage cache anyway
  //       if (e is DioError && e.type == DioErrorType.response) {
  //         return ApiResult.failure(
  //             error:
  //             NetworkExceptions.defaultError(e.response?.data['message']));
  //       } else {
  //         return ApiResult.failure(error: NetworkExceptions.getDioException(e));
  //       }
  //     }
  //   } else {
  //     //Or fetch data locally
  //     return const ApiResult.failure(
  //         error: NetworkExceptions.noInternetConnection());
  //   }
  // }
  //

  @override
  Future<void> clearTokens() async {
    await localDataSource.clearTokenCache();
  }
}
