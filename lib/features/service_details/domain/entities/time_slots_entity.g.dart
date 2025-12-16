// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time_slots_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TimeSlotsEntity _$TimeSlotsEntityFromJson(Map<String, dynamic> json) =>
    _TimeSlotsEntity(
      date: json['date'] as String? ?? "",
      day_name: json['day_name'] as String? ?? "",
      slots:
          (json['slots'] as List<dynamic>?)
              ?.map(
                (e) => e == null
                    ? null
                    : SlotsEntity.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const [],
    );

Map<String, dynamic> _$TimeSlotsEntityToJson(_TimeSlotsEntity instance) =>
    <String, dynamic>{
      'date': instance.date,
      'day_name': instance.day_name,
      'slots': instance.slots,
    };
