import 'package:freezed_annotation/freezed_annotation.dart';
part 'rate_entity.freezed.dart';
part 'rate_entity.g.dart';

@freezed
abstract class RateEntity with _$RateEntity {
  const factory RateEntity({
    @Default("") String? message,
    @Default({}) Map<String, dynamic>? data,
  }) = _RateEntity;
  factory RateEntity.fromJson(Map<String, dynamic> json) =>
      _$RateEntityFromJson(json);
}
