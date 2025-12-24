// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChatModel _$ChatModelFromJson(Map<String, dynamic> json) => _ChatModel(
  acceptLanguage: json['acceptLanguage'] as String? ?? "",
  authToken: json['authToken'] as String? ?? "",
  id: (json['id'] as num?)?.toInt() ?? 0,
  content: json['content'] as String? ?? "",
  message_type: json['message_type'] as String? ?? "",
  file: const FileJsonConverter().fromJson(json['file'] as String?),
  is_typing: json['is_typing'] as bool? ?? false,
);

Map<String, dynamic> _$ChatModelToJson(_ChatModel instance) =>
    <String, dynamic>{
      'acceptLanguage': instance.acceptLanguage,
      'authToken': instance.authToken,
      'id': instance.id,
      'content': instance.content,
      'message_type': instance.message_type,
      'file': const FileJsonConverter().toJson(instance.file),
      'is_typing': instance.is_typing,
    };
