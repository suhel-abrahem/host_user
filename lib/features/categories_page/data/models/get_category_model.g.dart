// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GetCategoryModel _$GetCategoryModelFromJson(Map<String, dynamic> json) =>
    _GetCategoryModel(
      Authorization: json['Authorization'] as String? ?? "",
      acceptLanguage: json['acceptLanguage'] as String? ?? "",
      page: json['page'] as String? ?? "",
      per_page: json['per_page'] as String? ?? "",
    );

Map<String, dynamic> _$GetCategoryModelToJson(_GetCategoryModel instance) =>
    <String, dynamic>{
      'Authorization': instance.Authorization,
      'acceptLanguage': instance.acceptLanguage,
      'page': instance.page,
      'per_page': instance.per_page,
    };
