import 'package:freezed_annotation/freezed_annotation.dart';

part 'field.freezed.dart';

part 'field.g.dart';

@freezed
abstract class Field with _$Field {
  const factory Field({
    required String key,
    required String value,
    required bool canObscure,
  }) = _Field;

  factory Field.fromJson(Map<String, dynamic> json) => _$FieldFromJson(json);
}
