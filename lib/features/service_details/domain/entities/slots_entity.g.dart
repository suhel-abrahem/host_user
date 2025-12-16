// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'slots_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SlotsEntity _$SlotsEntityFromJson(Map<String, dynamic> json) => _SlotsEntity(
  start_time: json['start_time'] as String? ?? "",
  end_time: json['end_time'] as String? ?? "",
  datetime: json['datetime'] as String? ?? "",
  is_available: json['is_available'] as bool? ?? false,
);

Map<String, dynamic> _$SlotsEntityToJson(_SlotsEntity instance) =>
    <String, dynamic>{
      'start_time': instance.start_time,
      'end_time': instance.end_time,
      'datetime': instance.datetime,
      'is_available': instance.is_available,
    };
