// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';
part 'service_details_model.freezed.dart';
part 'service_details_model.g.dart';

@freezed
abstract class ServiceDetailsModel with _$ServiceDetailsModel {
  const factory ServiceDetailsModel({
    @Default("") String? Authorization,
    @Default("") String? Accept_Language,
    @Default(0) int? service_id,
    @Default(0) int? city_id,
    @Default(0) double? min_price,
    @Default(0) double? max_price,
    @Default("none") String? sort_by,
  }) = _ServiceDetailsModel;
  factory ServiceDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$ServiceDetailsModelFromJson(json);
}
