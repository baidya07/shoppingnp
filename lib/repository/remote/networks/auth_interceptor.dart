// / Author: Bibek Baidya
// / Created:   1.08.2022
// / Description:
// / (c) Copyright by shoppingnp.com.
// /*/

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shoppingnp/repository/remote/networks/storage_const.dart';
import 'package:shoppingnp/repository/remote/networks/token_error_helper.dart';
import '../../../views/widget/toast.dart';
import 'api_endpoints.dart';
import '../../../modules/auth/presentation/provider/auth_notifier.dart';


class AuthInterceptor extends QueuedInterceptor {
  final Dio _dio;
  final FlutterSecureStorage _localStorage;
  bool isNormalRequest = false;
  AuthNotifier authNotifier;

  AuthInterceptor(this._dio,this._localStorage,this.authNotifier);

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (options.headers["requiresToken"] == false) {
      // if the request doesn't need token, then just continue to the next interceptor
      options.headers.remove("requiresToken"); //remove the auxiliary header
      isNormalRequest = true;
      return handler.next(options);
    } else {
      isNormalRequest = false;
      // get tokens from local_storage storage, Shared-preference / Hive or flutter_secure_storage
      final accessToken = await _localStorage.read(key:LocalStorageConst.kAccessToken);
      final refreshToken = await _localStorage.read(key:LocalStorageConst.kRefreshToken);
      if (accessToken == null || refreshToken == null) {
        _performLogout(_dio);
        // create custom dio error
        options.extra["tokenErrorType"] = TokenErrorType
            .tokenNotFound; // I use enum type, you can change it to string
        final error =
            DioError(requestOptions: options, type: DioErrorType.other);
        return handler.reject(error);
      }
      options.headers.addAll(
        <String, String>{
          'Accept': 'application/json',
          'Authorization': 'Bearer $accessToken'
        },
      );
      return handler.next(options);
    }
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    if (!isNormalRequest) {
      isNormalRequest = false;
      if (
          err.response?.statusCode == 401) {
        var requestOptions = err.requestOptions;
        var accessToken = await _refreshToken();
        if (accessToken == null) {
          //if still access token is null means
          return handler.next(err);
        } else {
          final opts = Options(method: requestOptions.method);
          _dio.options.headers["Authorization"] = "Bearer $accessToken";
          _dio.options.headers["Accept"] = "application/json";
          final Response? response = await _dio.request(requestOptions.path,
              options: opts,
              cancelToken: requestOptions.cancelToken,
              onReceiveProgress: requestOptions.onReceiveProgress,
              data: requestOptions.data,
              queryParameters: requestOptions.queryParameters);
          if (response != null) {
            handler.resolve(response);
          } else {
            return handler.next(err);
          }
        }
      }
    } else {
      return handler.next(err);
    }
  }

  Future<String?> _refreshToken() async {
    try {
      var dioRefresh =
          Dio(); // should create new dioRefresh instance because the request interceptor is being locked
      if (kDebugMode) {
        dioRefresh.interceptors.add(PrettyDioLogger(
            responseBody: true,
            requestHeader: true,
            responseHeader: false,
            requestBody: true));
      }
      // get refresh token from local_storage storage
      final refreshToken = await _localStorage.read(key:LocalStorageConst.kRefreshToken);
      // make request to server to get the new access token from server using refresh token
      final response = await dioRefresh.post(
        APIPathHelper.baseUrl + APIPathHelper.authAPIs(APIPath.refreshToken),
        data: {"refresh_token": "$refreshToken"},
        options: Options(
          headers: <String, dynamic>{
            'accept': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final newAccessToken = response
            .data["access_token"]; // parse data based on your JSON structure
        final newRefreshToken = response
            .data["refresh_token"]; // parse data based on your JSON structure
        await _localStorage.write(key:
            LocalStorageConst.kAccessToken, value:newAccessToken);
        await _localStorage.write(key:LocalStorageConst.kRefreshToken,
            value:newRefreshToken); // save to local_storage storage
        // save to local_storage storage
        return _localStorage.read(key:LocalStorageConst.kAccessToken);
      } else if (response.statusCode == 401) {
        // it means your refresh token no longer valid now, it may be revoked by the backend
        _performLogout(_dio);
        return null;
      }
    } on DioError {
      _performLogout(_dio);
      return null;
    }
    return null;
  }

  void _performLogout(Dio dio) async {
    CustomToast.showErrorToast(TokenErrorType.invalidAccessToken.description);
    authNotifier.logout();
    //TODO: Perform logout
    // await _localStorage.delete(key:LocalStorageConst.kAccessToken);
    // await   _localStorage.delete(key: LocalStorageConst.kRefreshToken); // remove token from local_storage storage

    // back to login page without using context
    // check this https://stackoverflow.com/a/53397266/9101876
  }
}
