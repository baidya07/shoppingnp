import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shoppingnp/core/utils/extensions/double.dart';

import '../../../core/presentation/resources/colors.dart';
import '../data/models/product/product.dart';

class ProductGridTile extends StatelessWidget {
  final Product product;
  const ProductGridTile({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: Column(
        mainAxisSize: MainAxisSize.min,
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
                imageUrl: product.thumbnailImageUrl,
                fit: BoxFit.scaleDown,
                placeholder: (_, __) => Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
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
                    icon: product.isLiked
                        ? const Icon(Icons.favorite)
                        : const Icon(Icons.favorite_border_outlined),
                    onPressed: () {},
                  ),
                ),
              ),
              if (product.discountRate != null)
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                    child: Chip(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        label: Text(
                          '${product.discountRate!.toStringWithDynamicFractionalDigits(2)}%',
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        )),
                  ),
                )
            ],
          ),
          Text(
            product.name,
            maxLines: 2,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          if (product.discountedPriceInRupees == null)
            Padding(
              padding: const EdgeInsets.only(left: 36.0, right: 36.0, top: 12),
              child: Text(
                'Rs ${product.markedPriceInRupees.toStringWithDynamicFractionalDigits(2)}',
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            )
          else
            Padding(
              padding: const EdgeInsets.only(left: 24.0, right: 24.0, top: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Rs ${product.discountedPriceInRupees!.toStringWithDynamicFractionalDigits(2)}',
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  Text(
                      'Rs ${product.markedPriceInRupees.toStringWithDynamicFractionalDigits(2)}',
                      style: TextStyle(
                        decoration: TextDecoration.lineThrough,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: AppColors.fontColor.withOpacity(0.5),
                      ),
                      overflow: TextOverflow.ellipsis),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
