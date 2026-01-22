import 'package:freezed_annotation/freezed_annotation.dart';
part 'search_model.freezed.dart';
part 'search_model.g.dart';

@freezed
abstract class SearchModel with _$SearchModel {
  const factory SearchModel({
    @Default("") String? token,
    @Default("") String? acceptLanguage,
    @Default("") String? query,
  }) = _SearchModel;

  factory SearchModel.fromJson(Map<String, dynamic> json) =>
      _$SearchModelFromJson(json);
}
