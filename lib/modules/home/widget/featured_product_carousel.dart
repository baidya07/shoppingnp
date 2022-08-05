import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:shoppingnp/core/utils/extensions/double.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../data/models/product/product.dart';



class FeaturedProductCarousel extends StatefulWidget {
  final double height;
  final List<Product> products;

  FeaturedProductCarousel({
    Key? key,
    required this.height,
    required this.products,
  })  : assert(products.isNotEmpty == true,
            'At least one featured product is needed.'),
        super(key: key);

  @override
  State<FeaturedProductCarousel> createState() =>
      _FeaturedProductCarouselState();
}

class _FeaturedProductCarouselState extends State<FeaturedProductCarousel> {
  CarouselController? _carouselController;
  int _currentPage = 0;

  final TextStyle _actualPriceStyle = const TextStyle(
    color: Colors.white,
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );

  final TextStyle _titleStyle = const TextStyle(
    color: Colors.white,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  @override
  void initState() {
    super.initState();

    _carouselController = CarouselController();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
            carouselController: _carouselController,
            items: widget.products
                .map<Widget>((product) => Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          flex: 3,
                          child: OverflowBox(
                            child: ClipRRect(
                              clipBehavior: Clip.hardEdge,
                              child: Transform.translate(
                                offset: const Offset(-20, 0),
                                child: Transform.rotate(
                                  angle: pi / 5,
                                  child: CachedNetworkImage(
                                    height: 300,
                                    fit: BoxFit.scaleDown,
                                    imageUrl: product.thumbnailImageUrl,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                            flex: 4,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8, bottom: 26, right: 8),
                                  child: Text(
                                    product.name,
                                    style: _titleStyle,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                if (product.discountedPriceInRupees != null)
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        'Rs ${product.discountedPriceInRupees!.toStringWithDynamicFractionalDigits(2)}',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: _actualPriceStyle,
                                        textAlign: TextAlign.center,
                                      ),
                                      Text(
                                        'Rs ${product.markedPriceInRupees.toStringWithDynamicFractionalDigits(2)}',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            color: Colors.grey.shade300,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            decoration:
                                                TextDecoration.lineThrough),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  )
                                else
                                  Text(
                                    'Rs ${product.markedPriceInRupees.toStringWithDynamicFractionalDigits(2)}',
                                    style: _actualPriceStyle,
                                  ),
                              ],
                            )),
                      ],
                    ))
                .toList(),
            options: CarouselOptions(
              onPageChanged: ((index, reason) {
                setState(() {
                  _currentPage = index;
                });
              }),
              height: widget.height,
              viewportFraction: 1,
            )),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: AnimatedSmoothIndicator(
              activeIndex: _currentPage,
              count: widget.products.length,
              effect: WormEffect(
                activeDotColor: Colors.white,
                dotColor: Colors.grey.shade400,
                dotWidth: 12,
                dotHeight: 12,
              ),
            ),
          ),
        )
      ],
    );
  }
}
