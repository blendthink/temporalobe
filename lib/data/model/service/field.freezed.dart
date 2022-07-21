// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'field.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Field _$FieldFromJson(Map<String, dynamic> json) {
  return _Field.fromJson(json);
}

/// @nodoc
mixin _$Field {
  String get key => throw _privateConstructorUsedError;
  String get value => throw _privateConstructorUsedError;
  bool get canObscure => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FieldCopyWith<Field> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FieldCopyWith<$Res> {
  factory $FieldCopyWith(Field value, $Res Function(Field) then) =
      _$FieldCopyWithImpl<$Res>;
  $Res call({String key, String value, bool canObscure});
}

/// @nodoc
class _$FieldCopyWithImpl<$Res> implements $FieldCopyWith<$Res> {
  _$FieldCopyWithImpl(this._value, this._then);

  final Field _value;
  // ignore: unused_field
  final $Res Function(Field) _then;

  @override
  $Res call({
    Object? key = freezed,
    Object? value = freezed,
    Object? canObscure = freezed,
  }) {
    return _then(_value.copyWith(
      key: key == freezed
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      canObscure: canObscure == freezed
          ? _value.canObscure
          : canObscure // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_FieldCopyWith<$Res> implements $FieldCopyWith<$Res> {
  factory _$$_FieldCopyWith(_$_Field value, $Res Function(_$_Field) then) =
      __$$_FieldCopyWithImpl<$Res>;
  @override
  $Res call({String key, String value, bool canObscure});
}

/// @nodoc
class __$$_FieldCopyWithImpl<$Res> extends _$FieldCopyWithImpl<$Res>
    implements _$$_FieldCopyWith<$Res> {
  __$$_FieldCopyWithImpl(_$_Field _value, $Res Function(_$_Field) _then)
      : super(_value, (v) => _then(v as _$_Field));

  @override
  _$_Field get _value => super._value as _$_Field;

  @override
  $Res call({
    Object? key = freezed,
    Object? value = freezed,
    Object? canObscure = freezed,
  }) {
    return _then(_$_Field(
      key: key == freezed
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      canObscure: canObscure == freezed
          ? _value.canObscure
          : canObscure // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Field implements _Field {
  const _$_Field(
      {required this.key, required this.value, required this.canObscure});

  factory _$_Field.fromJson(Map<String, dynamic> json) =>
      _$$_FieldFromJson(json);

  @override
  final String key;
  @override
  final String value;
  @override
  final bool canObscure;

  @override
  String toString() {
    return 'Field(key: $key, value: $value, canObscure: $canObscure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Field &&
            const DeepCollectionEquality().equals(other.key, key) &&
            const DeepCollectionEquality().equals(other.value, value) &&
            const DeepCollectionEquality()
                .equals(other.canObscure, canObscure));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(key),
      const DeepCollectionEquality().hash(value),
      const DeepCollectionEquality().hash(canObscure));

  @JsonKey(ignore: true)
  @override
  _$$_FieldCopyWith<_$_Field> get copyWith =>
      __$$_FieldCopyWithImpl<_$_Field>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FieldToJson(
      this,
    );
  }
}

abstract class _Field implements Field {
  const factory _Field(
      {required final String key,
      required final String value,
      required final bool canObscure}) = _$_Field;

  factory _Field.fromJson(Map<String, dynamic> json) = _$_Field.fromJson;

  @override
  String get key;
  @override
  String get value;
  @override
  bool get canObscure;
  @override
  @JsonKey(ignore: true)
  _$$_FieldCopyWith<_$_Field> get copyWith =>
      throw _privateConstructorUsedError;
}
