// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'service_details_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ServiceDetailsEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServiceDetailsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ServiceDetailsEvent()';
}


}

/// @nodoc
class $ServiceDetailsEventCopyWith<$Res>  {
$ServiceDetailsEventCopyWith(ServiceDetailsEvent _, $Res Function(ServiceDetailsEvent) __);
}


/// Adds pattern-matching-related methods to [ServiceDetailsEvent].
extension ServiceDetailsEventPatterns on ServiceDetailsEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ServiceDetailsEventStarted value)?  started,TResult Function( ServiceDetailsEventGetServiceDetails value)?  getServiceDetails,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ServiceDetailsEventStarted() when started != null:
return started(_that);case ServiceDetailsEventGetServiceDetails() when getServiceDetails != null:
return getServiceDetails(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ServiceDetailsEventStarted value)  started,required TResult Function( ServiceDetailsEventGetServiceDetails value)  getServiceDetails,}){
final _that = this;
switch (_that) {
case ServiceDetailsEventStarted():
return started(_that);case ServiceDetailsEventGetServiceDetails():
return getServiceDetails(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ServiceDetailsEventStarted value)?  started,TResult? Function( ServiceDetailsEventGetServiceDetails value)?  getServiceDetails,}){
final _that = this;
switch (_that) {
case ServiceDetailsEventStarted() when started != null:
return started(_that);case ServiceDetailsEventGetServiceDetails() when getServiceDetails != null:
return getServiceDetails(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function( ServiceDetailsModel? serviceDetailsModel)?  getServiceDetails,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ServiceDetailsEventStarted() when started != null:
return started();case ServiceDetailsEventGetServiceDetails() when getServiceDetails != null:
return getServiceDetails(_that.serviceDetailsModel);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function( ServiceDetailsModel? serviceDetailsModel)  getServiceDetails,}) {final _that = this;
switch (_that) {
case ServiceDetailsEventStarted():
return started();case ServiceDetailsEventGetServiceDetails():
return getServiceDetails(_that.serviceDetailsModel);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function( ServiceDetailsModel? serviceDetailsModel)?  getServiceDetails,}) {final _that = this;
switch (_that) {
case ServiceDetailsEventStarted() when started != null:
return started();case ServiceDetailsEventGetServiceDetails() when getServiceDetails != null:
return getServiceDetails(_that.serviceDetailsModel);case _:
  return null;

}
}

}

/// @nodoc


class ServiceDetailsEventStarted implements ServiceDetailsEvent {
  const ServiceDetailsEventStarted();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServiceDetailsEventStarted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ServiceDetailsEvent.started()';
}


}




/// @nodoc


class ServiceDetailsEventGetServiceDetails implements ServiceDetailsEvent {
  const ServiceDetailsEventGetServiceDetails({required this.serviceDetailsModel});
  

 final  ServiceDetailsModel? serviceDetailsModel;

/// Create a copy of ServiceDetailsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ServiceDetailsEventGetServiceDetailsCopyWith<ServiceDetailsEventGetServiceDetails> get copyWith => _$ServiceDetailsEventGetServiceDetailsCopyWithImpl<ServiceDetailsEventGetServiceDetails>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServiceDetailsEventGetServiceDetails&&const DeepCollectionEquality().equals(other.serviceDetailsModel, serviceDetailsModel));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(serviceDetailsModel));

@override
String toString() {
  return 'ServiceDetailsEvent.getServiceDetails(serviceDetailsModel: $serviceDetailsModel)';
}


}

/// @nodoc
abstract mixin class $ServiceDetailsEventGetServiceDetailsCopyWith<$Res> implements $ServiceDetailsEventCopyWith<$Res> {
  factory $ServiceDetailsEventGetServiceDetailsCopyWith(ServiceDetailsEventGetServiceDetails value, $Res Function(ServiceDetailsEventGetServiceDetails) _then) = _$ServiceDetailsEventGetServiceDetailsCopyWithImpl;
@useResult
$Res call({
 ServiceDetailsModel? serviceDetailsModel
});




}
/// @nodoc
class _$ServiceDetailsEventGetServiceDetailsCopyWithImpl<$Res>
    implements $ServiceDetailsEventGetServiceDetailsCopyWith<$Res> {
  _$ServiceDetailsEventGetServiceDetailsCopyWithImpl(this._self, this._then);

  final ServiceDetailsEventGetServiceDetails _self;
  final $Res Function(ServiceDetailsEventGetServiceDetails) _then;

/// Create a copy of ServiceDetailsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? serviceDetailsModel = freezed,}) {
  return _then(ServiceDetailsEventGetServiceDetails(
serviceDetailsModel: freezed == serviceDetailsModel ? _self.serviceDetailsModel : serviceDetailsModel // ignore: cast_nullable_to_non_nullable
as ServiceDetailsModel?,
  ));
}


}

/// @nodoc
mixin _$ServiceDetailsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServiceDetailsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ServiceDetailsState()';
}


}

/// @nodoc
class $ServiceDetailsStateCopyWith<$Res>  {
$ServiceDetailsStateCopyWith(ServiceDetailsState _, $Res Function(ServiceDetailsState) __);
}


/// Adds pattern-matching-related methods to [ServiceDetailsState].
extension ServiceDetailsStatePatterns on ServiceDetailsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ServiceDetailsStateInitial value)?  initial,TResult Function( ServiceDetailsStateLoading value)?  loading,TResult Function( ServiceDetailsStateLoaded value)?  loaded,TResult Function( ServiceDetailsStateError value)?  error,TResult Function( ServiceDetailsStateUnauthenticated value)?  unauthenticated,TResult Function( ServiceDetailsStateNoInternet value)?  noInternet,TResult Function( ServiceDetailsStateNoData value)?  noData,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ServiceDetailsStateInitial() when initial != null:
return initial(_that);case ServiceDetailsStateLoading() when loading != null:
return loading(_that);case ServiceDetailsStateLoaded() when loaded != null:
return loaded(_that);case ServiceDetailsStateError() when error != null:
return error(_that);case ServiceDetailsStateUnauthenticated() when unauthenticated != null:
return unauthenticated(_that);case ServiceDetailsStateNoInternet() when noInternet != null:
return noInternet(_that);case ServiceDetailsStateNoData() when noData != null:
return noData(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ServiceDetailsStateInitial value)  initial,required TResult Function( ServiceDetailsStateLoading value)  loading,required TResult Function( ServiceDetailsStateLoaded value)  loaded,required TResult Function( ServiceDetailsStateError value)  error,required TResult Function( ServiceDetailsStateUnauthenticated value)  unauthenticated,required TResult Function( ServiceDetailsStateNoInternet value)  noInternet,required TResult Function( ServiceDetailsStateNoData value)  noData,}){
final _that = this;
switch (_that) {
case ServiceDetailsStateInitial():
return initial(_that);case ServiceDetailsStateLoading():
return loading(_that);case ServiceDetailsStateLoaded():
return loaded(_that);case ServiceDetailsStateError():
return error(_that);case ServiceDetailsStateUnauthenticated():
return unauthenticated(_that);case ServiceDetailsStateNoInternet():
return noInternet(_that);case ServiceDetailsStateNoData():
return noData(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ServiceDetailsStateInitial value)?  initial,TResult? Function( ServiceDetailsStateLoading value)?  loading,TResult? Function( ServiceDetailsStateLoaded value)?  loaded,TResult? Function( ServiceDetailsStateError value)?  error,TResult? Function( ServiceDetailsStateUnauthenticated value)?  unauthenticated,TResult? Function( ServiceDetailsStateNoInternet value)?  noInternet,TResult? Function( ServiceDetailsStateNoData value)?  noData,}){
final _that = this;
switch (_that) {
case ServiceDetailsStateInitial() when initial != null:
return initial(_that);case ServiceDetailsStateLoading() when loading != null:
return loading(_that);case ServiceDetailsStateLoaded() when loaded != null:
return loaded(_that);case ServiceDetailsStateError() when error != null:
return error(_that);case ServiceDetailsStateUnauthenticated() when unauthenticated != null:
return unauthenticated(_that);case ServiceDetailsStateNoInternet() when noInternet != null:
return noInternet(_that);case ServiceDetailsStateNoData() when noData != null:
return noData(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<ServiceDetailsEntity?>? serviceDetailsEntity)?  loaded,TResult Function( String error)?  error,TResult Function( String error)?  unauthenticated,TResult Function()?  noInternet,TResult Function()?  noData,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ServiceDetailsStateInitial() when initial != null:
return initial();case ServiceDetailsStateLoading() when loading != null:
return loading();case ServiceDetailsStateLoaded() when loaded != null:
return loaded(_that.serviceDetailsEntity);case ServiceDetailsStateError() when error != null:
return error(_that.error);case ServiceDetailsStateUnauthenticated() when unauthenticated != null:
return unauthenticated(_that.error);case ServiceDetailsStateNoInternet() when noInternet != null:
return noInternet();case ServiceDetailsStateNoData() when noData != null:
return noData();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<ServiceDetailsEntity?>? serviceDetailsEntity)  loaded,required TResult Function( String error)  error,required TResult Function( String error)  unauthenticated,required TResult Function()  noInternet,required TResult Function()  noData,}) {final _that = this;
switch (_that) {
case ServiceDetailsStateInitial():
return initial();case ServiceDetailsStateLoading():
return loading();case ServiceDetailsStateLoaded():
return loaded(_that.serviceDetailsEntity);case ServiceDetailsStateError():
return error(_that.error);case ServiceDetailsStateUnauthenticated():
return unauthenticated(_that.error);case ServiceDetailsStateNoInternet():
return noInternet();case ServiceDetailsStateNoData():
return noData();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<ServiceDetailsEntity?>? serviceDetailsEntity)?  loaded,TResult? Function( String error)?  error,TResult? Function( String error)?  unauthenticated,TResult? Function()?  noInternet,TResult? Function()?  noData,}) {final _that = this;
switch (_that) {
case ServiceDetailsStateInitial() when initial != null:
return initial();case ServiceDetailsStateLoading() when loading != null:
return loading();case ServiceDetailsStateLoaded() when loaded != null:
return loaded(_that.serviceDetailsEntity);case ServiceDetailsStateError() when error != null:
return error(_that.error);case ServiceDetailsStateUnauthenticated() when unauthenticated != null:
return unauthenticated(_that.error);case ServiceDetailsStateNoInternet() when noInternet != null:
return noInternet();case ServiceDetailsStateNoData() when noData != null:
return noData();case _:
  return null;

}
}

}

/// @nodoc


class ServiceDetailsStateInitial implements ServiceDetailsState {
  const ServiceDetailsStateInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServiceDetailsStateInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ServiceDetailsState.initial()';
}


}




/// @nodoc


class ServiceDetailsStateLoading implements ServiceDetailsState {
  const ServiceDetailsStateLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServiceDetailsStateLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ServiceDetailsState.loading()';
}


}




/// @nodoc


class ServiceDetailsStateLoaded implements ServiceDetailsState {
  const ServiceDetailsStateLoaded({required final  List<ServiceDetailsEntity?>? serviceDetailsEntity}): _serviceDetailsEntity = serviceDetailsEntity;
  

 final  List<ServiceDetailsEntity?>? _serviceDetailsEntity;
 List<ServiceDetailsEntity?>? get serviceDetailsEntity {
  final value = _serviceDetailsEntity;
  if (value == null) return null;
  if (_serviceDetailsEntity is EqualUnmodifiableListView) return _serviceDetailsEntity;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of ServiceDetailsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ServiceDetailsStateLoadedCopyWith<ServiceDetailsStateLoaded> get copyWith => _$ServiceDetailsStateLoadedCopyWithImpl<ServiceDetailsStateLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServiceDetailsStateLoaded&&const DeepCollectionEquality().equals(other._serviceDetailsEntity, _serviceDetailsEntity));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_serviceDetailsEntity));

@override
String toString() {
  return 'ServiceDetailsState.loaded(serviceDetailsEntity: $serviceDetailsEntity)';
}


}

/// @nodoc
abstract mixin class $ServiceDetailsStateLoadedCopyWith<$Res> implements $ServiceDetailsStateCopyWith<$Res> {
  factory $ServiceDetailsStateLoadedCopyWith(ServiceDetailsStateLoaded value, $Res Function(ServiceDetailsStateLoaded) _then) = _$ServiceDetailsStateLoadedCopyWithImpl;
@useResult
$Res call({
 List<ServiceDetailsEntity?>? serviceDetailsEntity
});




}
/// @nodoc
class _$ServiceDetailsStateLoadedCopyWithImpl<$Res>
    implements $ServiceDetailsStateLoadedCopyWith<$Res> {
  _$ServiceDetailsStateLoadedCopyWithImpl(this._self, this._then);

  final ServiceDetailsStateLoaded _self;
  final $Res Function(ServiceDetailsStateLoaded) _then;

/// Create a copy of ServiceDetailsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? serviceDetailsEntity = freezed,}) {
  return _then(ServiceDetailsStateLoaded(
serviceDetailsEntity: freezed == serviceDetailsEntity ? _self._serviceDetailsEntity : serviceDetailsEntity // ignore: cast_nullable_to_non_nullable
as List<ServiceDetailsEntity?>?,
  ));
}


}

/// @nodoc


class ServiceDetailsStateError implements ServiceDetailsState {
  const ServiceDetailsStateError({required this.error});
  

 final  String error;

/// Create a copy of ServiceDetailsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ServiceDetailsStateErrorCopyWith<ServiceDetailsStateError> get copyWith => _$ServiceDetailsStateErrorCopyWithImpl<ServiceDetailsStateError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServiceDetailsStateError&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'ServiceDetailsState.error(error: $error)';
}


}

/// @nodoc
abstract mixin class $ServiceDetailsStateErrorCopyWith<$Res> implements $ServiceDetailsStateCopyWith<$Res> {
  factory $ServiceDetailsStateErrorCopyWith(ServiceDetailsStateError value, $Res Function(ServiceDetailsStateError) _then) = _$ServiceDetailsStateErrorCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class _$ServiceDetailsStateErrorCopyWithImpl<$Res>
    implements $ServiceDetailsStateErrorCopyWith<$Res> {
  _$ServiceDetailsStateErrorCopyWithImpl(this._self, this._then);

  final ServiceDetailsStateError _self;
  final $Res Function(ServiceDetailsStateError) _then;

/// Create a copy of ServiceDetailsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(ServiceDetailsStateError(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ServiceDetailsStateUnauthenticated implements ServiceDetailsState {
  const ServiceDetailsStateUnauthenticated({required this.error});
  

 final  String error;

/// Create a copy of ServiceDetailsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ServiceDetailsStateUnauthenticatedCopyWith<ServiceDetailsStateUnauthenticated> get copyWith => _$ServiceDetailsStateUnauthenticatedCopyWithImpl<ServiceDetailsStateUnauthenticated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServiceDetailsStateUnauthenticated&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'ServiceDetailsState.unauthenticated(error: $error)';
}


}

/// @nodoc
abstract mixin class $ServiceDetailsStateUnauthenticatedCopyWith<$Res> implements $ServiceDetailsStateCopyWith<$Res> {
  factory $ServiceDetailsStateUnauthenticatedCopyWith(ServiceDetailsStateUnauthenticated value, $Res Function(ServiceDetailsStateUnauthenticated) _then) = _$ServiceDetailsStateUnauthenticatedCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class _$ServiceDetailsStateUnauthenticatedCopyWithImpl<$Res>
    implements $ServiceDetailsStateUnauthenticatedCopyWith<$Res> {
  _$ServiceDetailsStateUnauthenticatedCopyWithImpl(this._self, this._then);

  final ServiceDetailsStateUnauthenticated _self;
  final $Res Function(ServiceDetailsStateUnauthenticated) _then;

/// Create a copy of ServiceDetailsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(ServiceDetailsStateUnauthenticated(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ServiceDetailsStateNoInternet implements ServiceDetailsState {
  const ServiceDetailsStateNoInternet();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServiceDetailsStateNoInternet);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ServiceDetailsState.noInternet()';
}


}




/// @nodoc


class ServiceDetailsStateNoData implements ServiceDetailsState {
  const ServiceDetailsStateNoData();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServiceDetailsStateNoData);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ServiceDetailsState.noData()';
}


}




// dart format on
