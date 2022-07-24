import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:temporalobe/data/model/service/account.dart';
import 'package:temporalobe/data/model/service/category.dart';
import 'package:temporalobe/data/model/service/service_name.dart';

part 'service.freezed.dart';

part 'service.g.dart';

@freezed
class Service with _$Service {
  const factory Service({
    required ServiceName name,
    required Category category,
    required List<Uri> uris,
    required List<Account> accounts,
  }) = _Service;

  factory Service.fromJson(Map<String, dynamic> json) =>
      _$ServiceFromJson(json);
}
