/// Author:    Nabraj Khadka
/// Created:   17.01.2022
/// Description:
/// (c) Copyright by Fantagious.com.
///*/


import 'dart:io';
import 'package:dio/dio.dart';

import '../../../models/network_response_model/home_data_model.dart';

/// custom dio client for our custom Interceptors, FormData, Request Cancellation, Timeout etc
class DioClient {

  DioClient()
      :  _dio = Dio(

    BaseOptions(
      baseUrl: 'https://shoppingnp.com',
      connectTimeout: 7000,
      receiveTimeout: 3000,
      responseType: ResponseType.json,
    ),
  );

  late final Dio _dio;

  Future<Banners?> getBanners() async {
    Banners ? banners;
    try {
      final bannerData = await _dio.get('www.shoppingnp.com/api/get-home-data');
      //'${APIPathHelper.baseUrl} + ${APIPathHelper.authAPIs(APIPath.getHome)}'
      print('home data info: ${bannerData.statusMessage}');
      return Banners.fromJson(bannerData.data);

    } on DioError catch (e) {
      print(e);
      if(e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
        throw e.toString();
      }else{
        print('Error sending request!');
        print(e.message);
      }
    }
    return banners;
  }

  // final String baseUrl;

  // late Dio _dio;
  // final List<Interceptor>? interceptors;
  // final Interceptor? interceptor;
  //
  // DioClient( {required this.baseUrl,
  //   required Dio dio,
  //       this.interceptor,
  //     })
  //     {
  //   _dio = dio;
  //   _dio
  //     ..options.baseUrl = baseUrl
  //     ..options.connectTimeout = 60000
  //     ..options.receiveTimeout = 60000
  //     ..httpClientAdapter


  //     // ..options.followRedirects = false
      // ..options.validateStatus = (status) {
      //   return status! < 500;
      // }
      // ..options.headers = {'Accept': 'application/json'}
      // ..options.headers = {
      //   "Authorization": "Bearer ${injector<SharedPreferences>().getString(
      //       StorageUtilConst.kAccessToken)}",
      // }
  //   ;
  //
  //
  //   // if (interceptors?.isNotEmpty ?? false) {
  //   //   _dio.interceptors.clear();
  //   //   _dio.interceptors.addAll(interceptors!);
  //   // }
  //
  //   if (interceptor != null) {
  //     _dio.interceptors.clear();
  //     _dio.interceptors.add(interceptor!);
  //   }
  //   if (kDebugMode) {
  //     _dio.interceptors.add(PrettyDioLogger(
  //         responseBody: true,
  //         requestHeader: false,
  //         responseHeader: false,
  //         requestBody: true));
  //   }
  //   // handle certificate verification check (for http request)
  //   (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
  //       (HttpClient client) {
  //     client.badCertificateCallback =
  //         (X509Certificate cert, String host, int port) => true;
  //     return client;
  //   };
  // }



  Future<dynamic> get(String uri, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await _dio.get(
        uri,
        queryParameters: queryParameters,
        options: options??Options(headers: {"requiresToken": false}),
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response.data;
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> authGet(String uri, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await _dio.get(
        uri,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response.data;
    } on SocketException catch (e) {

      throw SocketException(e.toString());
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }

  //normal post request - which does not required access to (unauthorized post req)
  Future<dynamic> post(String uri, {
    // ignore: type_annotate_public_apis
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await _dio.post(
        uri,
        data: data,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        options: options??Options(headers: {"requiresToken": false}),
        onReceiveProgress: onReceiveProgress,
      );
      return response.data;
    }
    on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> authMultiPartPost(String uri, {
    // ignore: type_annotate_public_apis
    data,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    Options? options,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await _dio.post(
        uri,
        data: data,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
        options: options,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );

      return response.data;
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> multiPartPost(String uri, {
    // ignore: type_annotate_public_apis
    data,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    Options? options,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await _dio.post(
        uri,
        data: data,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
        options: options??Options(headers: {"requiresToken": false}),
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response.data;
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }

  //authenticated post request - which does not required access to (unauthorized post req)
  Future<dynamic> authPost(String uri, {
    // ignore: type_annotate_public_apis
    data,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    Options? options,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await _dio.post(
        uri,
        data: data,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
        options: options,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response.data;
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> patch(String uri, {
    // ignore: type_annotate_public_apis
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await _dio.patch(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response.data;
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> delete(String uri, {
    // ignore: type_annotate_public_apis
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _dio.delete(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response.data;
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }
}
