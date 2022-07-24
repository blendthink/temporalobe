import 'package:temporalobe/util/value_object.dart';

class ServiceName extends ValueObject<String> {
  const ServiceName(super.value);

  factory ServiceName.fromJson(String value) => ServiceName(value);

  String toJson() => value;
}
