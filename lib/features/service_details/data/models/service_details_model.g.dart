// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ServiceDetailsModel _$ServiceDetailsModelFromJson(Map<String, dynamic> json) =>
    _ServiceDetailsModel(
      Authorization: json['Authorization'] as String? ?? "",
      Accept_Language: json['Accept_Language'] as String? ?? "",
      service_id: (json['service_id'] as num?)?.toInt() ?? 0,
      city_id: (json['city_id'] as num?)?.toInt() ?? 0,
      min_price: (json['min_price'] as num?)?.toDouble() ?? 0,
      max_price: (json['max_price'] as num?)?.toDouble() ?? 0,
      sort_by: json['sort_by'] as String? ?? "none",
    );

Map<String, dynamic> _$ServiceDetailsModelToJson(
  _ServiceDetailsModel instance,
) => <String, dynamic>{
  'Authorization': instance.Authorization,
  'Accept_Language': instance.Accept_Language,
  'service_id': instance.service_id,
  'city_id': instance.city_id,
  'min_price': instance.min_price,
  'max_price': instance.max_price,
  'sort_by': instance.sort_by,
};
