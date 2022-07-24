import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:temporalobe/util/value_object.dart';

class Category extends ValueObject<String> {
  const Category(super.value);
}

class CategoryConverter implements JsonConverter<Category, String> {
  const CategoryConverter();

  @override
  Category fromJson(String json) => Category(json);

  @override
  String toJson(Category object) => object.value;
}
