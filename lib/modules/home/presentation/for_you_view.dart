// part of 'home.dart';

import 'package:flutter/material.dart';

import '../data/models/product/product.dart';
import '../widget/product_list_tile.dart';

class ForYouView extends StatelessWidget {
  final List<Product> products;
  const ForYouView({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              child: Text(
                'For You',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 230,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            scrollDirection: Axis.horizontal,
            itemCount: products.length,
            itemBuilder: (context, index) {
              return ProductListTileView(product: products[index]);
            },
            separatorBuilder: (_, __) => const SizedBox(width: 16),
          ),
        )
      ],
    );
  }
}
