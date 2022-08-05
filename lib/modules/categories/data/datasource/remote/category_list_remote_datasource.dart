import '../../../../../core/data/remote/dio_client.dart';
import '../../../../../core/data/utils/api_endpoints.dart';

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
