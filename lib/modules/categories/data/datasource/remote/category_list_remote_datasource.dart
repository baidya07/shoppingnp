import '../../../../../repository/remote/networks/api_endpoints.dart';
import '../../../../../repository/remote/networks/dio_client.dart';

abstract class CategoryListRemoteDataSource {
  Future<dynamic> fetchCategoryList();
}

class CategoryListRemoteDataSourceImpl extends CategoryListRemoteDataSource {
  final DioClient dioClient;

  CategoryListRemoteDataSourceImpl({required this.dioClient});

  @override
  Future<dynamic> fetchCategoryList() async {
    try {
      final response =
          await dioClient.get(APIPathHelper.authAPIs(APIPath.getHome));
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
