import 'package:freezed_annotation/freezed_annotation.dart';

part 'category.freezed.dart';

part 'category.g.dart';

@freezed
abstract class ServiceCategory with _$ServiceCategory {
  const factory ServiceCategory({
    required String name,
  }) = _Category;

  factory ServiceCategory.fromJson(Map<String, dynamic> json) =>
      _$ServiceCategoryFromJson(json);
}
