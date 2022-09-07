import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shoppingnp/models/response_model.dart';
import 'package:shoppingnp/repository/remote/networks/api_endpoints.dart';
import 'package:shoppingnp/repository/remote/networks/auth_interceptor.dart';
import 'package:shoppingnp/repository/remote/networks/dio_client.dart';

import '../../../local_storage/storage_util.dart';
import '../../../views/widget/dialogs.dart';
import '../../../views/widget/toast.dart';
import 'network_error_helper.dart';



class ApiProviderRepository{
  late DioClient authDioClient;
  late DioClient dioClient;
  final _baseUrl = APIPathHelper.baseUrl;
  final _authDio = Dio();
  final _dio = Dio();
  final secureStorage = SecureStorageUtil();

  ApiProviderRepository(){
    //this instance will be used to try dio request which does not require authentication
    dioClient = DioClient(_baseUrl, _dio, secureStorage);

    //this instance will be used to try authenticated dio request
    authDioClient = DioClient(_baseUrl, _authDio, secureStorage, interceptors: [
      AuthInterceptor(
          dio: _authDio,
          secureStorage: secureStorage),
    ]);
  }

  //authenticated get request
  Future<dynamic> getRequestAuth(String apiPath, {Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await authDioClient.authGet(apiPath, queryParameters: queryParameters);
      return ApiResponse(data: response, error: null);
    }catch (e){
      displayErrorToast(NetworkErrorHelper.getErrorMessage(e));
      rethrow;
      }
    }

  // normal (unauthenticated) get request
  Future<dynamic> getRequest(String apiPath, {Map<String, dynamic>? queryParameters}) async {
    try{
      final response = await dioClient.get(apiPath, queryParameters: queryParameters);
      return ApiResponse(error: null, data: response);
    //  return ApiResponse.success(response);
    }catch (e){
      rethrow;
    }
  }

  //authenticated post request
  Future<dynamic> deleteRequestAuth(String apiPath, BuildContext context, {Map<String, dynamic>? queryParameters}) async{
    try{
      showDialog(context);
      final response = await authDioClient.delete(apiPath);
      hideDialog(context);
      return ApiResponse(error: null, data: response);
    } catch (e) {
      if(context!=null) hideDialog(context);
      rethrow;
    }
  }



  //shows loading dialogs during post request
  void showDialog(BuildContext context) {
    showLoadingDialog(context);
  }

  //hides loading dialogs during post request
  void hideDialog(BuildContext context) {
    hideLoadingDialog(context);
  }

  //show network error toast
  void displayErrorToast(String errorMessage) {
    showErrorToast(errorMessage);
  }

  //show network success toast
  void displaySuccessToast(String errorMessage) {
    showSuccessToast(errorMessage);
  }
  }