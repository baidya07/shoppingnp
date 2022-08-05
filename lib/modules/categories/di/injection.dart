import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/di/injection.dart';
import '../data/datasource/remote/category_list_remote_datasource.dart';
import '../data/repository/category_list_repository_imp.dart';
import '../domain/repository/category_repository.dart';
import '../presentation/provider/categories_provider.dart';

final _remoteDataSource= Provider<CategoryListRemoteDataSource>((ref) => CategoryListRemoteDataSourceImpl(dioClient: ref.watch(dioClientProvider)));
final categoryRepository = Provider<CategoryListRepository>((ref) => CategoryRepositoryImpl(remoteDataSource: ref.watch(_remoteDataSource),networkInfo: ref.watch(networkInfoProvider)));
final categoryListChangeNotifierProvider = ChangeNotifierProvider((ref) => CategoryProvider(repository: ref.watch(categoryRepository)));