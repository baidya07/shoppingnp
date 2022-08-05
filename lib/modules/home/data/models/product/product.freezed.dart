// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'product.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ProductTearOff {
  const _$ProductTearOff();

  _Product<T, C> call<T, C>(
      {required T id,
      required String name,
      required List<C> categoryIds,
      required double markedPriceInRupees,
      double? discountedPriceInRupees,
      double? discountRate,
      required String thumbnailImageUrl,
      required List<String> productImages,
      bool isLiked = false}) {
    return _Product<T, C>(
      id: id,
      name: name,
      categoryIds: categoryIds,
      markedPriceInRupees: markedPriceInRupees,
      discountedPriceInRupees: discountedPriceInRupees,
      discountRate: discountRate,
      thumbnailImageUrl: thumbnailImageUrl,
      productImages: productImages,
      isLiked: isLiked,
    );
  }
}

/// @nodoc
const $Product = _$ProductTearOff();

/// @nodoc
mixin _$Product<T, C> {
  T get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  List<C> get categoryIds => throw _privateConstructorUsedError;
  double get markedPriceInRupees => throw _privateConstructorUsedError;
  double? get discountedPriceInRupees => throw _privateConstructorUsedError;
  double? get discountRate => throw _privateConstructorUsedError;
  String get thumbnailImageUrl => throw _privateConstructorUsedError;
  List<String> get productImages => throw _privateConstructorUsedError;
  bool get isLiked => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProductCopyWith<T, C, Product<T, C>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductCopyWith<T, C, $Res> {
  factory $ProductCopyWith(
          Product<T, C> value, $Res Function(Product<T, C>) then) =
      _$ProductCopyWithImpl<T, C, $Res>;
  $Res call(
      {T id,
      String name,
      List<C> categoryIds,
      double markedPriceInRupees,
      double? discountedPriceInRupees,
      double? discountRate,
      String thumbnailImageUrl,
      List<String> productImages,
      bool isLiked});
}

/// @nodoc
class _$ProductCopyWithImpl<T, C, $Res>
    implements $ProductCopyWith<T, C, $Res> {
  _$ProductCopyWithImpl(this._value, this._then);

  final Product<T, C> _value;
  // ignore: unused_field
  final $Res Function(Product<T, C>) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? categoryIds = freezed,
    Object? markedPriceInRupees = freezed,
    Object? discountedPriceInRupees = freezed,
    Object? discountRate = freezed,
    Object? thumbnailImageUrl = freezed,
    Object? productImages = freezed,
    Object? isLiked = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as T,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      categoryIds: categoryIds == freezed
          ? _value.categoryIds
          : categoryIds // ignore: cast_nullable_to_non_nullable
              as List<C>,
      markedPriceInRupees: markedPriceInRupees == freezed
          ? _value.markedPriceInRupees
          : markedPriceInRupees // ignore: cast_nullable_to_non_nullable
              as double,
      discountedPriceInRupees: discountedPriceInRupees == freezed
          ? _value.discountedPriceInRupees
          : discountedPriceInRupees // ignore: cast_nullable_to_non_nullable
              as double?,
      discountRate: discountRate == freezed
          ? _value.discountRate
          : discountRate // ignore: cast_nullable_to_non_nullable
              as double?,
      thumbnailImageUrl: thumbnailImageUrl == freezed
          ? _value.thumbnailImageUrl
          : thumbnailImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      productImages: productImages == freezed
          ? _value.productImages
          : productImages // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isLiked: isLiked == freezed
          ? _value.isLiked
          : isLiked // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$ProductCopyWith<T, C, $Res>
    implements $ProductCopyWith<T, C, $Res> {
  factory _$ProductCopyWith(
          _Product<T, C> value, $Res Function(_Product<T, C>) then) =
      __$ProductCopyWithImpl<T, C, $Res>;
  @override
  $Res call(
      {T id,
      String name,
      List<C> categoryIds,
      double markedPriceInRupees,
      double? discountedPriceInRupees,
      double? discountRate,
      String thumbnailImageUrl,
      List<String> productImages,
      bool isLiked});
}

/// @nodoc
class __$ProductCopyWithImpl<T, C, $Res>
    extends _$ProductCopyWithImpl<T, C, $Res>
    implements _$ProductCopyWith<T, C, $Res> {
  __$ProductCopyWithImpl(
      _Product<T, C> _value, $Res Function(_Product<T, C>) _then)
      : super(_value, (v) => _then(v as _Product<T, C>));

  @override
  _Product<T, C> get _value => super._value as _Product<T, C>;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? categoryIds = freezed,
    Object? markedPriceInRupees = freezed,
    Object? discountedPriceInRupees = freezed,
    Object? discountRate = freezed,
    Object? thumbnailImageUrl = freezed,
    Object? productImages = freezed,
    Object? isLiked = freezed,
  }) {
    return _then(_Product<T, C>(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as T,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      categoryIds: categoryIds == freezed
          ? _value.categoryIds
          : categoryIds // ignore: cast_nullable_to_non_nullable
              as List<C>,
      markedPriceInRupees: markedPriceInRupees == freezed
          ? _value.markedPriceInRupees
          : markedPriceInRupees // ignore: cast_nullable_to_non_nullable
              as double,
      discountedPriceInRupees: discountedPriceInRupees == freezed
          ? _value.discountedPriceInRupees
          : discountedPriceInRupees // ignore: cast_nullable_to_non_nullable
              as double?,
      discountRate: discountRate == freezed
          ? _value.discountRate
          : discountRate // ignore: cast_nullable_to_non_nullable
              as double?,
      thumbnailImageUrl: thumbnailImageUrl == freezed
          ? _value.thumbnailImageUrl
          : thumbnailImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      productImages: productImages == freezed
          ? _value.productImages
          : productImages // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isLiked: isLiked == freezed
          ? _value.isLiked
          : isLiked // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_Product<T, C> implements _Product<T, C> {
  _$_Product(
      {required this.id,
      required this.name,
      required this.categoryIds,
      required this.markedPriceInRupees,
      this.discountedPriceInRupees,
      this.discountRate,
      required this.thumbnailImageUrl,
      required this.productImages,
      this.isLiked = false})
      : assert(
            markedPriceInRupees > 0, 'Price of a product can never be zero.'),
        assert(productImages.length > 0,
            'Product must have at least one product image.'),
        assert(categoryIds.length > 0,
            'Product must have at least one category image.');

  @override
  final T id;
  @override
  final String name;
  @override
  final List<C> categoryIds;
  @override
  final double markedPriceInRupees;
  @override
  final double? discountedPriceInRupees;
  @override
  final double? discountRate;
  @override
  final String thumbnailImageUrl;
  @override
  final List<String> productImages;
  @JsonKey()
  @override
  final bool isLiked;

  @override
  String toString() {
    return 'Product<$T, $C>(id: $id, name: $name, categoryIds: $categoryIds, markedPriceInRupees: $markedPriceInRupees, discountedPriceInRupees: $discountedPriceInRupees, discountRate: $discountRate, thumbnailImageUrl: $thumbnailImageUrl, productImages: $productImages, isLiked: $isLiked)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Product<T, C> &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.categoryIds, categoryIds) &&
            const DeepCollectionEquality()
                .equals(other.markedPriceInRupees, markedPriceInRupees) &&
            const DeepCollectionEquality().equals(
                other.discountedPriceInRupees, discountedPriceInRupees) &&
            const DeepCollectionEquality()
                .equals(other.discountRate, discountRate) &&
            const DeepCollectionEquality()
                .equals(other.thumbnailImageUrl, thumbnailImageUrl) &&
            const DeepCollectionEquality()
                .equals(other.productImages, productImages) &&
            const DeepCollectionEquality().equals(other.isLiked, isLiked));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(categoryIds),
      const DeepCollectionEquality().hash(markedPriceInRupees),
      const DeepCollectionEquality().hash(discountedPriceInRupees),
      const DeepCollectionEquality().hash(discountRate),
      const DeepCollectionEquality().hash(thumbnailImageUrl),
      const DeepCollectionEquality().hash(productImages),
      const DeepCollectionEquality().hash(isLiked));

  @JsonKey(ignore: true)
  @override
  _$ProductCopyWith<T, C, _Product<T, C>> get copyWith =>
      __$ProductCopyWithImpl<T, C, _Product<T, C>>(this, _$identity);
}

abstract class _Product<T, C> implements Product<T, C> {
  factory _Product(
      {required T id,
      required String name,
      required List<C> categoryIds,
      required double markedPriceInRupees,
      double? discountedPriceInRupees,
      double? discountRate,
      required String thumbnailImageUrl,
      required List<String> productImages,
      bool isLiked}) = _$_Product<T, C>;

  @override
  T get id;
  @override
  String get name;
  @override
  List<C> get categoryIds;
  @override
  double get markedPriceInRupees;
  @override
  double? get discountedPriceInRupees;
  @override
  double? get discountRate;
  @override
  String get thumbnailImageUrl;
  @override
  List<String> get productImages;
  @override
  bool get isLiked;
  @override
  @JsonKey(ignore: true)
  _$ProductCopyWith<T, C, _Product<T, C>> get copyWith =>
      throw _privateConstructorUsedError;
}
