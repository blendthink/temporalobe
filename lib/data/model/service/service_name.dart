import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:temporalobe/util/value_object.dart';

class ServiceName extends ValueObject<String> {
  const ServiceName(super.value);
}

class ServiceNameConverter implements JsonConverter<ServiceName, String> {
  const ServiceNameConverter();

  @override
  ServiceName fromJson(String json) => ServiceName(json);

  @override
  String toJson(ServiceName object) => object.value;
}
