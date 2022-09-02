import '../../../../repository/remote/networks/api_result.dart';
import '../../../../repository/remote/networks/network_exceptions.dart';
import '../../../../models/network_response_model/home_data_model.dart';
import '../../../../repository/remote/networks/network_info.dart';
import '../../domain/repository/category_repository.dart';
import '../datasource/remote/category_list_remote_datasource.dart';

class CategoryRepositoryImpl extends CategoryListRepository {

  final CategoryListRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  CategoryRepositoryImpl({required this.remoteDataSource,required this.networkInfo});

  @override
  Future<ApiResult<List<Categories>>> getCategoryList() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteData = await remoteDataSource.fetchCategoryList();
        final categories =  remoteData.map<Categories>((e)=>Categories.fromJson(e)).toList();
        for (var i = 0; i < categories.length; i++) {
          if (categories[i].subCategories!.isNotEmpty) categories[i].subCategories![0].isExpanded = true; //showing 0 indexed featured views displayed by default
        }
        return ApiResult.success(data: categories);
      } catch (e) {
        return ApiResult.failure(error: NetworkExceptions.getDioException(e));
      }
    } else {
      return const ApiResult.failure(
          error: NetworkExceptions.noInternetConnection());
    }
  }
}