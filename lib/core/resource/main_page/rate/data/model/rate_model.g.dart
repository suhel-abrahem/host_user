// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rate_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RateModel _$RateModelFromJson(Map<String, dynamic> json) => _RateModel(
  bookingId: (json['bookingId'] as num?)?.toInt() ?? 0,
  rating: (json['rating'] as num?)?.toInt() ?? 0,
  comment: json['comment'] as String? ?? "",
  token: json['token'] as String? ?? "",
);

Map<String, dynamic> _$RateModelToJson(_RateModel instance) =>
    <String, dynamic>{
      'bookingId': instance.bookingId,
      'rating': instance.rating,
      'comment': instance.comment,
      'token': instance.token,
    };
