// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rate_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RateEntity {

 String? get message; Map<String, dynamic>? get data;
/// Create a copy of RateEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RateEntityCopyWith<RateEntity> get copyWith => _$RateEntityCopyWithImpl<RateEntity>(this as RateEntity, _$identity);

  /// Serializes this RateEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RateEntity&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,message,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'RateEntity(message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class $RateEntityCopyWith<$Res>  {
  factory $RateEntityCopyWith(RateEntity value, $Res Function(RateEntity) _then) = _$RateEntityCopyWithImpl;
@useResult
$Res call({
 String? message, Map<String, dynamic>? data
});




}
/// @nodoc
class _$RateEntityCopyWithImpl<$Res>
    implements $RateEntityCopyWith<$Res> {
  _$RateEntityCopyWithImpl(this._self, this._then);

  final RateEntity _self;
  final $Res Function(RateEntity) _then;

/// Create a copy of RateEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? message = freezed,Object? data = freezed,}) {
  return _then(_self.copyWith(
message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}

}


/// Adds pattern-matching-related methods to [RateEntity].
extension RateEntityPatterns on RateEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RateEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RateEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RateEntity value)  $default,){
final _that = this;
switch (_that) {
case _RateEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RateEntity value)?  $default,){
final _that = this;
switch (_that) {
case _RateEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? message,  Map<String, dynamic>? data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RateEntity() when $default != null:
return $default(_that.message,_that.data);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? message,  Map<String, dynamic>? data)  $default,) {final _that = this;
switch (_that) {
case _RateEntity():
return $default(_that.message,_that.data);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? message,  Map<String, dynamic>? data)?  $default,) {final _that = this;
switch (_that) {
case _RateEntity() when $default != null:
return $default(_that.message,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RateEntity implements RateEntity {
  const _RateEntity({this.message = "", final  Map<String, dynamic>? data = const {}}): _data = data;
  factory _RateEntity.fromJson(Map<String, dynamic> json) => _$RateEntityFromJson(json);

@override@JsonKey() final  String? message;
 final  Map<String, dynamic>? _data;
@override@JsonKey() Map<String, dynamic>? get data {
  final value = _data;
  if (value == null) return null;
  if (_data is EqualUnmodifiableMapView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of RateEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RateEntityCopyWith<_RateEntity> get copyWith => __$RateEntityCopyWithImpl<_RateEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RateEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RateEntity&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other._data, _data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,message,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'RateEntity(message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class _$RateEntityCopyWith<$Res> implements $RateEntityCopyWith<$Res> {
  factory _$RateEntityCopyWith(_RateEntity value, $Res Function(_RateEntity) _then) = __$RateEntityCopyWithImpl;
@override @useResult
$Res call({
 String? message, Map<String, dynamic>? data
});




}
/// @nodoc
class __$RateEntityCopyWithImpl<$Res>
    implements _$RateEntityCopyWith<$Res> {
  __$RateEntityCopyWithImpl(this._self, this._then);

  final _RateEntity _self;
  final $Res Function(_RateEntity) _then;

/// Create a copy of RateEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = freezed,Object? data = freezed,}) {
  return _then(_RateEntity(
message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}


}

// dart format on
