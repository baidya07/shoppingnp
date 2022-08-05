// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$CategoryTearOff {
  const _$CategoryTearOff();

  _Category<T> call<T>(
      {required T id, required String name, required String imageUrl}) {
    return _Category<T>(
      id: id,
      name: name,
      imageUrl: imageUrl,
    );
  }
}

/// @nodoc
const $Category = _$CategoryTearOff();

/// @nodoc
mixin _$Category<T> {
  T get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CategoryCopyWith<T, Category<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryCopyWith<T, $Res> {
  factory $CategoryCopyWith(
          Category<T> value, $Res Function(Category<T>) then) =
      _$CategoryCopyWithImpl<T, $Res>;
  $Res call({T id, String name, String imageUrl});
}

/// @nodoc
class _$CategoryCopyWithImpl<T, $Res> implements $CategoryCopyWith<T, $Res> {
  _$CategoryCopyWithImpl(this._value, this._then);

  final Category<T> _value;
  // ignore: unused_field
  final $Res Function(Category<T>) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? imageUrl = freezed,
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
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$CategoryCopyWith<T, $Res>
    implements $CategoryCopyWith<T, $Res> {
  factory _$CategoryCopyWith(
          _Category<T> value, $Res Function(_Category<T>) then) =
      __$CategoryCopyWithImpl<T, $Res>;
  @override
  $Res call({T id, String name, String imageUrl});
}

/// @nodoc
class __$CategoryCopyWithImpl<T, $Res> extends _$CategoryCopyWithImpl<T, $Res>
    implements _$CategoryCopyWith<T, $Res> {
  __$CategoryCopyWithImpl(
      _Category<T> _value, $Res Function(_Category<T>) _then)
      : super(_value, (v) => _then(v as _Category<T>));

  @override
  _Category<T> get _value => super._value as _Category<T>;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? imageUrl = freezed,
  }) {
    return _then(_Category<T>(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as T,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Category<T> implements _Category<T> {
  _$_Category({required this.id, required this.name, required this.imageUrl});

  @override
  final T id;
  @override
  final String name;
  @override
  final String imageUrl;

  @override
  String toString() {
    return 'Category<$T>(id: $id, name: $name, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Category<T> &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.imageUrl, imageUrl));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(imageUrl));

  @JsonKey(ignore: true)
  @override
  _$CategoryCopyWith<T, _Category<T>> get copyWith =>
      __$CategoryCopyWithImpl<T, _Category<T>>(this, _$identity);
}

abstract class _Category<T> implements Category<T> {
  factory _Category(
      {required T id,
      required String name,
      required String imageUrl}) = _$_Category<T>;

  @override
  T get id;
  @override
  String get name;
  @override
  String get imageUrl;
  @override
  @JsonKey(ignore: true)
  _$CategoryCopyWith<T, _Category<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
