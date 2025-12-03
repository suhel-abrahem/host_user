// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_details_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ServiceDetailsEntity _$ServiceDetailsEntityFromJson(
  Map<String, dynamic> json,
) => _ServiceDetailsEntity(
  provider_service:
      json['provider_service'] as Map<String, dynamic>? ?? const {},
  service: json['service'] as Map<String, dynamic>? ?? const {},
  provider: json['provider'] as Map<String, dynamic>? ?? const {},
  languages:
      (json['languages'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList() ??
      const [],
);

Map<String, dynamic> _$ServiceDetailsEntityToJson(
  _ServiceDetailsEntity instance,
) => <String, dynamic>{
  'provider_service': instance.provider_service,
  'service': instance.service,
  'provider': instance.provider,
  'languages': instance.languages,
};
