// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';
part 'search_entity.freezed.dart';
part 'search_entity.g.dart';

@freezed
abstract class SearchEntity with _$SearchEntity {
  const factory SearchEntity({
    @Default(0) int? id,
    @Default("") String? name,
    @Default("") String? image,
    @Default(false) bool? is_active,
    @Default({}) Map<String, dynamic>? category,
  }) = _SearchEntity;

  factory SearchEntity.fromJson(Map<String, dynamic> json) =>
      _$SearchEntityFromJson(json);
}
