// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_sliders_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GetSlidersEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetSlidersEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GetSlidersEvent()';
}


}

/// @nodoc
class $GetSlidersEventCopyWith<$Res>  {
$GetSlidersEventCopyWith(GetSlidersEvent _, $Res Function(GetSlidersEvent) __);
}


/// Adds pattern-matching-related methods to [GetSlidersEvent].
extension GetSlidersEventPatterns on GetSlidersEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( GetSlidersEventStarted value)?  started,TResult Function( GetSlidersEventGetSliders value)?  getSliders,required TResult orElse(),}){
final _that = this;
switch (_that) {
case GetSlidersEventStarted() when started != null:
return started(_that);case GetSlidersEventGetSliders() when getSliders != null:
return getSliders(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( GetSlidersEventStarted value)  started,required TResult Function( GetSlidersEventGetSliders value)  getSliders,}){
final _that = this;
switch (_that) {
case GetSlidersEventStarted():
return started(_that);case GetSlidersEventGetSliders():
return getSliders(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( GetSlidersEventStarted value)?  started,TResult? Function( GetSlidersEventGetSliders value)?  getSliders,}){
final _that = this;
switch (_that) {
case GetSlidersEventStarted() when started != null:
return started(_that);case GetSlidersEventGetSliders() when getSliders != null:
return getSliders(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function( HomePageModel? model)?  getSliders,required TResult orElse(),}) {final _that = this;
switch (_that) {
case GetSlidersEventStarted() when started != null:
return started();case GetSlidersEventGetSliders() when getSliders != null:
return getSliders(_that.model);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function( HomePageModel? model)  getSliders,}) {final _that = this;
switch (_that) {
case GetSlidersEventStarted():
return started();case GetSlidersEventGetSliders():
return getSliders(_that.model);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function( HomePageModel? model)?  getSliders,}) {final _that = this;
switch (_that) {
case GetSlidersEventStarted() when started != null:
return started();case GetSlidersEventGetSliders() when getSliders != null:
return getSliders(_that.model);case _:
  return null;

}
}

}

/// @nodoc


class GetSlidersEventStarted implements GetSlidersEvent {
  const GetSlidersEventStarted();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetSlidersEventStarted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GetSlidersEvent.started()';
}


}




/// @nodoc


class GetSlidersEventGetSliders implements GetSlidersEvent {
  const GetSlidersEventGetSliders({required this.model});
  

 final  HomePageModel? model;

/// Create a copy of GetSlidersEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetSlidersEventGetSlidersCopyWith<GetSlidersEventGetSliders> get copyWith => _$GetSlidersEventGetSlidersCopyWithImpl<GetSlidersEventGetSliders>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetSlidersEventGetSliders&&(identical(other.model, model) || other.model == model));
}


@override
int get hashCode => Object.hash(runtimeType,model);

@override
String toString() {
  return 'GetSlidersEvent.getSliders(model: $model)';
}


}

/// @nodoc
abstract mixin class $GetSlidersEventGetSlidersCopyWith<$Res> implements $GetSlidersEventCopyWith<$Res> {
  factory $GetSlidersEventGetSlidersCopyWith(GetSlidersEventGetSliders value, $Res Function(GetSlidersEventGetSliders) _then) = _$GetSlidersEventGetSlidersCopyWithImpl;
@useResult
$Res call({
 HomePageModel? model
});


$HomePageModelCopyWith<$Res>? get model;

}
/// @nodoc
class _$GetSlidersEventGetSlidersCopyWithImpl<$Res>
    implements $GetSlidersEventGetSlidersCopyWith<$Res> {
  _$GetSlidersEventGetSlidersCopyWithImpl(this._self, this._then);

  final GetSlidersEventGetSliders _self;
  final $Res Function(GetSlidersEventGetSliders) _then;

/// Create a copy of GetSlidersEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? model = freezed,}) {
  return _then(GetSlidersEventGetSliders(
model: freezed == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as HomePageModel?,
  ));
}

/// Create a copy of GetSlidersEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HomePageModelCopyWith<$Res>? get model {
    if (_self.model == null) {
    return null;
  }

  return $HomePageModelCopyWith<$Res>(_self.model!, (value) {
    return _then(_self.copyWith(model: value));
  });
}
}

/// @nodoc
mixin _$GetSlidersState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetSlidersState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GetSlidersState()';
}


}

/// @nodoc
class $GetSlidersStateCopyWith<$Res>  {
$GetSlidersStateCopyWith(GetSlidersState _, $Res Function(GetSlidersState) __);
}


/// Adds pattern-matching-related methods to [GetSlidersState].
extension GetSlidersStatePatterns on GetSlidersState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( GetSlidersStateInitial value)?  initial,TResult Function( GetSlidersStateLoading value)?  loading,TResult Function( GetSlidersStateLoaded value)?  loaded,TResult Function( GetSlidersStateNoData value)?  noData,TResult Function( GetSlidersStateError value)?  error,TResult Function( GetSlidersStateNoInternet value)?  noInternet,TResult Function( GetSlidersStateUnauthenticated value)?  unauthenticated,required TResult orElse(),}){
final _that = this;
switch (_that) {
case GetSlidersStateInitial() when initial != null:
return initial(_that);case GetSlidersStateLoading() when loading != null:
return loading(_that);case GetSlidersStateLoaded() when loaded != null:
return loaded(_that);case GetSlidersStateNoData() when noData != null:
return noData(_that);case GetSlidersStateError() when error != null:
return error(_that);case GetSlidersStateNoInternet() when noInternet != null:
return noInternet(_that);case GetSlidersStateUnauthenticated() when unauthenticated != null:
return unauthenticated(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( GetSlidersStateInitial value)  initial,required TResult Function( GetSlidersStateLoading value)  loading,required TResult Function( GetSlidersStateLoaded value)  loaded,required TResult Function( GetSlidersStateNoData value)  noData,required TResult Function( GetSlidersStateError value)  error,required TResult Function( GetSlidersStateNoInternet value)  noInternet,required TResult Function( GetSlidersStateUnauthenticated value)  unauthenticated,}){
final _that = this;
switch (_that) {
case GetSlidersStateInitial():
return initial(_that);case GetSlidersStateLoading():
return loading(_that);case GetSlidersStateLoaded():
return loaded(_that);case GetSlidersStateNoData():
return noData(_that);case GetSlidersStateError():
return error(_that);case GetSlidersStateNoInternet():
return noInternet(_that);case GetSlidersStateUnauthenticated():
return unauthenticated(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( GetSlidersStateInitial value)?  initial,TResult? Function( GetSlidersStateLoading value)?  loading,TResult? Function( GetSlidersStateLoaded value)?  loaded,TResult? Function( GetSlidersStateNoData value)?  noData,TResult? Function( GetSlidersStateError value)?  error,TResult? Function( GetSlidersStateNoInternet value)?  noInternet,TResult? Function( GetSlidersStateUnauthenticated value)?  unauthenticated,}){
final _that = this;
switch (_that) {
case GetSlidersStateInitial() when initial != null:
return initial(_that);case GetSlidersStateLoading() when loading != null:
return loading(_that);case GetSlidersStateLoaded() when loaded != null:
return loaded(_that);case GetSlidersStateNoData() when noData != null:
return noData(_that);case GetSlidersStateError() when error != null:
return error(_that);case GetSlidersStateNoInternet() when noInternet != null:
return noInternet(_that);case GetSlidersStateUnauthenticated() when unauthenticated != null:
return unauthenticated(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<SliderEntity?>? sliders)?  loaded,TResult Function()?  noData,TResult Function( String? message)?  error,TResult Function()?  noInternet,TResult Function()?  unauthenticated,required TResult orElse(),}) {final _that = this;
switch (_that) {
case GetSlidersStateInitial() when initial != null:
return initial();case GetSlidersStateLoading() when loading != null:
return loading();case GetSlidersStateLoaded() when loaded != null:
return loaded(_that.sliders);case GetSlidersStateNoData() when noData != null:
return noData();case GetSlidersStateError() when error != null:
return error(_that.message);case GetSlidersStateNoInternet() when noInternet != null:
return noInternet();case GetSlidersStateUnauthenticated() when unauthenticated != null:
return unauthenticated();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<SliderEntity?>? sliders)  loaded,required TResult Function()  noData,required TResult Function( String? message)  error,required TResult Function()  noInternet,required TResult Function()  unauthenticated,}) {final _that = this;
switch (_that) {
case GetSlidersStateInitial():
return initial();case GetSlidersStateLoading():
return loading();case GetSlidersStateLoaded():
return loaded(_that.sliders);case GetSlidersStateNoData():
return noData();case GetSlidersStateError():
return error(_that.message);case GetSlidersStateNoInternet():
return noInternet();case GetSlidersStateUnauthenticated():
return unauthenticated();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<SliderEntity?>? sliders)?  loaded,TResult? Function()?  noData,TResult? Function( String? message)?  error,TResult? Function()?  noInternet,TResult? Function()?  unauthenticated,}) {final _that = this;
switch (_that) {
case GetSlidersStateInitial() when initial != null:
return initial();case GetSlidersStateLoading() when loading != null:
return loading();case GetSlidersStateLoaded() when loaded != null:
return loaded(_that.sliders);case GetSlidersStateNoData() when noData != null:
return noData();case GetSlidersStateError() when error != null:
return error(_that.message);case GetSlidersStateNoInternet() when noInternet != null:
return noInternet();case GetSlidersStateUnauthenticated() when unauthenticated != null:
return unauthenticated();case _:
  return null;

}
}

}

/// @nodoc


class GetSlidersStateInitial implements GetSlidersState {
  const GetSlidersStateInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetSlidersStateInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GetSlidersState.initial()';
}


}




/// @nodoc


class GetSlidersStateLoading implements GetSlidersState {
  const GetSlidersStateLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetSlidersStateLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GetSlidersState.loading()';
}


}




/// @nodoc


class GetSlidersStateLoaded implements GetSlidersState {
  const GetSlidersStateLoaded({final  List<SliderEntity?>? sliders}): _sliders = sliders;
  

 final  List<SliderEntity?>? _sliders;
 List<SliderEntity?>? get sliders {
  final value = _sliders;
  if (value == null) return null;
  if (_sliders is EqualUnmodifiableListView) return _sliders;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of GetSlidersState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetSlidersStateLoadedCopyWith<GetSlidersStateLoaded> get copyWith => _$GetSlidersStateLoadedCopyWithImpl<GetSlidersStateLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetSlidersStateLoaded&&const DeepCollectionEquality().equals(other._sliders, _sliders));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_sliders));

@override
String toString() {
  return 'GetSlidersState.loaded(sliders: $sliders)';
}


}

/// @nodoc
abstract mixin class $GetSlidersStateLoadedCopyWith<$Res> implements $GetSlidersStateCopyWith<$Res> {
  factory $GetSlidersStateLoadedCopyWith(GetSlidersStateLoaded value, $Res Function(GetSlidersStateLoaded) _then) = _$GetSlidersStateLoadedCopyWithImpl;
@useResult
$Res call({
 List<SliderEntity?>? sliders
});




}
/// @nodoc
class _$GetSlidersStateLoadedCopyWithImpl<$Res>
    implements $GetSlidersStateLoadedCopyWith<$Res> {
  _$GetSlidersStateLoadedCopyWithImpl(this._self, this._then);

  final GetSlidersStateLoaded _self;
  final $Res Function(GetSlidersStateLoaded) _then;

/// Create a copy of GetSlidersState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? sliders = freezed,}) {
  return _then(GetSlidersStateLoaded(
sliders: freezed == sliders ? _self._sliders : sliders // ignore: cast_nullable_to_non_nullable
as List<SliderEntity?>?,
  ));
}


}

/// @nodoc


class GetSlidersStateNoData implements GetSlidersState {
  const GetSlidersStateNoData();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetSlidersStateNoData);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GetSlidersState.noData()';
}


}




/// @nodoc


class GetSlidersStateError implements GetSlidersState {
  const GetSlidersStateError({required this.message});
  

 final  String? message;

/// Create a copy of GetSlidersState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetSlidersStateErrorCopyWith<GetSlidersStateError> get copyWith => _$GetSlidersStateErrorCopyWithImpl<GetSlidersStateError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetSlidersStateError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'GetSlidersState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $GetSlidersStateErrorCopyWith<$Res> implements $GetSlidersStateCopyWith<$Res> {
  factory $GetSlidersStateErrorCopyWith(GetSlidersStateError value, $Res Function(GetSlidersStateError) _then) = _$GetSlidersStateErrorCopyWithImpl;
@useResult
$Res call({
 String? message
});




}
/// @nodoc
class _$GetSlidersStateErrorCopyWithImpl<$Res>
    implements $GetSlidersStateErrorCopyWith<$Res> {
  _$GetSlidersStateErrorCopyWithImpl(this._self, this._then);

  final GetSlidersStateError _self;
  final $Res Function(GetSlidersStateError) _then;

/// Create a copy of GetSlidersState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = freezed,}) {
  return _then(GetSlidersStateError(
message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class GetSlidersStateNoInternet implements GetSlidersState {
  const GetSlidersStateNoInternet();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetSlidersStateNoInternet);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GetSlidersState.noInternet()';
}


}




/// @nodoc


class GetSlidersStateUnauthenticated implements GetSlidersState {
  const GetSlidersStateUnauthenticated();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetSlidersStateUnauthenticated);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GetSlidersState.unauthenticated()';
}


}




// dart format on
