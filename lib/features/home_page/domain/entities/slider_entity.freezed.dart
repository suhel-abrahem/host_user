// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'slider_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SliderEntity {

 int? get id; String? get image; int? get order; bool? get isActive; String? get created_at; String? get updated_at;
/// Create a copy of SliderEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SliderEntityCopyWith<SliderEntity> get copyWith => _$SliderEntityCopyWithImpl<SliderEntity>(this as SliderEntity, _$identity);

  /// Serializes this SliderEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SliderEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.image, image) || other.image == image)&&(identical(other.order, order) || other.order == order)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.created_at, created_at) || other.created_at == created_at)&&(identical(other.updated_at, updated_at) || other.updated_at == updated_at));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,image,order,isActive,created_at,updated_at);

@override
String toString() {
  return 'SliderEntity(id: $id, image: $image, order: $order, isActive: $isActive, created_at: $created_at, updated_at: $updated_at)';
}


}

/// @nodoc
abstract mixin class $SliderEntityCopyWith<$Res>  {
  factory $SliderEntityCopyWith(SliderEntity value, $Res Function(SliderEntity) _then) = _$SliderEntityCopyWithImpl;
@useResult
$Res call({
 int? id, String? image, int? order, bool? isActive, String? created_at, String? updated_at
});




}
/// @nodoc
class _$SliderEntityCopyWithImpl<$Res>
    implements $SliderEntityCopyWith<$Res> {
  _$SliderEntityCopyWithImpl(this._self, this._then);

  final SliderEntity _self;
  final $Res Function(SliderEntity) _then;

/// Create a copy of SliderEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? image = freezed,Object? order = freezed,Object? isActive = freezed,Object? created_at = freezed,Object? updated_at = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,order: freezed == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int?,isActive: freezed == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool?,created_at: freezed == created_at ? _self.created_at : created_at // ignore: cast_nullable_to_non_nullable
as String?,updated_at: freezed == updated_at ? _self.updated_at : updated_at // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SliderEntity].
extension SliderEntityPatterns on SliderEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SliderEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SliderEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SliderEntity value)  $default,){
final _that = this;
switch (_that) {
case _SliderEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SliderEntity value)?  $default,){
final _that = this;
switch (_that) {
case _SliderEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String? image,  int? order,  bool? isActive,  String? created_at,  String? updated_at)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SliderEntity() when $default != null:
return $default(_that.id,_that.image,_that.order,_that.isActive,_that.created_at,_that.updated_at);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String? image,  int? order,  bool? isActive,  String? created_at,  String? updated_at)  $default,) {final _that = this;
switch (_that) {
case _SliderEntity():
return $default(_that.id,_that.image,_that.order,_that.isActive,_that.created_at,_that.updated_at);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String? image,  int? order,  bool? isActive,  String? created_at,  String? updated_at)?  $default,) {final _that = this;
switch (_that) {
case _SliderEntity() when $default != null:
return $default(_that.id,_that.image,_that.order,_that.isActive,_that.created_at,_that.updated_at);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SliderEntity implements SliderEntity {
  const _SliderEntity({this.id = 0, this.image = "", this.order = 0, this.isActive = false, this.created_at = "", this.updated_at = ""});
  factory _SliderEntity.fromJson(Map<String, dynamic> json) => _$SliderEntityFromJson(json);

@override@JsonKey() final  int? id;
@override@JsonKey() final  String? image;
@override@JsonKey() final  int? order;
@override@JsonKey() final  bool? isActive;
@override@JsonKey() final  String? created_at;
@override@JsonKey() final  String? updated_at;

/// Create a copy of SliderEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SliderEntityCopyWith<_SliderEntity> get copyWith => __$SliderEntityCopyWithImpl<_SliderEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SliderEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SliderEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.image, image) || other.image == image)&&(identical(other.order, order) || other.order == order)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.created_at, created_at) || other.created_at == created_at)&&(identical(other.updated_at, updated_at) || other.updated_at == updated_at));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,image,order,isActive,created_at,updated_at);

@override
String toString() {
  return 'SliderEntity(id: $id, image: $image, order: $order, isActive: $isActive, created_at: $created_at, updated_at: $updated_at)';
}


}

/// @nodoc
abstract mixin class _$SliderEntityCopyWith<$Res> implements $SliderEntityCopyWith<$Res> {
  factory _$SliderEntityCopyWith(_SliderEntity value, $Res Function(_SliderEntity) _then) = __$SliderEntityCopyWithImpl;
@override @useResult
$Res call({
 int? id, String? image, int? order, bool? isActive, String? created_at, String? updated_at
});




}
/// @nodoc
class __$SliderEntityCopyWithImpl<$Res>
    implements _$SliderEntityCopyWith<$Res> {
  __$SliderEntityCopyWithImpl(this._self, this._then);

  final _SliderEntity _self;
  final $Res Function(_SliderEntity) _then;

/// Create a copy of SliderEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? image = freezed,Object? order = freezed,Object? isActive = freezed,Object? created_at = freezed,Object? updated_at = freezed,}) {
  return _then(_SliderEntity(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,order: freezed == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int?,isActive: freezed == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool?,created_at: freezed == created_at ? _self.created_at : created_at // ignore: cast_nullable_to_non_nullable
as String?,updated_at: freezed == updated_at ? _self.updated_at : updated_at // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
