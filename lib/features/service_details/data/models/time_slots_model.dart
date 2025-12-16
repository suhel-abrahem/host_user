import "package:freezed_annotation/freezed_annotation.dart";

part "time_slots_model.freezed.dart";
part "time_slots_model.g.dart";

@freezed
abstract class TimeSlotsModel with _$TimeSlotsModel {
  const factory TimeSlotsModel({
    @Default("") String? token,
    @Default("") String? acceptLanguage,
    @Default(0) int? providerServiceId,
  }) = _TimeSlotsModel;

  factory TimeSlotsModel.fromJson(Map<String, dynamic> json) =>
      _$TimeSlotsModelFromJson(json);
}
