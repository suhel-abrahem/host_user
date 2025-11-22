// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'service_details_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ServiceDetailsEntity {

 Map<String, dynamic>? get provider_service; Map<String, dynamic>? get service; Map<String, dynamic>? get provider;
/// Create a copy of ServiceDetailsEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ServiceDetailsEntityCopyWith<ServiceDetailsEntity> get copyWith => _$ServiceDetailsEntityCopyWithImpl<ServiceDetailsEntity>(this as ServiceDetailsEntity, _$identity);

  /// Serializes this ServiceDetailsEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServiceDetailsEntity&&const DeepCollectionEquality().equals(other.provider_service, provider_service)&&const DeepCollectionEquality().equals(other.service, service)&&const DeepCollectionEquality().equals(other.provider, provider));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(provider_service),const DeepCollectionEquality().hash(service),const DeepCollectionEquality().hash(provider));

@override
String toString() {
  return 'ServiceDetailsEntity(provider_service: $provider_service, service: $service, provider: $provider)';
}


}

/// @nodoc
abstract mixin class $ServiceDetailsEntityCopyWith<$Res>  {
  factory $ServiceDetailsEntityCopyWith(ServiceDetailsEntity value, $Res Function(ServiceDetailsEntity) _then) = _$ServiceDetailsEntityCopyWithImpl;
@useResult
$Res call({
 Map<String, dynamic>? provider_service, Map<String, dynamic>? service, Map<String, dynamic>? provider
});




}
/// @nodoc
class _$ServiceDetailsEntityCopyWithImpl<$Res>
    implements $ServiceDetailsEntityCopyWith<$Res> {
  _$ServiceDetailsEntityCopyWithImpl(this._self, this._then);

  final ServiceDetailsEntity _self;
  final $Res Function(ServiceDetailsEntity) _then;

/// Create a copy of ServiceDetailsEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? provider_service = freezed,Object? service = freezed,Object? provider = freezed,}) {
  return _then(_self.copyWith(
provider_service: freezed == provider_service ? _self.provider_service : provider_service // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,service: freezed == service ? _self.service : service // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,provider: freezed == provider ? _self.provider : provider // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}

}


/// Adds pattern-matching-related methods to [ServiceDetailsEntity].
extension ServiceDetailsEntityPatterns on ServiceDetailsEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ServiceDetailsEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ServiceDetailsEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ServiceDetailsEntity value)  $default,){
final _that = this;
switch (_that) {
case _ServiceDetailsEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ServiceDetailsEntity value)?  $default,){
final _that = this;
switch (_that) {
case _ServiceDetailsEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Map<String, dynamic>? provider_service,  Map<String, dynamic>? service,  Map<String, dynamic>? provider)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ServiceDetailsEntity() when $default != null:
return $default(_that.provider_service,_that.service,_that.provider);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Map<String, dynamic>? provider_service,  Map<String, dynamic>? service,  Map<String, dynamic>? provider)  $default,) {final _that = this;
switch (_that) {
case _ServiceDetailsEntity():
return $default(_that.provider_service,_that.service,_that.provider);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Map<String, dynamic>? provider_service,  Map<String, dynamic>? service,  Map<String, dynamic>? provider)?  $default,) {final _that = this;
switch (_that) {
case _ServiceDetailsEntity() when $default != null:
return $default(_that.provider_service,_that.service,_that.provider);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ServiceDetailsEntity implements ServiceDetailsEntity {
  const _ServiceDetailsEntity({final  Map<String, dynamic>? provider_service = const {}, final  Map<String, dynamic>? service = const {}, final  Map<String, dynamic>? provider = const {}}): _provider_service = provider_service,_service = service,_provider = provider;
  factory _ServiceDetailsEntity.fromJson(Map<String, dynamic> json) => _$ServiceDetailsEntityFromJson(json);

 final  Map<String, dynamic>? _provider_service;
@override@JsonKey() Map<String, dynamic>? get provider_service {
  final value = _provider_service;
  if (value == null) return null;
  if (_provider_service is EqualUnmodifiableMapView) return _provider_service;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

 final  Map<String, dynamic>? _service;
@override@JsonKey() Map<String, dynamic>? get service {
  final value = _service;
  if (value == null) return null;
  if (_service is EqualUnmodifiableMapView) return _service;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

 final  Map<String, dynamic>? _provider;
@override@JsonKey() Map<String, dynamic>? get provider {
  final value = _provider;
  if (value == null) return null;
  if (_provider is EqualUnmodifiableMapView) return _provider;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of ServiceDetailsEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ServiceDetailsEntityCopyWith<_ServiceDetailsEntity> get copyWith => __$ServiceDetailsEntityCopyWithImpl<_ServiceDetailsEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ServiceDetailsEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ServiceDetailsEntity&&const DeepCollectionEquality().equals(other._provider_service, _provider_service)&&const DeepCollectionEquality().equals(other._service, _service)&&const DeepCollectionEquality().equals(other._provider, _provider));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_provider_service),const DeepCollectionEquality().hash(_service),const DeepCollectionEquality().hash(_provider));

@override
String toString() {
  return 'ServiceDetailsEntity(provider_service: $provider_service, service: $service, provider: $provider)';
}


}

/// @nodoc
abstract mixin class _$ServiceDetailsEntityCopyWith<$Res> implements $ServiceDetailsEntityCopyWith<$Res> {
  factory _$ServiceDetailsEntityCopyWith(_ServiceDetailsEntity value, $Res Function(_ServiceDetailsEntity) _then) = __$ServiceDetailsEntityCopyWithImpl;
@override @useResult
$Res call({
 Map<String, dynamic>? provider_service, Map<String, dynamic>? service, Map<String, dynamic>? provider
});




}
/// @nodoc
class __$ServiceDetailsEntityCopyWithImpl<$Res>
    implements _$ServiceDetailsEntityCopyWith<$Res> {
  __$ServiceDetailsEntityCopyWithImpl(this._self, this._then);

  final _ServiceDetailsEntity _self;
  final $Res Function(_ServiceDetailsEntity) _then;

/// Create a copy of ServiceDetailsEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? provider_service = freezed,Object? service = freezed,Object? provider = freezed,}) {
  return _then(_ServiceDetailsEntity(
provider_service: freezed == provider_service ? _self._provider_service : provider_service // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,service: freezed == service ? _self._service : service // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,provider: freezed == provider ? _self._provider : provider // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}


}

// dart format on
