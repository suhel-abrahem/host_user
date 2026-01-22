// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SearchEntity _$SearchEntityFromJson(Map<String, dynamic> json) =>
    _SearchEntity(
      id: (json['id'] as num?)?.toInt() ?? 0,
      name: json['name'] as String? ?? "",
      image: json['image'] as String? ?? "",
      is_active: json['is_active'] as bool? ?? false,
      category: json['category'] as Map<String, dynamic>? ?? const {},
    );

Map<String, dynamic> _$SearchEntityToJson(_SearchEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'is_active': instance.is_active,
      'category': instance.category,
    };
