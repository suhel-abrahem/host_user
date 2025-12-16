// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'time_slots_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TimeSlotsEntity {

 String? get date; String? get day_name; List<SlotsEntity?>? get slots;
/// Create a copy of TimeSlotsEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TimeSlotsEntityCopyWith<TimeSlotsEntity> get copyWith => _$TimeSlotsEntityCopyWithImpl<TimeSlotsEntity>(this as TimeSlotsEntity, _$identity);

  /// Serializes this TimeSlotsEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TimeSlotsEntity&&(identical(other.date, date) || other.date == date)&&(identical(other.day_name, day_name) || other.day_name == day_name)&&const DeepCollectionEquality().equals(other.slots, slots));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date,day_name,const DeepCollectionEquality().hash(slots));

@override
String toString() {
  return 'TimeSlotsEntity(date: $date, day_name: $day_name, slots: $slots)';
}


}

/// @nodoc
abstract mixin class $TimeSlotsEntityCopyWith<$Res>  {
  factory $TimeSlotsEntityCopyWith(TimeSlotsEntity value, $Res Function(TimeSlotsEntity) _then) = _$TimeSlotsEntityCopyWithImpl;
@useResult
$Res call({
 String? date, String? day_name, List<SlotsEntity?>? slots
});




}
/// @nodoc
class _$TimeSlotsEntityCopyWithImpl<$Res>
    implements $TimeSlotsEntityCopyWith<$Res> {
  _$TimeSlotsEntityCopyWithImpl(this._self, this._then);

  final TimeSlotsEntity _self;
  final $Res Function(TimeSlotsEntity) _then;

/// Create a copy of TimeSlotsEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? date = freezed,Object? day_name = freezed,Object? slots = freezed,}) {
  return _then(_self.copyWith(
date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String?,day_name: freezed == day_name ? _self.day_name : day_name // ignore: cast_nullable_to_non_nullable
as String?,slots: freezed == slots ? _self.slots : slots // ignore: cast_nullable_to_non_nullable
as List<SlotsEntity?>?,
  ));
}

}


/// Adds pattern-matching-related methods to [TimeSlotsEntity].
extension TimeSlotsEntityPatterns on TimeSlotsEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TimeSlotsEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TimeSlotsEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TimeSlotsEntity value)  $default,){
final _that = this;
switch (_that) {
case _TimeSlotsEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TimeSlotsEntity value)?  $default,){
final _that = this;
switch (_that) {
case _TimeSlotsEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? date,  String? day_name,  List<SlotsEntity?>? slots)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TimeSlotsEntity() when $default != null:
return $default(_that.date,_that.day_name,_that.slots);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? date,  String? day_name,  List<SlotsEntity?>? slots)  $default,) {final _that = this;
switch (_that) {
case _TimeSlotsEntity():
return $default(_that.date,_that.day_name,_that.slots);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? date,  String? day_name,  List<SlotsEntity?>? slots)?  $default,) {final _that = this;
switch (_that) {
case _TimeSlotsEntity() when $default != null:
return $default(_that.date,_that.day_name,_that.slots);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TimeSlotsEntity implements TimeSlotsEntity {
  const _TimeSlotsEntity({this.date = "", this.day_name = "", final  List<SlotsEntity?>? slots = const []}): _slots = slots;
  factory _TimeSlotsEntity.fromJson(Map<String, dynamic> json) => _$TimeSlotsEntityFromJson(json);

@override@JsonKey() final  String? date;
@override@JsonKey() final  String? day_name;
 final  List<SlotsEntity?>? _slots;
@override@JsonKey() List<SlotsEntity?>? get slots {
  final value = _slots;
  if (value == null) return null;
  if (_slots is EqualUnmodifiableListView) return _slots;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of TimeSlotsEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TimeSlotsEntityCopyWith<_TimeSlotsEntity> get copyWith => __$TimeSlotsEntityCopyWithImpl<_TimeSlotsEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TimeSlotsEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TimeSlotsEntity&&(identical(other.date, date) || other.date == date)&&(identical(other.day_name, day_name) || other.day_name == day_name)&&const DeepCollectionEquality().equals(other._slots, _slots));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date,day_name,const DeepCollectionEquality().hash(_slots));

@override
String toString() {
  return 'TimeSlotsEntity(date: $date, day_name: $day_name, slots: $slots)';
}


}

/// @nodoc
abstract mixin class _$TimeSlotsEntityCopyWith<$Res> implements $TimeSlotsEntityCopyWith<$Res> {
  factory _$TimeSlotsEntityCopyWith(_TimeSlotsEntity value, $Res Function(_TimeSlotsEntity) _then) = __$TimeSlotsEntityCopyWithImpl;
@override @useResult
$Res call({
 String? date, String? day_name, List<SlotsEntity?>? slots
});




}
/// @nodoc
class __$TimeSlotsEntityCopyWithImpl<$Res>
    implements _$TimeSlotsEntityCopyWith<$Res> {
  __$TimeSlotsEntityCopyWithImpl(this._self, this._then);

  final _TimeSlotsEntity _self;
  final $Res Function(_TimeSlotsEntity) _then;

/// Create a copy of TimeSlotsEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = freezed,Object? day_name = freezed,Object? slots = freezed,}) {
  return _then(_TimeSlotsEntity(
date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String?,day_name: freezed == day_name ? _self.day_name : day_name // ignore: cast_nullable_to_non_nullable
as String?,slots: freezed == slots ? _self._slots : slots // ignore: cast_nullable_to_non_nullable
as List<SlotsEntity?>?,
  ));
}


}

// dart format on
