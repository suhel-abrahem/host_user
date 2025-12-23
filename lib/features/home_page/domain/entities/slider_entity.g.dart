// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'slider_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SliderEntity _$SliderEntityFromJson(Map<String, dynamic> json) =>
    _SliderEntity(
      id: (json['id'] as num?)?.toInt() ?? 0,
      image: json['image'] as String? ?? "",
      order: (json['order'] as num?)?.toInt() ?? 0,
      isActive: json['isActive'] as bool? ?? false,
      created_at: json['created_at'] as String? ?? "",
      updated_at: json['updated_at'] as String? ?? "",
    );

Map<String, dynamic> _$SliderEntityToJson(_SliderEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'order': instance.order,
      'isActive': instance.isActive,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
    };
