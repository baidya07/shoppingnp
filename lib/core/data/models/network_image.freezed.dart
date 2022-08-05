// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'network_image.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NetworkImageModel _$NetworkImageModelFromJson(Map<String, dynamic> json) {
  return _NetworkImageModel.fromJson(json);
}

/// @nodoc
class _$NetworkImageModelTearOff {
  const _$NetworkImageModelTearOff();

  _NetworkImageModel call(
      {@JsonKey(name: 'id') int? id, @JsonKey(name: 'url') String? url}) {
    return _NetworkImageModel(
      id: id,
      url: url,
    );
  }

  NetworkImageModel fromJson(Map<String, Object?> json) {
    return NetworkImageModel.fromJson(json);
  }
}

/// @nodoc
const $NetworkImageModel = _$NetworkImageModelTearOff();

/// @nodoc
mixin _$NetworkImageModel {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'url')
  String? get url => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NetworkImageModelCopyWith<NetworkImageModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NetworkImageModelCopyWith<$Res> {
  factory $NetworkImageModelCopyWith(
          NetworkImageModel value, $Res Function(NetworkImageModel) then) =
      _$NetworkImageModelCopyWithImpl<$Res>;
  $Res call({@JsonKey(name: 'id') int? id, @JsonKey(name: 'url') String? url});
}

/// @nodoc
class _$NetworkImageModelCopyWithImpl<$Res>
    implements $NetworkImageModelCopyWith<$Res> {
  _$NetworkImageModelCopyWithImpl(this._value, this._then);

  final NetworkImageModel _value;
  // ignore: unused_field
  final $Res Function(NetworkImageModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? url = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$NetworkImageModelCopyWith<$Res>
    implements $NetworkImageModelCopyWith<$Res> {
  factory _$NetworkImageModelCopyWith(
          _NetworkImageModel value, $Res Function(_NetworkImageModel) then) =
      __$NetworkImageModelCopyWithImpl<$Res>;
  @override
  $Res call({@JsonKey(name: 'id') int? id, @JsonKey(name: 'url') String? url});
}

/// @nodoc
class __$NetworkImageModelCopyWithImpl<$Res>
    extends _$NetworkImageModelCopyWithImpl<$Res>
    implements _$NetworkImageModelCopyWith<$Res> {
  __$NetworkImageModelCopyWithImpl(
      _NetworkImageModel _value, $Res Function(_NetworkImageModel) _then)
      : super(_value, (v) => _then(v as _NetworkImageModel));

  @override
  _NetworkImageModel get _value => super._value as _NetworkImageModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? url = freezed,
  }) {
    return _then(_NetworkImageModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NetworkImageModel implements _NetworkImageModel {
  const _$_NetworkImageModel(
      {@JsonKey(name: 'id') this.id, @JsonKey(name: 'url') this.url});

  factory _$_NetworkImageModel.fromJson(Map<String, dynamic> json) =>
      _$$_NetworkImageModelFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'url')
  final String? url;

  @override
  String toString() {
    return 'NetworkImageModel(id: $id, url: $url)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NetworkImageModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.url, url));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(url));

  @JsonKey(ignore: true)
  @override
  _$NetworkImageModelCopyWith<_NetworkImageModel> get copyWith =>
      __$NetworkImageModelCopyWithImpl<_NetworkImageModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NetworkImageModelToJson(this);
  }
}

abstract class _NetworkImageModel implements NetworkImageModel {
  const factory _NetworkImageModel(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'url') String? url}) = _$_NetworkImageModel;

  factory _NetworkImageModel.fromJson(Map<String, dynamic> json) =
      _$_NetworkImageModel.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'url')
  String? get url;
  @override
  @JsonKey(ignore: true)
  _$NetworkImageModelCopyWith<_NetworkImageModel> get copyWith =>
      throw _privateConstructorUsedError;
}
