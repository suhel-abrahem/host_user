import 'dart:io';
import 'package:freezed_annotation/freezed_annotation.dart';

class ImagesJsonConverter
    implements JsonConverter<List<File?>?, List<String?>?> {
  const ImagesJsonConverter();

  @override
  List<File?>? fromJson(List<String?>? json) =>
      json?.map((e) => e == null ? null : File(e)).toList();

  @override
  List<String?>? toJson(List<File?>? object) =>
      object?.map((e) => e?.path).toList();
}
