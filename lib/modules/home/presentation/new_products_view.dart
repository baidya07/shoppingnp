// part of 'home.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shoppingnp/utils/extensions/double.dart';

import '../../../app_config/colors.dart';
import '../data/models/product/product.dart';

class NewProductsView extends StatelessWidget {
  final List<Product<int, int>> products;

  const NewProductsView({
    Key? key,
    this.products = const <Product<int, int>>[],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (products.isEmpty) {
      return const SizedBox(height: 0);
    } else {
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'New Products',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                TextButton(
                  child: const Text('See All'),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          SizedBox(
            height: 230,
            child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => SizedBox(
                      width: 200,
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                width: 200,
                                height: 160,
                              ),
                              CachedNetworkImage(
                                width: 200,
                                height: 160,
                                imageUrl: products[index].thumbnailImageUrl,
                                fit: BoxFit.scaleDown,
                                placeholder: (_, __) => Container(
                                  decoration: BoxDecoration(
                                    color: primaryColor,
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topRight,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: IconButton(
                                    color: Colors.red,
                                    icon: products[index].isLiked
                                        ? const Icon(Icons.favorite)
                                        : const Icon(
                                            Icons.favorite_border_outlined),
                                    onPressed: () {},
                                  ),
                                ),
                              ),
                              if (products[index].discountRate != null)
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 12),
                                    child: Chip(
                                        backgroundColor: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                        label: Text(
                                          '${products[index].discountRate!.toStringWithDynamicFractionalDigits(2)}%',
                                          style: const TextStyle(
                                            color: Colors.white,
                                          ),
                                        )),
                                  ),
                                )
                            ],
                          ),
                          Text(
                            products[index].name,
                            maxLines: 2,
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          if (products[index].discountedPriceInRupees == null)
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 36.0, right: 36.0, top: 12),
                                child: Text(
                                  'Rs ${products[index].markedPriceInRupees.toStringWithDynamicFractionalDigits(2)}',
                                  style: const TextStyle(
                                      fontSize: 14, fontWeight: FontWeight.bold),
                                ),
                              ),
                            )
                          else
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 36.0, right: 36.0, top: 12),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Rs ${products[index].discountedPriceInRupees!.toStringWithDynamicFractionalDigits(2)}',
                                      style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                        'Rs ${products[index].markedPriceInRupees.toStringWithDynamicFractionalDigits(2)}',
                                        style: TextStyle(
                                          decoration: TextDecoration.lineThrough,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                          color: AppColors.fontColor
                                              .withOpacity(0.5),
                                        ),
                                        overflow: TextOverflow.ellipsis),
                                  ],
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                separatorBuilder: (context, index) => const SizedBox(
                      width: 12,
                    ),
                itemCount: products.length),
          )
        ],
      );
    }
  }
}
