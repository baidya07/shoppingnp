import 'package:freezed_annotation/freezed_annotation.dart';
part 'category.freezed.dart';

@freezed
class Category<T> with _$Category<T> {
  factory Category({
    required T id,
    required String name,
    required String imageUrl,
  }) = _Category;
}
