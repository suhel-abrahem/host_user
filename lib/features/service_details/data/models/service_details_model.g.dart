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
      price: json['price'] as String? ?? "none",
      distance: json['distance'] as bool? ?? false,
      language: json['language'] as String? ?? "none",
      lat: json['lat'] as String? ?? "none",
      lng: json['lng'] as String? ?? "none",
    );

Map<String, dynamic> _$ServiceDetailsModelToJson(
  _ServiceDetailsModel instance,
) => <String, dynamic>{
  'Authorization': instance.Authorization,
  'Accept_Language': instance.Accept_Language,
  'service_id': instance.service_id,
  'city_id': instance.city_id,
  'price': instance.price,
  'distance': instance.distance,
  'language': instance.language,
  'lat': instance.lat,
  'lng': instance.lng,
};
