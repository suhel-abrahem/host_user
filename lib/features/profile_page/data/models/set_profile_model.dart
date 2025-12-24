import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/resource/json_converter/file_json_converter.dart';

part 'set_profile_model.freezed.dart';
part 'set_profile_model.g.dart';

@freezed
abstract class SetProfileModel with _$SetProfileModel {
  const factory SetProfileModel({
    @Default("") String? name,
    @Default("") String? email,
    @Default("") String? phone,
    @Default("") String? dob,
    @FileJsonConverter() File? avatar,
    @Default("") String? address,
    @Default(null) int? city_id,
  }) = _SetProfileModel;
  factory SetProfileModel.fromJson(Map<String, dynamic> json) =>
      _$SetProfileModelFromJson(json);
}
