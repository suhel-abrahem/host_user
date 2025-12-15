import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';

import 'images_json_converter.dart';
part 'store_booking_model.freezed.dart';
part 'store_booking_model.g.dart';

@freezed
abstract class StoreBookingModel with _$StoreBookingModel {
  const factory StoreBookingModel({
    @Default("ar") String? acceptLanguage,
    @Default("") String? authToken,
    @Default(0) int? serviceId,
    @Default(0) int? providerId,
    @Default('') String? notes,
    @ImagesJsonConverter() List<File?>? attachments,
    @Default('') String? scheduledAt,
  }) = _StoreBookingModel;
  factory StoreBookingModel.fromJson(Map<String, dynamic> json) =>
      _$StoreBookingModelFromJson(json);
}
