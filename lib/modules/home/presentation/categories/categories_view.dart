//
// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:shoppingnp/modules/home/data/models/homeData/home_data_model.dart';
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
//
//
// import '../../../../../core/presentation/widget/empty_view.dart';
// import '../../../../core/data/remote/network_exceptions.dart';
// import '../../../categories/di/injection.dart';
//
// class ShopCategoryView extends ConsumerWidget {
//   const ShopCategoryView({
//     Key? key,x
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context,  WidgetRef ref) {
//
//     final models = ref.watch(categoryListChangeNotifierProvider);
//     return models.apiResult.when(data: (data) {
//       final List<Categories> mainCategoryList = data;
//       return AlignedGridView.count(
//         crossAxisCount: 4,
//         itemCount: mainCategoryList.length,
//         shrinkWrap: true,
//         physics: const NeverScrollableScrollPhysics(),
//         itemBuilder: (BuildContext context, int index) {
//           final category = mainCategoryList[index];
//           return CategoryCard(
//             isRectangle: false,
//             onTap: () {
//             }, imageUrl: category.image??"N/A", name: category.name??"N/A",);
//         },
//         // staggeredTileBuilder: (int index) => const StaggeredTile.fit(2),
//         mainAxisSpacing: 1,
//         crossAxisSpacing: 1,
//
//       );
//     }, error: (error, stackTrace) {
//       return Center(child: EmptyView(message: NetworkExceptions.getErrorMessage(error as NetworkExceptions)));
//     }, loading: () {
//       return const ShimmerView(isRectangle: false,);
//     });
//   }
// }
//
//
