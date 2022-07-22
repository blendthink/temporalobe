import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:temporalobe/data/model/service/field.dart';

part 'account.freezed.dart';

part 'account.g.dart';

@freezed
abstract class Account with _$Account {
  const factory Account({
    required String username,
    required String password,
    required String totp,
    required List<Field> field,
  }) = _Account;

  factory Account.fromJson(Map<String, dynamic> json) =>
      _$AccountFromJson(json);
}
