// part of 'home.dart';
import 'package:flutter/material.dart';

import '../data/models/product/product.dart';
import '../widget/product_grid_tile.dart';

class PopularView extends StatelessWidget {
  final List<Product> products;

  const PopularView({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 16, left: 16),
                child: Text(
                  'Popular',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
            ],
          ),
          GridView.count(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 200 / 270,
            children: products
                .map<Widget>((product) => ProductGridTile(
                      product: product,
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}
