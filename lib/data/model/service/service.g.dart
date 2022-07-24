// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Service _$$_ServiceFromJson(Map<String, dynamic> json) => _$_Service(
      name: ServiceName.fromJson(json['name'] as String),
      category: Category.fromJson(json['category'] as String),
      uris: (json['uris'] as List<dynamic>)
          .map((e) => Uri.parse(e as String))
          .toList(),
      accounts: (json['accounts'] as List<dynamic>)
          .map((e) => Account.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ServiceToJson(_$_Service instance) =>
    <String, dynamic>{
      'name': instance.name,
      'category': instance.category,
      'uris': instance.uris.map((e) => e.toString()).toList(),
      'accounts': instance.accounts,
    };
