import 'package:freezed_annotation/freezed_annotation.dart';
part 'slots_entity.freezed.dart';
part 'slots_entity.g.dart';

@freezed
abstract class SlotsEntity with _$SlotsEntity {
  const factory SlotsEntity({
    @Default("") String? start_time,
    @Default("") String? end_time,
    @Default("") String? datetime,
    @Default(false) bool? is_available,
  }) = _SlotsEntity;
  factory SlotsEntity.fromJson(Map<String, dynamic> json) =>
      _$SlotsEntityFromJson(json);
}
