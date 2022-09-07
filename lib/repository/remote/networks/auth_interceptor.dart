// / Author: Bibek Baidya
// / Created:   1.08.2022
// / Description:
// / (c) Copyright by shoppingnp.com.
// /*/


import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../local_storage/storage_util.dart';
import 'api_endpoints.dart';

class AuthInterceptor extends QueuedInterceptor {
  final Dio dio; //for logged

  // final Dio tokenDio;
  final SecureStorageUtil secureStorage;

  AuthInterceptor({
    required this.dio,
    required this.secureStorage,
  });

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers['authorization'] =
    "Bearer ${await secureStorage.getAccessToken()}";
    return super.onRequest(options, handler);
  }

  //TODO: Retry for DIO interceptor
  @override
  Future<void> onError(DioError error, ErrorInterceptorHandler handler) async {
    if (error.response?.statusCode == 401) {
      //This retries the request if the token was updated later on
      final RequestOptions? options = error.response?.requestOptions;
      //check if retry count is 1 (retry count gives number of attempt for refresh token renewable
      if (options?.headers['Retry-Count'] == 1) {
        // showFlutterToast(AppColors.secondaryColor(1), 'Unauthorized Access! Please login');
        secureStorage.clearAllData();
        handler.next(error);
      }
      final tokenDio = Dio();
      //request for new refresh token
      return tokenDio.post(APIPathHelper.authAPIs(APIPath.refreshToken), data: {
        secureStorage.refreshToken: await secureStorage.getRefreshToken() ?? ""
      }).then((response) {
        secureStorage.setAccessToken(response.data[
        secureStorage.accessToken]); //overwriting existing expired token
        secureStorage.setRefreshToken(response.data[secureStorage
            .refreshToken]); //overwriting existing expired refresh token
        secureStorage.setAuthenticated();
      }).then((e) {
        options?.headers['Retry-Count'] =
        1; //setting retry count to 1 to prevent further concurrent calls
        dio.request(options!.path,
            options: Options(
              // method: error.requestOptions.method,
                headers: error.requestOptions.headers));
      }).catchError((e) {
        // showFlutterToast(AppColors.secondaryColor(1), 'Unauthorized Access! Please login');
        secureStorage.clearAllData();
        handler.next(e);
      });
    } else {
      handler.next(error);
    }
    return handler.next(error);
  }
}










//
// class AuthInterceptor extends QueuedInterceptor {
//   final Dio _dio;
//   final FlutterSecureStorage _localStorage;
//   bool isNormalRequest = false;
//   AuthNotifier authNotifier;
//
//   AuthInterceptor(this._dio,this._localStorage,this.authNotifier);
//
//   @override
//   void onRequest(
//       RequestOptions options, RequestInterceptorHandler handler) async {
//     if (options.headers["requiresToken"] == false) {
//       // if the request doesn't need token, then just continue to the next interceptor
//       options.headers.remove("requiresToken"); //remove the auxiliary header
//       isNormalRequest = true;
//       return handler.next(options);
//     } else {
//       isNormalRequest = false;
//       // get tokens from local_storage storage, Shared-preference / Hive or flutter_secure_storage
//       final accessToken = await _localStorage.read(key:LocalStorageConst.kAccessToken);
//       final refreshToken = await _localStorage.read(key:LocalStorageConst.kRefreshToken);
//       if (accessToken == null || refreshToken == null) {
//         _performLogout(_dio);
//         // create custom dio error
//         options.extra["tokenErrorType"] = TokenErrorType
//             .tokenNotFound; // I use enum type, you can change it to string
//         final error =
//             DioError(requestOptions: options, type: DioErrorType.other);
//         return handler.reject(error);
//       }
//       options.headers.addAll(
//         <String, String>{
//           'Accept': 'application/json',
//           'Authorization': 'Bearer $accessToken'
//         },
//       );
//       return handler.next(options);
//     }
//   }
//
//   @override
//   void onError(DioError err, ErrorInterceptorHandler handler) async {
//     if (!isNormalRequest) {
//       isNormalRequest = false;
//       if (
//           err.response?.statusCode == 401) {
//         var requestOptions = err.requestOptions;
//         var accessToken = await _refreshToken();
//         if (accessToken == null) {
//           //if still access token is null means
//           return handler.next(err);
//         } else {
//           final opts = Options(method: requestOptions.method);
//           _dio.options.headers["Authorization"] = "Bearer $accessToken";
//           _dio.options.headers["Accept"] = "application/json";
//           final Response? response = await _dio.request(requestOptions.path,
//               options: opts,
//               cancelToken: requestOptions.cancelToken,
//               onReceiveProgress: requestOptions.onReceiveProgress,
//               data: requestOptions.data,
//               queryParameters: requestOptions.queryParameters);
//           if (response != null) {
//             handler.resolve(response);
//           } else {
//             return handler.next(err);
//           }
//         }
//       }
//     } else {
//       return handler.next(err);
//     }
//   }
//
//   Future<String?> _refreshToken() async {
//     try {
//       var dioRefresh =
//           Dio(); // should create new dioRefresh instance because the request interceptor is being locked
//       if (kDebugMode) {
//         dioRefresh.interceptors.add(PrettyDioLogger(
//             responseBody: true,
//             requestHeader: true,
//             responseHeader: false,
//             requestBody: true));
//       }
//       // get refresh token from local_storage storage
//       final refreshToken = await _localStorage.read(key:LocalStorageConst.kRefreshToken);
//       // make request to server to get the new access token from server using refresh token
//       final response = await dioRefresh.post(
//         APIPathHelper.baseUrl + APIPathHelper.authAPIs(APIPath.refreshToken),
//         data: {"refresh_token": "$refreshToken"},
//         options: Options(
//           headers: <String, dynamic>{
//             'accept': 'application/json',
//           },
//         ),
//       );
//
//       if (response.statusCode == 200 || response.statusCode == 201) {
//         final newAccessToken = response
//             .data["access_token"]; // parse data based on your JSON structure
//         final newRefreshToken = response
//             .data["refresh_token"]; // parse data based on your JSON structure
//         await _localStorage.write(key:
//             LocalStorageConst.kAccessToken, value:newAccessToken);
//         await _localStorage.write(key:LocalStorageConst.kRefreshToken,
//             value:newRefreshToken); // save to local_storage storage
//         // save to local_storage storage
//         return _localStorage.read(key:LocalStorageConst.kAccessToken);
//       } else if (response.statusCode == 401) {
//         // it means your refresh token no longer valid now, it may be revoked by the backend
//         _performLogout(_dio);
//         return null;
//       }
//     } on DioError {
//       _performLogout(_dio);
//       return null;
//     }
//     return null;
//   }
//
//   void _performLogout(Dio dio) async {
//     CustomToast.showErrorToast(TokenErrorType.invalidAccessToken.description);
//     authNotifier.logout();
//     //TODO: Perform logout
//     // await _localStorage.delete(key:LocalStorageConst.kAccessToken);
//     // await   _localStorage.delete(key: LocalStorageConst.kRefreshToken); // remove token from local_storage storage
//
//     // back to login page without using context
//     // check this https://stackoverflow.com/a/53397266/9101876
//   }
// }
