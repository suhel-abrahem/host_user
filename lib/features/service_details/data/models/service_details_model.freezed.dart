// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'service_details_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ServiceDetailsModel {

 String? get Authorization; String? get Accept_Language; int? get service_id; int? get city_id; String? get price; bool? get distance; String? get language; String? get lat; String? get lng;
/// Create a copy of ServiceDetailsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ServiceDetailsModelCopyWith<ServiceDetailsModel> get copyWith => _$ServiceDetailsModelCopyWithImpl<ServiceDetailsModel>(this as ServiceDetailsModel, _$identity);

  /// Serializes this ServiceDetailsModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServiceDetailsModel&&(identical(other.Authorization, Authorization) || other.Authorization == Authorization)&&(identical(other.Accept_Language, Accept_Language) || other.Accept_Language == Accept_Language)&&(identical(other.service_id, service_id) || other.service_id == service_id)&&(identical(other.city_id, city_id) || other.city_id == city_id)&&(identical(other.price, price) || other.price == price)&&(identical(other.distance, distance) || other.distance == distance)&&(identical(other.language, language) || other.language == language)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,Authorization,Accept_Language,service_id,city_id,price,distance,language,lat,lng);

@override
String toString() {
  return 'ServiceDetailsModel(Authorization: $Authorization, Accept_Language: $Accept_Language, service_id: $service_id, city_id: $city_id, price: $price, distance: $distance, language: $language, lat: $lat, lng: $lng)';
}


}

/// @nodoc
abstract mixin class $ServiceDetailsModelCopyWith<$Res>  {
  factory $ServiceDetailsModelCopyWith(ServiceDetailsModel value, $Res Function(ServiceDetailsModel) _then) = _$ServiceDetailsModelCopyWithImpl;
@useResult
$Res call({
 String? Authorization, String? Accept_Language, int? service_id, int? city_id, String? price, bool? distance, String? language, String? lat, String? lng
});




}
/// @nodoc
class _$ServiceDetailsModelCopyWithImpl<$Res>
    implements $ServiceDetailsModelCopyWith<$Res> {
  _$ServiceDetailsModelCopyWithImpl(this._self, this._then);

  final ServiceDetailsModel _self;
  final $Res Function(ServiceDetailsModel) _then;

/// Create a copy of ServiceDetailsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? Authorization = freezed,Object? Accept_Language = freezed,Object? service_id = freezed,Object? city_id = freezed,Object? price = freezed,Object? distance = freezed,Object? language = freezed,Object? lat = freezed,Object? lng = freezed,}) {
  return _then(_self.copyWith(
Authorization: freezed == Authorization ? _self.Authorization : Authorization // ignore: cast_nullable_to_non_nullable
as String?,Accept_Language: freezed == Accept_Language ? _self.Accept_Language : Accept_Language // ignore: cast_nullable_to_non_nullable
as String?,service_id: freezed == service_id ? _self.service_id : service_id // ignore: cast_nullable_to_non_nullable
as int?,city_id: freezed == city_id ? _self.city_id : city_id // ignore: cast_nullable_to_non_nullable
as int?,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as String?,distance: freezed == distance ? _self.distance : distance // ignore: cast_nullable_to_non_nullable
as bool?,language: freezed == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String?,lat: freezed == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as String?,lng: freezed == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ServiceDetailsModel].
extension ServiceDetailsModelPatterns on ServiceDetailsModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ServiceDetailsModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ServiceDetailsModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ServiceDetailsModel value)  $default,){
final _that = this;
switch (_that) {
case _ServiceDetailsModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ServiceDetailsModel value)?  $default,){
final _that = this;
switch (_that) {
case _ServiceDetailsModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? Authorization,  String? Accept_Language,  int? service_id,  int? city_id,  String? price,  bool? distance,  String? language,  String? lat,  String? lng)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ServiceDetailsModel() when $default != null:
return $default(_that.Authorization,_that.Accept_Language,_that.service_id,_that.city_id,_that.price,_that.distance,_that.language,_that.lat,_that.lng);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? Authorization,  String? Accept_Language,  int? service_id,  int? city_id,  String? price,  bool? distance,  String? language,  String? lat,  String? lng)  $default,) {final _that = this;
switch (_that) {
case _ServiceDetailsModel():
return $default(_that.Authorization,_that.Accept_Language,_that.service_id,_that.city_id,_that.price,_that.distance,_that.language,_that.lat,_that.lng);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? Authorization,  String? Accept_Language,  int? service_id,  int? city_id,  String? price,  bool? distance,  String? language,  String? lat,  String? lng)?  $default,) {final _that = this;
switch (_that) {
case _ServiceDetailsModel() when $default != null:
return $default(_that.Authorization,_that.Accept_Language,_that.service_id,_that.city_id,_that.price,_that.distance,_that.language,_that.lat,_that.lng);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ServiceDetailsModel implements ServiceDetailsModel {
  const _ServiceDetailsModel({this.Authorization = "", this.Accept_Language = "", this.service_id = 0, this.city_id = 0, this.price = "none", this.distance = false, this.language = "none", this.lat = "none", this.lng = "none"});
  factory _ServiceDetailsModel.fromJson(Map<String, dynamic> json) => _$ServiceDetailsModelFromJson(json);

@override@JsonKey() final  String? Authorization;
@override@JsonKey() final  String? Accept_Language;
@override@JsonKey() final  int? service_id;
@override@JsonKey() final  int? city_id;
@override@JsonKey() final  String? price;
@override@JsonKey() final  bool? distance;
@override@JsonKey() final  String? language;
@override@JsonKey() final  String? lat;
@override@JsonKey() final  String? lng;

/// Create a copy of ServiceDetailsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ServiceDetailsModelCopyWith<_ServiceDetailsModel> get copyWith => __$ServiceDetailsModelCopyWithImpl<_ServiceDetailsModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ServiceDetailsModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ServiceDetailsModel&&(identical(other.Authorization, Authorization) || other.Authorization == Authorization)&&(identical(other.Accept_Language, Accept_Language) || other.Accept_Language == Accept_Language)&&(identical(other.service_id, service_id) || other.service_id == service_id)&&(identical(other.city_id, city_id) || other.city_id == city_id)&&(identical(other.price, price) || other.price == price)&&(identical(other.distance, distance) || other.distance == distance)&&(identical(other.language, language) || other.language == language)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,Authorization,Accept_Language,service_id,city_id,price,distance,language,lat,lng);

@override
String toString() {
  return 'ServiceDetailsModel(Authorization: $Authorization, Accept_Language: $Accept_Language, service_id: $service_id, city_id: $city_id, price: $price, distance: $distance, language: $language, lat: $lat, lng: $lng)';
}


}

/// @nodoc
abstract mixin class _$ServiceDetailsModelCopyWith<$Res> implements $ServiceDetailsModelCopyWith<$Res> {
  factory _$ServiceDetailsModelCopyWith(_ServiceDetailsModel value, $Res Function(_ServiceDetailsModel) _then) = __$ServiceDetailsModelCopyWithImpl;
@override @useResult
$Res call({
 String? Authorization, String? Accept_Language, int? service_id, int? city_id, String? price, bool? distance, String? language, String? lat, String? lng
});




}
/// @nodoc
class __$ServiceDetailsModelCopyWithImpl<$Res>
    implements _$ServiceDetailsModelCopyWith<$Res> {
  __$ServiceDetailsModelCopyWithImpl(this._self, this._then);

  final _ServiceDetailsModel _self;
  final $Res Function(_ServiceDetailsModel) _then;

/// Create a copy of ServiceDetailsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? Authorization = freezed,Object? Accept_Language = freezed,Object? service_id = freezed,Object? city_id = freezed,Object? price = freezed,Object? distance = freezed,Object? language = freezed,Object? lat = freezed,Object? lng = freezed,}) {
  return _then(_ServiceDetailsModel(
Authorization: freezed == Authorization ? _self.Authorization : Authorization // ignore: cast_nullable_to_non_nullable
as String?,Accept_Language: freezed == Accept_Language ? _self.Accept_Language : Accept_Language // ignore: cast_nullable_to_non_nullable
as String?,service_id: freezed == service_id ? _self.service_id : service_id // ignore: cast_nullable_to_non_nullable
as int?,city_id: freezed == city_id ? _self.city_id : city_id // ignore: cast_nullable_to_non_nullable
as int?,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as String?,distance: freezed == distance ? _self.distance : distance // ignore: cast_nullable_to_non_nullable
as bool?,language: freezed == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String?,lat: freezed == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as String?,lng: freezed == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
