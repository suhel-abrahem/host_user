// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'slots_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SlotsEntity {

 String? get start_time; String? get end_time; String? get datetime; bool? get is_available;
/// Create a copy of SlotsEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SlotsEntityCopyWith<SlotsEntity> get copyWith => _$SlotsEntityCopyWithImpl<SlotsEntity>(this as SlotsEntity, _$identity);

  /// Serializes this SlotsEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SlotsEntity&&(identical(other.start_time, start_time) || other.start_time == start_time)&&(identical(other.end_time, end_time) || other.end_time == end_time)&&(identical(other.datetime, datetime) || other.datetime == datetime)&&(identical(other.is_available, is_available) || other.is_available == is_available));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,start_time,end_time,datetime,is_available);

@override
String toString() {
  return 'SlotsEntity(start_time: $start_time, end_time: $end_time, datetime: $datetime, is_available: $is_available)';
}


}

/// @nodoc
abstract mixin class $SlotsEntityCopyWith<$Res>  {
  factory $SlotsEntityCopyWith(SlotsEntity value, $Res Function(SlotsEntity) _then) = _$SlotsEntityCopyWithImpl;
@useResult
$Res call({
 String? start_time, String? end_time, String? datetime, bool? is_available
});




}
/// @nodoc
class _$SlotsEntityCopyWithImpl<$Res>
    implements $SlotsEntityCopyWith<$Res> {
  _$SlotsEntityCopyWithImpl(this._self, this._then);

  final SlotsEntity _self;
  final $Res Function(SlotsEntity) _then;

/// Create a copy of SlotsEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? start_time = freezed,Object? end_time = freezed,Object? datetime = freezed,Object? is_available = freezed,}) {
  return _then(_self.copyWith(
start_time: freezed == start_time ? _self.start_time : start_time // ignore: cast_nullable_to_non_nullable
as String?,end_time: freezed == end_time ? _self.end_time : end_time // ignore: cast_nullable_to_non_nullable
as String?,datetime: freezed == datetime ? _self.datetime : datetime // ignore: cast_nullable_to_non_nullable
as String?,is_available: freezed == is_available ? _self.is_available : is_available // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [SlotsEntity].
extension SlotsEntityPatterns on SlotsEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SlotsEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SlotsEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SlotsEntity value)  $default,){
final _that = this;
switch (_that) {
case _SlotsEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SlotsEntity value)?  $default,){
final _that = this;
switch (_that) {
case _SlotsEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? start_time,  String? end_time,  String? datetime,  bool? is_available)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SlotsEntity() when $default != null:
return $default(_that.start_time,_that.end_time,_that.datetime,_that.is_available);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? start_time,  String? end_time,  String? datetime,  bool? is_available)  $default,) {final _that = this;
switch (_that) {
case _SlotsEntity():
return $default(_that.start_time,_that.end_time,_that.datetime,_that.is_available);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? start_time,  String? end_time,  String? datetime,  bool? is_available)?  $default,) {final _that = this;
switch (_that) {
case _SlotsEntity() when $default != null:
return $default(_that.start_time,_that.end_time,_that.datetime,_that.is_available);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SlotsEntity implements SlotsEntity {
  const _SlotsEntity({this.start_time = "", this.end_time = "", this.datetime = "", this.is_available = false});
  factory _SlotsEntity.fromJson(Map<String, dynamic> json) => _$SlotsEntityFromJson(json);

@override@JsonKey() final  String? start_time;
@override@JsonKey() final  String? end_time;
@override@JsonKey() final  String? datetime;
@override@JsonKey() final  bool? is_available;

/// Create a copy of SlotsEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SlotsEntityCopyWith<_SlotsEntity> get copyWith => __$SlotsEntityCopyWithImpl<_SlotsEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SlotsEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SlotsEntity&&(identical(other.start_time, start_time) || other.start_time == start_time)&&(identical(other.end_time, end_time) || other.end_time == end_time)&&(identical(other.datetime, datetime) || other.datetime == datetime)&&(identical(other.is_available, is_available) || other.is_available == is_available));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,start_time,end_time,datetime,is_available);

@override
String toString() {
  return 'SlotsEntity(start_time: $start_time, end_time: $end_time, datetime: $datetime, is_available: $is_available)';
}


}

/// @nodoc
abstract mixin class _$SlotsEntityCopyWith<$Res> implements $SlotsEntityCopyWith<$Res> {
  factory _$SlotsEntityCopyWith(_SlotsEntity value, $Res Function(_SlotsEntity) _then) = __$SlotsEntityCopyWithImpl;
@override @useResult
$Res call({
 String? start_time, String? end_time, String? datetime, bool? is_available
});




}
/// @nodoc
class __$SlotsEntityCopyWithImpl<$Res>
    implements _$SlotsEntityCopyWith<$Res> {
  __$SlotsEntityCopyWithImpl(this._self, this._then);

  final _SlotsEntity _self;
  final $Res Function(_SlotsEntity) _then;

/// Create a copy of SlotsEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? start_time = freezed,Object? end_time = freezed,Object? datetime = freezed,Object? is_available = freezed,}) {
  return _then(_SlotsEntity(
start_time: freezed == start_time ? _self.start_time : start_time // ignore: cast_nullable_to_non_nullable
as String?,end_time: freezed == end_time ? _self.end_time : end_time // ignore: cast_nullable_to_non_nullable
as String?,datetime: freezed == datetime ? _self.datetime : datetime // ignore: cast_nullable_to_non_nullable
as String?,is_available: freezed == is_available ? _self.is_available : is_available // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

// dart format on
