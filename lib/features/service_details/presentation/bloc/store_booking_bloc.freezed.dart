// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'store_booking_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$StoreBookingEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StoreBookingEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'StoreBookingEvent()';
}


}

/// @nodoc
class $StoreBookingEventCopyWith<$Res>  {
$StoreBookingEventCopyWith(StoreBookingEvent _, $Res Function(StoreBookingEvent) __);
}


/// Adds pattern-matching-related methods to [StoreBookingEvent].
extension StoreBookingEventPatterns on StoreBookingEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( StoreBookingEventStarted value)?  started,TResult Function( StoreBookingEventStoreBooking value)?  storeBooking,required TResult orElse(),}){
final _that = this;
switch (_that) {
case StoreBookingEventStarted() when started != null:
return started(_that);case StoreBookingEventStoreBooking() when storeBooking != null:
return storeBooking(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( StoreBookingEventStarted value)  started,required TResult Function( StoreBookingEventStoreBooking value)  storeBooking,}){
final _that = this;
switch (_that) {
case StoreBookingEventStarted():
return started(_that);case StoreBookingEventStoreBooking():
return storeBooking(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( StoreBookingEventStarted value)?  started,TResult? Function( StoreBookingEventStoreBooking value)?  storeBooking,}){
final _that = this;
switch (_that) {
case StoreBookingEventStarted() when started != null:
return started(_that);case StoreBookingEventStoreBooking() when storeBooking != null:
return storeBooking(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function( StoreBookingModel? storeBookingModel)?  storeBooking,required TResult orElse(),}) {final _that = this;
switch (_that) {
case StoreBookingEventStarted() when started != null:
return started();case StoreBookingEventStoreBooking() when storeBooking != null:
return storeBooking(_that.storeBookingModel);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function( StoreBookingModel? storeBookingModel)  storeBooking,}) {final _that = this;
switch (_that) {
case StoreBookingEventStarted():
return started();case StoreBookingEventStoreBooking():
return storeBooking(_that.storeBookingModel);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function( StoreBookingModel? storeBookingModel)?  storeBooking,}) {final _that = this;
switch (_that) {
case StoreBookingEventStarted() when started != null:
return started();case StoreBookingEventStoreBooking() when storeBooking != null:
return storeBooking(_that.storeBookingModel);case _:
  return null;

}
}

}

/// @nodoc


class StoreBookingEventStarted implements StoreBookingEvent {
  const StoreBookingEventStarted();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StoreBookingEventStarted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'StoreBookingEvent.started()';
}


}




/// @nodoc


class StoreBookingEventStoreBooking implements StoreBookingEvent {
  const StoreBookingEventStoreBooking({required this.storeBookingModel});
  

 final  StoreBookingModel? storeBookingModel;

/// Create a copy of StoreBookingEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StoreBookingEventStoreBookingCopyWith<StoreBookingEventStoreBooking> get copyWith => _$StoreBookingEventStoreBookingCopyWithImpl<StoreBookingEventStoreBooking>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StoreBookingEventStoreBooking&&(identical(other.storeBookingModel, storeBookingModel) || other.storeBookingModel == storeBookingModel));
}


@override
int get hashCode => Object.hash(runtimeType,storeBookingModel);

@override
String toString() {
  return 'StoreBookingEvent.storeBooking(storeBookingModel: $storeBookingModel)';
}


}

/// @nodoc
abstract mixin class $StoreBookingEventStoreBookingCopyWith<$Res> implements $StoreBookingEventCopyWith<$Res> {
  factory $StoreBookingEventStoreBookingCopyWith(StoreBookingEventStoreBooking value, $Res Function(StoreBookingEventStoreBooking) _then) = _$StoreBookingEventStoreBookingCopyWithImpl;
@useResult
$Res call({
 StoreBookingModel? storeBookingModel
});


$StoreBookingModelCopyWith<$Res>? get storeBookingModel;

}
/// @nodoc
class _$StoreBookingEventStoreBookingCopyWithImpl<$Res>
    implements $StoreBookingEventStoreBookingCopyWith<$Res> {
  _$StoreBookingEventStoreBookingCopyWithImpl(this._self, this._then);

  final StoreBookingEventStoreBooking _self;
  final $Res Function(StoreBookingEventStoreBooking) _then;

/// Create a copy of StoreBookingEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? storeBookingModel = freezed,}) {
  return _then(StoreBookingEventStoreBooking(
storeBookingModel: freezed == storeBookingModel ? _self.storeBookingModel : storeBookingModel // ignore: cast_nullable_to_non_nullable
as StoreBookingModel?,
  ));
}

/// Create a copy of StoreBookingEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StoreBookingModelCopyWith<$Res>? get storeBookingModel {
    if (_self.storeBookingModel == null) {
    return null;
  }

  return $StoreBookingModelCopyWith<$Res>(_self.storeBookingModel!, (value) {
    return _then(_self.copyWith(storeBookingModel: value));
  });
}
}

/// @nodoc
mixin _$StoreBookingState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StoreBookingState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'StoreBookingState()';
}


}

/// @nodoc
class $StoreBookingStateCopyWith<$Res>  {
$StoreBookingStateCopyWith(StoreBookingState _, $Res Function(StoreBookingState) __);
}


/// Adds pattern-matching-related methods to [StoreBookingState].
extension StoreBookingStatePatterns on StoreBookingState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( StoreBookingStateInitial value)?  initial,TResult Function( StoreBookingStateLoading value)?  loading,TResult Function( StoreBookingStateSuccess value)?  success,TResult Function( StoreBookingStateError value)?  error,TResult Function( StoreBookingStateSessionExpired value)?  sessionExpired,TResult Function( StoreBookingStateNoInternet value)?  noInternet,required TResult orElse(),}){
final _that = this;
switch (_that) {
case StoreBookingStateInitial() when initial != null:
return initial(_that);case StoreBookingStateLoading() when loading != null:
return loading(_that);case StoreBookingStateSuccess() when success != null:
return success(_that);case StoreBookingStateError() when error != null:
return error(_that);case StoreBookingStateSessionExpired() when sessionExpired != null:
return sessionExpired(_that);case StoreBookingStateNoInternet() when noInternet != null:
return noInternet(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( StoreBookingStateInitial value)  initial,required TResult Function( StoreBookingStateLoading value)  loading,required TResult Function( StoreBookingStateSuccess value)  success,required TResult Function( StoreBookingStateError value)  error,required TResult Function( StoreBookingStateSessionExpired value)  sessionExpired,required TResult Function( StoreBookingStateNoInternet value)  noInternet,}){
final _that = this;
switch (_that) {
case StoreBookingStateInitial():
return initial(_that);case StoreBookingStateLoading():
return loading(_that);case StoreBookingStateSuccess():
return success(_that);case StoreBookingStateError():
return error(_that);case StoreBookingStateSessionExpired():
return sessionExpired(_that);case StoreBookingStateNoInternet():
return noInternet(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( StoreBookingStateInitial value)?  initial,TResult? Function( StoreBookingStateLoading value)?  loading,TResult? Function( StoreBookingStateSuccess value)?  success,TResult? Function( StoreBookingStateError value)?  error,TResult? Function( StoreBookingStateSessionExpired value)?  sessionExpired,TResult? Function( StoreBookingStateNoInternet value)?  noInternet,}){
final _that = this;
switch (_that) {
case StoreBookingStateInitial() when initial != null:
return initial(_that);case StoreBookingStateLoading() when loading != null:
return loading(_that);case StoreBookingStateSuccess() when success != null:
return success(_that);case StoreBookingStateError() when error != null:
return error(_that);case StoreBookingStateSessionExpired() when sessionExpired != null:
return sessionExpired(_that);case StoreBookingStateNoInternet() when noInternet != null:
return noInternet(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function()?  success,TResult Function( String message)?  error,TResult Function()?  sessionExpired,TResult Function()?  noInternet,required TResult orElse(),}) {final _that = this;
switch (_that) {
case StoreBookingStateInitial() when initial != null:
return initial();case StoreBookingStateLoading() when loading != null:
return loading();case StoreBookingStateSuccess() when success != null:
return success();case StoreBookingStateError() when error != null:
return error(_that.message);case StoreBookingStateSessionExpired() when sessionExpired != null:
return sessionExpired();case StoreBookingStateNoInternet() when noInternet != null:
return noInternet();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function()  success,required TResult Function( String message)  error,required TResult Function()  sessionExpired,required TResult Function()  noInternet,}) {final _that = this;
switch (_that) {
case StoreBookingStateInitial():
return initial();case StoreBookingStateLoading():
return loading();case StoreBookingStateSuccess():
return success();case StoreBookingStateError():
return error(_that.message);case StoreBookingStateSessionExpired():
return sessionExpired();case StoreBookingStateNoInternet():
return noInternet();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function()?  success,TResult? Function( String message)?  error,TResult? Function()?  sessionExpired,TResult? Function()?  noInternet,}) {final _that = this;
switch (_that) {
case StoreBookingStateInitial() when initial != null:
return initial();case StoreBookingStateLoading() when loading != null:
return loading();case StoreBookingStateSuccess() when success != null:
return success();case StoreBookingStateError() when error != null:
return error(_that.message);case StoreBookingStateSessionExpired() when sessionExpired != null:
return sessionExpired();case StoreBookingStateNoInternet() when noInternet != null:
return noInternet();case _:
  return null;

}
}

}

/// @nodoc


class StoreBookingStateInitial implements StoreBookingState {
  const StoreBookingStateInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StoreBookingStateInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'StoreBookingState.initial()';
}


}




/// @nodoc


class StoreBookingStateLoading implements StoreBookingState {
  const StoreBookingStateLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StoreBookingStateLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'StoreBookingState.loading()';
}


}




/// @nodoc


class StoreBookingStateSuccess implements StoreBookingState {
  const StoreBookingStateSuccess();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StoreBookingStateSuccess);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'StoreBookingState.success()';
}


}




/// @nodoc


class StoreBookingStateError implements StoreBookingState {
  const StoreBookingStateError({required this.message});
  

 final  String message;

/// Create a copy of StoreBookingState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StoreBookingStateErrorCopyWith<StoreBookingStateError> get copyWith => _$StoreBookingStateErrorCopyWithImpl<StoreBookingStateError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StoreBookingStateError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'StoreBookingState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $StoreBookingStateErrorCopyWith<$Res> implements $StoreBookingStateCopyWith<$Res> {
  factory $StoreBookingStateErrorCopyWith(StoreBookingStateError value, $Res Function(StoreBookingStateError) _then) = _$StoreBookingStateErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$StoreBookingStateErrorCopyWithImpl<$Res>
    implements $StoreBookingStateErrorCopyWith<$Res> {
  _$StoreBookingStateErrorCopyWithImpl(this._self, this._then);

  final StoreBookingStateError _self;
  final $Res Function(StoreBookingStateError) _then;

/// Create a copy of StoreBookingState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(StoreBookingStateError(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class StoreBookingStateSessionExpired implements StoreBookingState {
  const StoreBookingStateSessionExpired();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StoreBookingStateSessionExpired);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'StoreBookingState.sessionExpired()';
}


}




/// @nodoc


class StoreBookingStateNoInternet implements StoreBookingState {
  const StoreBookingStateNoInternet();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StoreBookingStateNoInternet);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'StoreBookingState.noInternet()';
}


}




// dart format on
