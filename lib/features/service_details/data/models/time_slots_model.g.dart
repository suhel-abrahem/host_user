// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time_slots_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TimeSlotsModel _$TimeSlotsModelFromJson(Map<String, dynamic> json) =>
    _TimeSlotsModel(
      token: json['token'] as String? ?? "",
      acceptLanguage: json['acceptLanguage'] as String? ?? "",
      providerServiceId: (json['providerServiceId'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$TimeSlotsModelToJson(_TimeSlotsModel instance) =>
    <String, dynamic>{
      'token': instance.token,
      'acceptLanguage': instance.acceptLanguage,
      'providerServiceId': instance.providerServiceId,
    };
