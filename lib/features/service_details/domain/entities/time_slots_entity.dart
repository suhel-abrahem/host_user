import 'package:freezed_annotation/freezed_annotation.dart';

import 'slots_entity.dart';
part 'time_slots_entity.freezed.dart';
part 'time_slots_entity.g.dart';

@freezed
abstract class TimeSlotsEntity with _$TimeSlotsEntity {
  const factory TimeSlotsEntity({
    @Default("") String? date,
    @Default("") String? day_name,
    @Default([]) List<SlotsEntity?>? slots,
  }) = _TimeSlotsEntity;
  factory TimeSlotsEntity.fromJson(Map<String, dynamic> json) =>
      _$TimeSlotsEntityFromJson(json);
}
