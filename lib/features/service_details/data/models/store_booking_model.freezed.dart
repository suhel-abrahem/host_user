// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'store_booking_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StoreBookingModel {

 String? get acceptLanguage; String? get authToken; int? get serviceId; int? get providerId; String? get notes;@FileListJsonConverter() List<File?>? get attachments; String? get scheduledAt;
/// Create a copy of StoreBookingModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StoreBookingModelCopyWith<StoreBookingModel> get copyWith => _$StoreBookingModelCopyWithImpl<StoreBookingModel>(this as StoreBookingModel, _$identity);

  /// Serializes this StoreBookingModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StoreBookingModel&&(identical(other.acceptLanguage, acceptLanguage) || other.acceptLanguage == acceptLanguage)&&(identical(other.authToken, authToken) || other.authToken == authToken)&&(identical(other.serviceId, serviceId) || other.serviceId == serviceId)&&(identical(other.providerId, providerId) || other.providerId == providerId)&&(identical(other.notes, notes) || other.notes == notes)&&const DeepCollectionEquality().equals(other.attachments, attachments)&&(identical(other.scheduledAt, scheduledAt) || other.scheduledAt == scheduledAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,acceptLanguage,authToken,serviceId,providerId,notes,const DeepCollectionEquality().hash(attachments),scheduledAt);

@override
String toString() {
  return 'StoreBookingModel(acceptLanguage: $acceptLanguage, authToken: $authToken, serviceId: $serviceId, providerId: $providerId, notes: $notes, attachments: $attachments, scheduledAt: $scheduledAt)';
}


}

/// @nodoc
abstract mixin class $StoreBookingModelCopyWith<$Res>  {
  factory $StoreBookingModelCopyWith(StoreBookingModel value, $Res Function(StoreBookingModel) _then) = _$StoreBookingModelCopyWithImpl;
@useResult
$Res call({
 String? acceptLanguage, String? authToken, int? serviceId, int? providerId, String? notes,@FileListJsonConverter() List<File?>? attachments, String? scheduledAt
});




}
/// @nodoc
class _$StoreBookingModelCopyWithImpl<$Res>
    implements $StoreBookingModelCopyWith<$Res> {
  _$StoreBookingModelCopyWithImpl(this._self, this._then);

  final StoreBookingModel _self;
  final $Res Function(StoreBookingModel) _then;

/// Create a copy of StoreBookingModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? acceptLanguage = freezed,Object? authToken = freezed,Object? serviceId = freezed,Object? providerId = freezed,Object? notes = freezed,Object? attachments = freezed,Object? scheduledAt = freezed,}) {
  return _then(_self.copyWith(
acceptLanguage: freezed == acceptLanguage ? _self.acceptLanguage : acceptLanguage // ignore: cast_nullable_to_non_nullable
as String?,authToken: freezed == authToken ? _self.authToken : authToken // ignore: cast_nullable_to_non_nullable
as String?,serviceId: freezed == serviceId ? _self.serviceId : serviceId // ignore: cast_nullable_to_non_nullable
as int?,providerId: freezed == providerId ? _self.providerId : providerId // ignore: cast_nullable_to_non_nullable
as int?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,attachments: freezed == attachments ? _self.attachments : attachments // ignore: cast_nullable_to_non_nullable
as List<File?>?,scheduledAt: freezed == scheduledAt ? _self.scheduledAt : scheduledAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [StoreBookingModel].
extension StoreBookingModelPatterns on StoreBookingModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StoreBookingModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StoreBookingModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StoreBookingModel value)  $default,){
final _that = this;
switch (_that) {
case _StoreBookingModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StoreBookingModel value)?  $default,){
final _that = this;
switch (_that) {
case _StoreBookingModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? acceptLanguage,  String? authToken,  int? serviceId,  int? providerId,  String? notes, @FileListJsonConverter()  List<File?>? attachments,  String? scheduledAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StoreBookingModel() when $default != null:
return $default(_that.acceptLanguage,_that.authToken,_that.serviceId,_that.providerId,_that.notes,_that.attachments,_that.scheduledAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? acceptLanguage,  String? authToken,  int? serviceId,  int? providerId,  String? notes, @FileListJsonConverter()  List<File?>? attachments,  String? scheduledAt)  $default,) {final _that = this;
switch (_that) {
case _StoreBookingModel():
return $default(_that.acceptLanguage,_that.authToken,_that.serviceId,_that.providerId,_that.notes,_that.attachments,_that.scheduledAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? acceptLanguage,  String? authToken,  int? serviceId,  int? providerId,  String? notes, @FileListJsonConverter()  List<File?>? attachments,  String? scheduledAt)?  $default,) {final _that = this;
switch (_that) {
case _StoreBookingModel() when $default != null:
return $default(_that.acceptLanguage,_that.authToken,_that.serviceId,_that.providerId,_that.notes,_that.attachments,_that.scheduledAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StoreBookingModel implements StoreBookingModel {
  const _StoreBookingModel({this.acceptLanguage = "ar", this.authToken = "", this.serviceId = 0, this.providerId = 0, this.notes = '', @FileListJsonConverter() final  List<File?>? attachments, this.scheduledAt = ''}): _attachments = attachments;
  factory _StoreBookingModel.fromJson(Map<String, dynamic> json) => _$StoreBookingModelFromJson(json);

@override@JsonKey() final  String? acceptLanguage;
@override@JsonKey() final  String? authToken;
@override@JsonKey() final  int? serviceId;
@override@JsonKey() final  int? providerId;
@override@JsonKey() final  String? notes;
 final  List<File?>? _attachments;
@override@FileListJsonConverter() List<File?>? get attachments {
  final value = _attachments;
  if (value == null) return null;
  if (_attachments is EqualUnmodifiableListView) return _attachments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey() final  String? scheduledAt;

/// Create a copy of StoreBookingModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StoreBookingModelCopyWith<_StoreBookingModel> get copyWith => __$StoreBookingModelCopyWithImpl<_StoreBookingModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StoreBookingModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StoreBookingModel&&(identical(other.acceptLanguage, acceptLanguage) || other.acceptLanguage == acceptLanguage)&&(identical(other.authToken, authToken) || other.authToken == authToken)&&(identical(other.serviceId, serviceId) || other.serviceId == serviceId)&&(identical(other.providerId, providerId) || other.providerId == providerId)&&(identical(other.notes, notes) || other.notes == notes)&&const DeepCollectionEquality().equals(other._attachments, _attachments)&&(identical(other.scheduledAt, scheduledAt) || other.scheduledAt == scheduledAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,acceptLanguage,authToken,serviceId,providerId,notes,const DeepCollectionEquality().hash(_attachments),scheduledAt);

@override
String toString() {
  return 'StoreBookingModel(acceptLanguage: $acceptLanguage, authToken: $authToken, serviceId: $serviceId, providerId: $providerId, notes: $notes, attachments: $attachments, scheduledAt: $scheduledAt)';
}


}

/// @nodoc
abstract mixin class _$StoreBookingModelCopyWith<$Res> implements $StoreBookingModelCopyWith<$Res> {
  factory _$StoreBookingModelCopyWith(_StoreBookingModel value, $Res Function(_StoreBookingModel) _then) = __$StoreBookingModelCopyWithImpl;
@override @useResult
$Res call({
 String? acceptLanguage, String? authToken, int? serviceId, int? providerId, String? notes,@FileListJsonConverter() List<File?>? attachments, String? scheduledAt
});




}
/// @nodoc
class __$StoreBookingModelCopyWithImpl<$Res>
    implements _$StoreBookingModelCopyWith<$Res> {
  __$StoreBookingModelCopyWithImpl(this._self, this._then);

  final _StoreBookingModel _self;
  final $Res Function(_StoreBookingModel) _then;

/// Create a copy of StoreBookingModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? acceptLanguage = freezed,Object? authToken = freezed,Object? serviceId = freezed,Object? providerId = freezed,Object? notes = freezed,Object? attachments = freezed,Object? scheduledAt = freezed,}) {
  return _then(_StoreBookingModel(
acceptLanguage: freezed == acceptLanguage ? _self.acceptLanguage : acceptLanguage // ignore: cast_nullable_to_non_nullable
as String?,authToken: freezed == authToken ? _self.authToken : authToken // ignore: cast_nullable_to_non_nullable
as String?,serviceId: freezed == serviceId ? _self.serviceId : serviceId // ignore: cast_nullable_to_non_nullable
as int?,providerId: freezed == providerId ? _self.providerId : providerId // ignore: cast_nullable_to_non_nullable
as int?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,attachments: freezed == attachments ? _self._attachments : attachments // ignore: cast_nullable_to_non_nullable
as List<File?>?,scheduledAt: freezed == scheduledAt ? _self.scheduledAt : scheduledAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
