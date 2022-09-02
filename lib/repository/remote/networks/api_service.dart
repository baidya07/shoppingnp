// import 'dart:developer';
//
// import 'package:dio/dio.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:http/http.dart' as http;
// import 'package:shoppingnp/repository/remote/networks/api_endpoints.dart';
//
// import '../../../models/network_response_model/home_data_model.dart';
//
// class ApiService {
//   late Dio _dio;
//
//   BannersApiService(){
//     _dio = Dio();
//   }
//   Future<List<Banners>?> getBanners() async {
//     try {
//       Response response = await _dio.get(APIPathHelper.baseUrl + APIPathHelper.authAPIs(APIPath.getHome));
//       Banners banners = Banners.fromJson(response.data);
//       return bannersFromJson(banners.title);
//       // if (response.statusCode == 200) {
//       //   List<Banners> _model = bannersFromJson(response.data);
//       //   return _model;
//       // }
//     } on DioError catch (e) {
//       print(e);
//     }
//   }
// }