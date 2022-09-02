import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shoppingnp/modules/home/presentation/popular_view.dart';

import '../../../app_config/colors.dart';
import '../../../views/screens/home/constants/mocks/mock.dart';
import '../widget/featured_product_carousel.dart';
import 'categories_view.dart';
import 'for_you_view.dart';
import 'new_products_view.dart';
// import 'package:mobile/core/utils/extensions/double.dart';
// import '../../../../data/models/category.dart';
// import '../../../../data/models/product/product.dart';
// import '../../../constants/colors.dart';
// import '../../../constants/mocks/mock.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColors.primaryColor,
      drawer: const Drawer(),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // SliverPersistentHeader(
            //   pinned: true,
            //   floating: false,
            //   delegate: SliverDelegate(MediaQuery.of(context).size.height,
            //       MediaQuery.of(context).size.height - 300),
            // ),
            SliverAppBar(
              floating: false,
              pinned: false,
              snap: false,
              actions: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.circle_notifications)),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.circle_notifications)),
              ],
              expandedHeight: 300.00,
              stretch: true,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                stretchModes: const [
                  StretchMode.blurBackground,
                  StretchMode.fadeTitle,
                  StretchMode.zoomBackground,
                ],
                background: FeaturedProductCarousel(
                  height: 300,
                  products: kFeaturedProducts,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                    color: AppColors.scaffoldBackgroundColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: Column(
                  children: [
                    CategoriesView(categories: kCategories),
                    NewProductsView(products: kProducts),
                    const Divider(),
                    PopularView(products: kPopularProducts),
                    ForYouView(products: kProducts),
                  ],
                ),
              ),
            ),
            // SliverList(
            //   delegate: SliverChildListDelegate(
            //     [
            //       CategoriesView(
            //         categories: _kCategories,
            //       ),
            //       // NewProductsView(),
            //       // PopularView(),
            //       // ForYouView(),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

class SliverDelegate extends SliverPersistentHeaderDelegate {
  SliverDelegate(
      this.expandedHeight,
      this.roundedContainerHeight,
      );
  final double expandedHeight;
  final double roundedContainerHeight;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.red,
      child: Stack(
        children: <Widget>[
          Positioned(
            top: expandedHeight - roundedContainerHeight - shrinkOffset,
            left: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: roundedContainerHeight,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.green),
                  color: Colors.blue,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
            ),
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => 0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}
