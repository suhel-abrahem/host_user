import 'package:freezed_annotation/freezed_annotation.dart';
part 'rate_model.freezed.dart';
part 'rate_model.g.dart';

@freezed
abstract class RateModel with _$RateModel {
  const factory RateModel({
    @Default(0) int? bookingId,
    @Default(0) int? rating,
    @Default("") String? comment,
    @Default("") String? token,
  }) = _RateModel;
  factory RateModel.fromJson(Map<String, dynamic> json) =>
      _$RateModelFromJson(json);
}
