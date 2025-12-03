import 'package:freezed_annotation/freezed_annotation.dart';

part 'service_details_entity.freezed.dart';
part 'service_details_entity.g.dart';

@freezed
abstract class ServiceDetailsEntity with _$ServiceDetailsEntity {
  const factory ServiceDetailsEntity({
    @Default({}) Map<String, dynamic>? provider_service,
    @Default({}) Map<String, dynamic>? service,
    @Default({}) Map<String, dynamic>? provider,
    @Default([]) List<Map<String, dynamic>>? languages,
  }) = _ServiceDetailsEntity;
  factory ServiceDetailsEntity.fromJson(Map<String, dynamic> json) =>
      _$ServiceDetailsEntityFromJson(json);
}
