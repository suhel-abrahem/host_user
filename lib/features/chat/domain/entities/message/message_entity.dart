// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';
part 'message_entity.freezed.dart';
part 'message_entity.g.dart';

@freezed
abstract class MessageEntity with _$MessageEntity {
  const factory MessageEntity({
    @Default(0) int? id,
    @Default(0) int? sender_id,
    @Default("") String? sender_name,
    @Default("") String? message_type,
    @Default("") String? content,
    @Default(false) bool? is_read,
    @Default("") String? read_at,
    @Default("") String? created_at,
  }) = _MessageEntity;

  factory MessageEntity.fromJson(Map<String, dynamic> json) =>
      _$MessageEntityFromJson(json);
}
