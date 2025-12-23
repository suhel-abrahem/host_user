// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';
part 'slider_entity.freezed.dart';
part "slider_entity.g.dart";

@freezed
abstract class SliderEntity with _$SliderEntity {
  const factory SliderEntity({
    @Default(0) int? id,
    @Default("") String? image,
    @Default(0) int? order,
    @Default(false) bool? isActive,
    @Default("") String? created_at,
    @Default("") String? updated_at,
  }) = _SliderEntity;

  factory SliderEntity.fromJson(Map<String, dynamic> json) =>
      _$SliderEntityFromJson(json);
}
