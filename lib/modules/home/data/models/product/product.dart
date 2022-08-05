import 'package:freezed_annotation/freezed_annotation.dart';
part 'product.freezed.dart';


@freezed
class Product<T, C> with _$Product<T, C> {
  @Assert('markedPriceInRupees > 0', 'Price of a product can never be zero.')
  @Assert('productImages.length > 0',
      'Product must have at least one product image.')
  @Assert('categoryIds.length > 0',
      'Product must have at least one category image.')
  factory Product({
    required T id,
    required String name,
    required List<C> categoryIds,
    required double markedPriceInRupees,
    double? discountedPriceInRupees,
    double? discountRate,
    required String thumbnailImageUrl,
    required List<String> productImages,
    @Default(false) bool isLiked,
  }) = _Product;
}
