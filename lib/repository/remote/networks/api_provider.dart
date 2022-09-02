import 'package:dio/dio.dart';
import 'package:shoppingnp/repository/remote/networks/api_endpoints.dart';
import 'package:shoppingnp/repository/remote/networks/dio_client.dart';

import '../../../local_storage/secure_storage.dart';

class ApiProviderRepository{
  late DioClient authDioClient;
  late DioClient dioClient;
  final _baseUrl = APIPathHelper.baseUrl;
  final _authDio = Dio();
  final _dio = Dio();
  final secureStorage = SecureStorageUtil();

  ApiProviderRepository(){
    dioClient = DioClient(_baseUrl, _dio, secureStorage );
  }
}