// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rate_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RateModel {

 int? get bookingId; int? get rating; String? get comment; String? get token;
/// Create a copy of RateModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RateModelCopyWith<RateModel> get copyWith => _$RateModelCopyWithImpl<RateModel>(this as RateModel, _$identity);

  /// Serializes this RateModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RateModel&&(identical(other.bookingId, bookingId) || other.bookingId == bookingId)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.comment, comment) || other.comment == comment)&&(identical(other.token, token) || other.token == token));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,bookingId,rating,comment,token);

@override
String toString() {
  return 'RateModel(bookingId: $bookingId, rating: $rating, comment: $comment, token: $token)';
}


}

/// @nodoc
abstract mixin class $RateModelCopyWith<$Res>  {
  factory $RateModelCopyWith(RateModel value, $Res Function(RateModel) _then) = _$RateModelCopyWithImpl;
@useResult
$Res call({
 int? bookingId, int? rating, String? comment, String? token
});




}
/// @nodoc
class _$RateModelCopyWithImpl<$Res>
    implements $RateModelCopyWith<$Res> {
  _$RateModelCopyWithImpl(this._self, this._then);

  final RateModel _self;
  final $Res Function(RateModel) _then;

/// Create a copy of RateModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? bookingId = freezed,Object? rating = freezed,Object? comment = freezed,Object? token = freezed,}) {
  return _then(_self.copyWith(
bookingId: freezed == bookingId ? _self.bookingId : bookingId // ignore: cast_nullable_to_non_nullable
as int?,rating: freezed == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as int?,comment: freezed == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String?,token: freezed == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [RateModel].
extension RateModelPatterns on RateModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RateModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RateModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RateModel value)  $default,){
final _that = this;
switch (_that) {
case _RateModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RateModel value)?  $default,){
final _that = this;
switch (_that) {
case _RateModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? bookingId,  int? rating,  String? comment,  String? token)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RateModel() when $default != null:
return $default(_that.bookingId,_that.rating,_that.comment,_that.token);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? bookingId,  int? rating,  String? comment,  String? token)  $default,) {final _that = this;
switch (_that) {
case _RateModel():
return $default(_that.bookingId,_that.rating,_that.comment,_that.token);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? bookingId,  int? rating,  String? comment,  String? token)?  $default,) {final _that = this;
switch (_that) {
case _RateModel() when $default != null:
return $default(_that.bookingId,_that.rating,_that.comment,_that.token);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RateModel implements RateModel {
  const _RateModel({this.bookingId = 0, this.rating = 0, this.comment = "", this.token = ""});
  factory _RateModel.fromJson(Map<String, dynamic> json) => _$RateModelFromJson(json);

@override@JsonKey() final  int? bookingId;
@override@JsonKey() final  int? rating;
@override@JsonKey() final  String? comment;
@override@JsonKey() final  String? token;

/// Create a copy of RateModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RateModelCopyWith<_RateModel> get copyWith => __$RateModelCopyWithImpl<_RateModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RateModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RateModel&&(identical(other.bookingId, bookingId) || other.bookingId == bookingId)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.comment, comment) || other.comment == comment)&&(identical(other.token, token) || other.token == token));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,bookingId,rating,comment,token);

@override
String toString() {
  return 'RateModel(bookingId: $bookingId, rating: $rating, comment: $comment, token: $token)';
}


}

/// @nodoc
abstract mixin class _$RateModelCopyWith<$Res> implements $RateModelCopyWith<$Res> {
  factory _$RateModelCopyWith(_RateModel value, $Res Function(_RateModel) _then) = __$RateModelCopyWithImpl;
@override @useResult
$Res call({
 int? bookingId, int? rating, String? comment, String? token
});




}
/// @nodoc
class __$RateModelCopyWithImpl<$Res>
    implements _$RateModelCopyWith<$Res> {
  __$RateModelCopyWithImpl(this._self, this._then);

  final _RateModel _self;
  final $Res Function(_RateModel) _then;

/// Create a copy of RateModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? bookingId = freezed,Object? rating = freezed,Object? comment = freezed,Object? token = freezed,}) {
  return _then(_RateModel(
bookingId: freezed == bookingId ? _self.bookingId : bookingId // ignore: cast_nullable_to_non_nullable
as int?,rating: freezed == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as int?,comment: freezed == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String?,token: freezed == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
