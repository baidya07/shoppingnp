import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../repository/remote/networks/api_result.dart';
import '../../domain/repository/category_repository.dart';
//app level ko state handling page
class CategoryProvider with ChangeNotifier {
  CategoryListRepository repository;

  CategoryProvider({required this.repository}) {
    fetchCategoryData();
  }
//loading success, failure
  AsyncValue apiResult = const AsyncValue.loading();

  Future<void> fetchCategoryData() async {
    apiResult = const AsyncValue.loading();
    ApiResult result = await repository.getCategoryList();
    result.when(success: (data) {
      apiResult = AsyncValue.data(data);
      notifyListeners();
    }, failure: (error) {
      apiResult = AsyncValue.error(error);
      notifyListeners();
    });
  }
}