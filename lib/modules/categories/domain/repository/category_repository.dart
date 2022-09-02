import '../../../../repository/remote/networks/api_result.dart';
import '../../../../models/network_response_model/home_data_model.dart';

abstract class CategoryListRepository{
  Future<ApiResult<List<Categories>>> getCategoryList();
}