// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SearchModel _$SearchModelFromJson(Map<String, dynamic> json) => _SearchModel(
  token: json['token'] as String? ?? "",
  acceptLanguage: json['acceptLanguage'] as String? ?? "",
  query: json['query'] as String? ?? "",
);

Map<String, dynamic> _$SearchModelToJson(_SearchModel instance) =>
    <String, dynamic>{
      'token': instance.token,
      'acceptLanguage': instance.acceptLanguage,
      'query': instance.query,
    };
