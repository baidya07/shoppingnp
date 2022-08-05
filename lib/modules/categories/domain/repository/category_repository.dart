import '../../../../core/data/remote/api_result.dart';
import '../../../home/data/models/homeData/home_data.dart';

abstract class CategoryListRepository{
  Future<ApiResult<List<Categories>>> getCategoryList();
}