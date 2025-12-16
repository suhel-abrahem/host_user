// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'time_slots_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TimeSlotsModel {

 String? get token; String? get acceptLanguage; int? get providerServiceId;
/// Create a copy of TimeSlotsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TimeSlotsModelCopyWith<TimeSlotsModel> get copyWith => _$TimeSlotsModelCopyWithImpl<TimeSlotsModel>(this as TimeSlotsModel, _$identity);

  /// Serializes this TimeSlotsModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TimeSlotsModel&&(identical(other.token, token) || other.token == token)&&(identical(other.acceptLanguage, acceptLanguage) || other.acceptLanguage == acceptLanguage)&&(identical(other.providerServiceId, providerServiceId) || other.providerServiceId == providerServiceId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,token,acceptLanguage,providerServiceId);

@override
String toString() {
  return 'TimeSlotsModel(token: $token, acceptLanguage: $acceptLanguage, providerServiceId: $providerServiceId)';
}


}

/// @nodoc
abstract mixin class $TimeSlotsModelCopyWith<$Res>  {
  factory $TimeSlotsModelCopyWith(TimeSlotsModel value, $Res Function(TimeSlotsModel) _then) = _$TimeSlotsModelCopyWithImpl;
@useResult
$Res call({
 String? token, String? acceptLanguage, int? providerServiceId
});




}
/// @nodoc
class _$TimeSlotsModelCopyWithImpl<$Res>
    implements $TimeSlotsModelCopyWith<$Res> {
  _$TimeSlotsModelCopyWithImpl(this._self, this._then);

  final TimeSlotsModel _self;
  final $Res Function(TimeSlotsModel) _then;

/// Create a copy of TimeSlotsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? token = freezed,Object? acceptLanguage = freezed,Object? providerServiceId = freezed,}) {
  return _then(_self.copyWith(
token: freezed == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String?,acceptLanguage: freezed == acceptLanguage ? _self.acceptLanguage : acceptLanguage // ignore: cast_nullable_to_non_nullable
as String?,providerServiceId: freezed == providerServiceId ? _self.providerServiceId : providerServiceId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [TimeSlotsModel].
extension TimeSlotsModelPatterns on TimeSlotsModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TimeSlotsModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TimeSlotsModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TimeSlotsModel value)  $default,){
final _that = this;
switch (_that) {
case _TimeSlotsModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TimeSlotsModel value)?  $default,){
final _that = this;
switch (_that) {
case _TimeSlotsModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? token,  String? acceptLanguage,  int? providerServiceId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TimeSlotsModel() when $default != null:
return $default(_that.token,_that.acceptLanguage,_that.providerServiceId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? token,  String? acceptLanguage,  int? providerServiceId)  $default,) {final _that = this;
switch (_that) {
case _TimeSlotsModel():
return $default(_that.token,_that.acceptLanguage,_that.providerServiceId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? token,  String? acceptLanguage,  int? providerServiceId)?  $default,) {final _that = this;
switch (_that) {
case _TimeSlotsModel() when $default != null:
return $default(_that.token,_that.acceptLanguage,_that.providerServiceId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TimeSlotsModel implements TimeSlotsModel {
  const _TimeSlotsModel({this.token = "", this.acceptLanguage = "", this.providerServiceId = 0});
  factory _TimeSlotsModel.fromJson(Map<String, dynamic> json) => _$TimeSlotsModelFromJson(json);

@override@JsonKey() final  String? token;
@override@JsonKey() final  String? acceptLanguage;
@override@JsonKey() final  int? providerServiceId;

/// Create a copy of TimeSlotsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TimeSlotsModelCopyWith<_TimeSlotsModel> get copyWith => __$TimeSlotsModelCopyWithImpl<_TimeSlotsModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TimeSlotsModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TimeSlotsModel&&(identical(other.token, token) || other.token == token)&&(identical(other.acceptLanguage, acceptLanguage) || other.acceptLanguage == acceptLanguage)&&(identical(other.providerServiceId, providerServiceId) || other.providerServiceId == providerServiceId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,token,acceptLanguage,providerServiceId);

@override
String toString() {
  return 'TimeSlotsModel(token: $token, acceptLanguage: $acceptLanguage, providerServiceId: $providerServiceId)';
}


}

/// @nodoc
abstract mixin class _$TimeSlotsModelCopyWith<$Res> implements $TimeSlotsModelCopyWith<$Res> {
  factory _$TimeSlotsModelCopyWith(_TimeSlotsModel value, $Res Function(_TimeSlotsModel) _then) = __$TimeSlotsModelCopyWithImpl;
@override @useResult
$Res call({
 String? token, String? acceptLanguage, int? providerServiceId
});




}
/// @nodoc
class __$TimeSlotsModelCopyWithImpl<$Res>
    implements _$TimeSlotsModelCopyWith<$Res> {
  __$TimeSlotsModelCopyWithImpl(this._self, this._then);

  final _TimeSlotsModel _self;
  final $Res Function(_TimeSlotsModel) _then;

/// Create a copy of TimeSlotsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? token = freezed,Object? acceptLanguage = freezed,Object? providerServiceId = freezed,}) {
  return _then(_TimeSlotsModel(
token: freezed == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String?,acceptLanguage: freezed == acceptLanguage ? _self.acceptLanguage : acceptLanguage // ignore: cast_nullable_to_non_nullable
as String?,providerServiceId: freezed == providerServiceId ? _self.providerServiceId : providerServiceId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
