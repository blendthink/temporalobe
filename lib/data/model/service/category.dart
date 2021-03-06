import 'package:temporalobe/util/value_object.dart';

class Category extends ValueObject<String> {
  const Category(super.value);

  factory Category.fromJson(String value) => Category(value);

  String toJson() => value;
}
