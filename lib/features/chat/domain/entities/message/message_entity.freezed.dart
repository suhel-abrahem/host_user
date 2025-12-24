// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'message_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MessageEntity {

 int? get id; int? get sender_id; String? get sender_name; String? get message_type; String? get content; bool? get is_read; String? get read_at; String? get created_at;
/// Create a copy of MessageEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MessageEntityCopyWith<MessageEntity> get copyWith => _$MessageEntityCopyWithImpl<MessageEntity>(this as MessageEntity, _$identity);

  /// Serializes this MessageEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MessageEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.sender_id, sender_id) || other.sender_id == sender_id)&&(identical(other.sender_name, sender_name) || other.sender_name == sender_name)&&(identical(other.message_type, message_type) || other.message_type == message_type)&&(identical(other.content, content) || other.content == content)&&(identical(other.is_read, is_read) || other.is_read == is_read)&&(identical(other.read_at, read_at) || other.read_at == read_at)&&(identical(other.created_at, created_at) || other.created_at == created_at));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,sender_id,sender_name,message_type,content,is_read,read_at,created_at);

@override
String toString() {
  return 'MessageEntity(id: $id, sender_id: $sender_id, sender_name: $sender_name, message_type: $message_type, content: $content, is_read: $is_read, read_at: $read_at, created_at: $created_at)';
}


}

/// @nodoc
abstract mixin class $MessageEntityCopyWith<$Res>  {
  factory $MessageEntityCopyWith(MessageEntity value, $Res Function(MessageEntity) _then) = _$MessageEntityCopyWithImpl;
@useResult
$Res call({
 int? id, int? sender_id, String? sender_name, String? message_type, String? content, bool? is_read, String? read_at, String? created_at
});




}
/// @nodoc
class _$MessageEntityCopyWithImpl<$Res>
    implements $MessageEntityCopyWith<$Res> {
  _$MessageEntityCopyWithImpl(this._self, this._then);

  final MessageEntity _self;
  final $Res Function(MessageEntity) _then;

/// Create a copy of MessageEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? sender_id = freezed,Object? sender_name = freezed,Object? message_type = freezed,Object? content = freezed,Object? is_read = freezed,Object? read_at = freezed,Object? created_at = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,sender_id: freezed == sender_id ? _self.sender_id : sender_id // ignore: cast_nullable_to_non_nullable
as int?,sender_name: freezed == sender_name ? _self.sender_name : sender_name // ignore: cast_nullable_to_non_nullable
as String?,message_type: freezed == message_type ? _self.message_type : message_type // ignore: cast_nullable_to_non_nullable
as String?,content: freezed == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String?,is_read: freezed == is_read ? _self.is_read : is_read // ignore: cast_nullable_to_non_nullable
as bool?,read_at: freezed == read_at ? _self.read_at : read_at // ignore: cast_nullable_to_non_nullable
as String?,created_at: freezed == created_at ? _self.created_at : created_at // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [MessageEntity].
extension MessageEntityPatterns on MessageEntity {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MessageEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MessageEntity() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MessageEntity value)  $default,){
final _that = this;
switch (_that) {
case _MessageEntity():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MessageEntity value)?  $default,){
final _that = this;
switch (_that) {
case _MessageEntity() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  int? sender_id,  String? sender_name,  String? message_type,  String? content,  bool? is_read,  String? read_at,  String? created_at)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MessageEntity() when $default != null:
return $default(_that.id,_that.sender_id,_that.sender_name,_that.message_type,_that.content,_that.is_read,_that.read_at,_that.created_at);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  int? sender_id,  String? sender_name,  String? message_type,  String? content,  bool? is_read,  String? read_at,  String? created_at)  $default,) {final _that = this;
switch (_that) {
case _MessageEntity():
return $default(_that.id,_that.sender_id,_that.sender_name,_that.message_type,_that.content,_that.is_read,_that.read_at,_that.created_at);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  int? sender_id,  String? sender_name,  String? message_type,  String? content,  bool? is_read,  String? read_at,  String? created_at)?  $default,) {final _that = this;
switch (_that) {
case _MessageEntity() when $default != null:
return $default(_that.id,_that.sender_id,_that.sender_name,_that.message_type,_that.content,_that.is_read,_that.read_at,_that.created_at);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MessageEntity implements MessageEntity {
  const _MessageEntity({this.id = 0, this.sender_id = 0, this.sender_name = "", this.message_type = "", this.content = "", this.is_read = false, this.read_at = "", this.created_at = ""});
  factory _MessageEntity.fromJson(Map<String, dynamic> json) => _$MessageEntityFromJson(json);

@override@JsonKey() final  int? id;
@override@JsonKey() final  int? sender_id;
@override@JsonKey() final  String? sender_name;
@override@JsonKey() final  String? message_type;
@override@JsonKey() final  String? content;
@override@JsonKey() final  bool? is_read;
@override@JsonKey() final  String? read_at;
@override@JsonKey() final  String? created_at;

/// Create a copy of MessageEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MessageEntityCopyWith<_MessageEntity> get copyWith => __$MessageEntityCopyWithImpl<_MessageEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MessageEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MessageEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.sender_id, sender_id) || other.sender_id == sender_id)&&(identical(other.sender_name, sender_name) || other.sender_name == sender_name)&&(identical(other.message_type, message_type) || other.message_type == message_type)&&(identical(other.content, content) || other.content == content)&&(identical(other.is_read, is_read) || other.is_read == is_read)&&(identical(other.read_at, read_at) || other.read_at == read_at)&&(identical(other.created_at, created_at) || other.created_at == created_at));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,sender_id,sender_name,message_type,content,is_read,read_at,created_at);

@override
String toString() {
  return 'MessageEntity(id: $id, sender_id: $sender_id, sender_name: $sender_name, message_type: $message_type, content: $content, is_read: $is_read, read_at: $read_at, created_at: $created_at)';
}


}

/// @nodoc
abstract mixin class _$MessageEntityCopyWith<$Res> implements $MessageEntityCopyWith<$Res> {
  factory _$MessageEntityCopyWith(_MessageEntity value, $Res Function(_MessageEntity) _then) = __$MessageEntityCopyWithImpl;
@override @useResult
$Res call({
 int? id, int? sender_id, String? sender_name, String? message_type, String? content, bool? is_read, String? read_at, String? created_at
});




}
/// @nodoc
class __$MessageEntityCopyWithImpl<$Res>
    implements _$MessageEntityCopyWith<$Res> {
  __$MessageEntityCopyWithImpl(this._self, this._then);

  final _MessageEntity _self;
  final $Res Function(_MessageEntity) _then;

/// Create a copy of MessageEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? sender_id = freezed,Object? sender_name = freezed,Object? message_type = freezed,Object? content = freezed,Object? is_read = freezed,Object? read_at = freezed,Object? created_at = freezed,}) {
  return _then(_MessageEntity(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,sender_id: freezed == sender_id ? _self.sender_id : sender_id // ignore: cast_nullable_to_non_nullable
as int?,sender_name: freezed == sender_name ? _self.sender_name : sender_name // ignore: cast_nullable_to_non_nullable
as String?,message_type: freezed == message_type ? _self.message_type : message_type // ignore: cast_nullable_to_non_nullable
as String?,content: freezed == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String?,is_read: freezed == is_read ? _self.is_read : is_read // ignore: cast_nullable_to_non_nullable
as bool?,read_at: freezed == read_at ? _self.read_at : read_at // ignore: cast_nullable_to_non_nullable
as String?,created_at: freezed == created_at ? _self.created_at : created_at // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
