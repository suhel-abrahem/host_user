// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_booking_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StoreBookingModel _$StoreBookingModelFromJson(Map<String, dynamic> json) =>
    _StoreBookingModel(
      acceptLanguage: json['acceptLanguage'] as String? ?? "ar",
      authToken: json['authToken'] as String? ?? "",
      serviceId: (json['serviceId'] as num?)?.toInt() ?? 0,
      providerId: (json['providerId'] as num?)?.toInt() ?? 0,
      notes: json['notes'] as String? ?? '',
      attachments: const ImagesJsonConverter().fromJson(
        json['attachments'] as List<String?>?,
      ),
      scheduledAt: json['scheduledAt'] as String? ?? '',
    );

Map<String, dynamic> _$StoreBookingModelToJson(_StoreBookingModel instance) =>
    <String, dynamic>{
      'acceptLanguage': instance.acceptLanguage,
      'authToken': instance.authToken,
      'serviceId': instance.serviceId,
      'providerId': instance.providerId,
      'notes': instance.notes,
      'attachments': const ImagesJsonConverter().toJson(instance.attachments),
      'scheduledAt': instance.scheduledAt,
    };
