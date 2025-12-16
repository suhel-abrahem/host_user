// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'time_slots_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TimeSlotsEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TimeSlotsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TimeSlotsEvent()';
}


}

/// @nodoc
class $TimeSlotsEventCopyWith<$Res>  {
$TimeSlotsEventCopyWith(TimeSlotsEvent _, $Res Function(TimeSlotsEvent) __);
}


/// Adds pattern-matching-related methods to [TimeSlotsEvent].
extension TimeSlotsEventPatterns on TimeSlotsEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( TimeSlotsEventStarted value)?  started,TResult Function( TimeSlotsEventGetTimeSlots value)?  getTimeSlots,required TResult orElse(),}){
final _that = this;
switch (_that) {
case TimeSlotsEventStarted() when started != null:
return started(_that);case TimeSlotsEventGetTimeSlots() when getTimeSlots != null:
return getTimeSlots(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( TimeSlotsEventStarted value)  started,required TResult Function( TimeSlotsEventGetTimeSlots value)  getTimeSlots,}){
final _that = this;
switch (_that) {
case TimeSlotsEventStarted():
return started(_that);case TimeSlotsEventGetTimeSlots():
return getTimeSlots(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( TimeSlotsEventStarted value)?  started,TResult? Function( TimeSlotsEventGetTimeSlots value)?  getTimeSlots,}){
final _that = this;
switch (_that) {
case TimeSlotsEventStarted() when started != null:
return started(_that);case TimeSlotsEventGetTimeSlots() when getTimeSlots != null:
return getTimeSlots(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function( TimeSlotsModel? timeSlotsModel)?  getTimeSlots,required TResult orElse(),}) {final _that = this;
switch (_that) {
case TimeSlotsEventStarted() when started != null:
return started();case TimeSlotsEventGetTimeSlots() when getTimeSlots != null:
return getTimeSlots(_that.timeSlotsModel);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function( TimeSlotsModel? timeSlotsModel)  getTimeSlots,}) {final _that = this;
switch (_that) {
case TimeSlotsEventStarted():
return started();case TimeSlotsEventGetTimeSlots():
return getTimeSlots(_that.timeSlotsModel);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function( TimeSlotsModel? timeSlotsModel)?  getTimeSlots,}) {final _that = this;
switch (_that) {
case TimeSlotsEventStarted() when started != null:
return started();case TimeSlotsEventGetTimeSlots() when getTimeSlots != null:
return getTimeSlots(_that.timeSlotsModel);case _:
  return null;

}
}

}

/// @nodoc


class TimeSlotsEventStarted implements TimeSlotsEvent {
  const TimeSlotsEventStarted();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TimeSlotsEventStarted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TimeSlotsEvent.started()';
}


}




/// @nodoc


class TimeSlotsEventGetTimeSlots implements TimeSlotsEvent {
  const TimeSlotsEventGetTimeSlots({required this.timeSlotsModel});
  

 final  TimeSlotsModel? timeSlotsModel;

/// Create a copy of TimeSlotsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TimeSlotsEventGetTimeSlotsCopyWith<TimeSlotsEventGetTimeSlots> get copyWith => _$TimeSlotsEventGetTimeSlotsCopyWithImpl<TimeSlotsEventGetTimeSlots>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TimeSlotsEventGetTimeSlots&&(identical(other.timeSlotsModel, timeSlotsModel) || other.timeSlotsModel == timeSlotsModel));
}


@override
int get hashCode => Object.hash(runtimeType,timeSlotsModel);

@override
String toString() {
  return 'TimeSlotsEvent.getTimeSlots(timeSlotsModel: $timeSlotsModel)';
}


}

/// @nodoc
abstract mixin class $TimeSlotsEventGetTimeSlotsCopyWith<$Res> implements $TimeSlotsEventCopyWith<$Res> {
  factory $TimeSlotsEventGetTimeSlotsCopyWith(TimeSlotsEventGetTimeSlots value, $Res Function(TimeSlotsEventGetTimeSlots) _then) = _$TimeSlotsEventGetTimeSlotsCopyWithImpl;
@useResult
$Res call({
 TimeSlotsModel? timeSlotsModel
});


$TimeSlotsModelCopyWith<$Res>? get timeSlotsModel;

}
/// @nodoc
class _$TimeSlotsEventGetTimeSlotsCopyWithImpl<$Res>
    implements $TimeSlotsEventGetTimeSlotsCopyWith<$Res> {
  _$TimeSlotsEventGetTimeSlotsCopyWithImpl(this._self, this._then);

  final TimeSlotsEventGetTimeSlots _self;
  final $Res Function(TimeSlotsEventGetTimeSlots) _then;

/// Create a copy of TimeSlotsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? timeSlotsModel = freezed,}) {
  return _then(TimeSlotsEventGetTimeSlots(
timeSlotsModel: freezed == timeSlotsModel ? _self.timeSlotsModel : timeSlotsModel // ignore: cast_nullable_to_non_nullable
as TimeSlotsModel?,
  ));
}

/// Create a copy of TimeSlotsEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TimeSlotsModelCopyWith<$Res>? get timeSlotsModel {
    if (_self.timeSlotsModel == null) {
    return null;
  }

  return $TimeSlotsModelCopyWith<$Res>(_self.timeSlotsModel!, (value) {
    return _then(_self.copyWith(timeSlotsModel: value));
  });
}
}

/// @nodoc
mixin _$TimeSlotsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TimeSlotsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TimeSlotsState()';
}


}

/// @nodoc
class $TimeSlotsStateCopyWith<$Res>  {
$TimeSlotsStateCopyWith(TimeSlotsState _, $Res Function(TimeSlotsState) __);
}


/// Adds pattern-matching-related methods to [TimeSlotsState].
extension TimeSlotsStatePatterns on TimeSlotsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( TimeSlotsStateInitial value)?  initial,TResult Function( TimeSlotsStateLoading value)?  loading,TResult Function( TimeSlotsStateLoaded value)?  loaded,TResult Function( TimeSlotsStateError value)?  error,TResult Function( TimeSlotsStateNoData value)?  noData,TResult Function( TimeSlotsStateSessionExpired value)?  sessionExpired,TResult Function( TimeSlotsStateNoInternet value)?  noInternet,required TResult orElse(),}){
final _that = this;
switch (_that) {
case TimeSlotsStateInitial() when initial != null:
return initial(_that);case TimeSlotsStateLoading() when loading != null:
return loading(_that);case TimeSlotsStateLoaded() when loaded != null:
return loaded(_that);case TimeSlotsStateError() when error != null:
return error(_that);case TimeSlotsStateNoData() when noData != null:
return noData(_that);case TimeSlotsStateSessionExpired() when sessionExpired != null:
return sessionExpired(_that);case TimeSlotsStateNoInternet() when noInternet != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( TimeSlotsStateInitial value)  initial,required TResult Function( TimeSlotsStateLoading value)  loading,required TResult Function( TimeSlotsStateLoaded value)  loaded,required TResult Function( TimeSlotsStateError value)  error,required TResult Function( TimeSlotsStateNoData value)  noData,required TResult Function( TimeSlotsStateSessionExpired value)  sessionExpired,required TResult Function( TimeSlotsStateNoInternet value)  noInternet,}){
final _that = this;
switch (_that) {
case TimeSlotsStateInitial():
return initial(_that);case TimeSlotsStateLoading():
return loading(_that);case TimeSlotsStateLoaded():
return loaded(_that);case TimeSlotsStateError():
return error(_that);case TimeSlotsStateNoData():
return noData(_that);case TimeSlotsStateSessionExpired():
return sessionExpired(_that);case TimeSlotsStateNoInternet():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( TimeSlotsStateInitial value)?  initial,TResult? Function( TimeSlotsStateLoading value)?  loading,TResult? Function( TimeSlotsStateLoaded value)?  loaded,TResult? Function( TimeSlotsStateError value)?  error,TResult? Function( TimeSlotsStateNoData value)?  noData,TResult? Function( TimeSlotsStateSessionExpired value)?  sessionExpired,TResult? Function( TimeSlotsStateNoInternet value)?  noInternet,}){
final _that = this;
switch (_that) {
case TimeSlotsStateInitial() when initial != null:
return initial(_that);case TimeSlotsStateLoading() when loading != null:
return loading(_that);case TimeSlotsStateLoaded() when loaded != null:
return loaded(_that);case TimeSlotsStateError() when error != null:
return error(_that);case TimeSlotsStateNoData() when noData != null:
return noData(_that);case TimeSlotsStateSessionExpired() when sessionExpired != null:
return sessionExpired(_that);case TimeSlotsStateNoInternet() when noInternet != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<TimeSlotsEntity?>? timeSlots)?  loaded,TResult Function( String message)?  error,TResult Function()?  noData,TResult Function()?  sessionExpired,TResult Function()?  noInternet,required TResult orElse(),}) {final _that = this;
switch (_that) {
case TimeSlotsStateInitial() when initial != null:
return initial();case TimeSlotsStateLoading() when loading != null:
return loading();case TimeSlotsStateLoaded() when loaded != null:
return loaded(_that.timeSlots);case TimeSlotsStateError() when error != null:
return error(_that.message);case TimeSlotsStateNoData() when noData != null:
return noData();case TimeSlotsStateSessionExpired() when sessionExpired != null:
return sessionExpired();case TimeSlotsStateNoInternet() when noInternet != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<TimeSlotsEntity?>? timeSlots)  loaded,required TResult Function( String message)  error,required TResult Function()  noData,required TResult Function()  sessionExpired,required TResult Function()  noInternet,}) {final _that = this;
switch (_that) {
case TimeSlotsStateInitial():
return initial();case TimeSlotsStateLoading():
return loading();case TimeSlotsStateLoaded():
return loaded(_that.timeSlots);case TimeSlotsStateError():
return error(_that.message);case TimeSlotsStateNoData():
return noData();case TimeSlotsStateSessionExpired():
return sessionExpired();case TimeSlotsStateNoInternet():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<TimeSlotsEntity?>? timeSlots)?  loaded,TResult? Function( String message)?  error,TResult? Function()?  noData,TResult? Function()?  sessionExpired,TResult? Function()?  noInternet,}) {final _that = this;
switch (_that) {
case TimeSlotsStateInitial() when initial != null:
return initial();case TimeSlotsStateLoading() when loading != null:
return loading();case TimeSlotsStateLoaded() when loaded != null:
return loaded(_that.timeSlots);case TimeSlotsStateError() when error != null:
return error(_that.message);case TimeSlotsStateNoData() when noData != null:
return noData();case TimeSlotsStateSessionExpired() when sessionExpired != null:
return sessionExpired();case TimeSlotsStateNoInternet() when noInternet != null:
return noInternet();case _:
  return null;

}
}

}

/// @nodoc


class TimeSlotsStateInitial implements TimeSlotsState {
  const TimeSlotsStateInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TimeSlotsStateInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TimeSlotsState.initial()';
}


}




/// @nodoc


class TimeSlotsStateLoading implements TimeSlotsState {
  const TimeSlotsStateLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TimeSlotsStateLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TimeSlotsState.loading()';
}


}




/// @nodoc


class TimeSlotsStateLoaded implements TimeSlotsState {
  const TimeSlotsStateLoaded({required final  List<TimeSlotsEntity?>? timeSlots}): _timeSlots = timeSlots;
  

 final  List<TimeSlotsEntity?>? _timeSlots;
 List<TimeSlotsEntity?>? get timeSlots {
  final value = _timeSlots;
  if (value == null) return null;
  if (_timeSlots is EqualUnmodifiableListView) return _timeSlots;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of TimeSlotsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TimeSlotsStateLoadedCopyWith<TimeSlotsStateLoaded> get copyWith => _$TimeSlotsStateLoadedCopyWithImpl<TimeSlotsStateLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TimeSlotsStateLoaded&&const DeepCollectionEquality().equals(other._timeSlots, _timeSlots));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_timeSlots));

@override
String toString() {
  return 'TimeSlotsState.loaded(timeSlots: $timeSlots)';
}


}

/// @nodoc
abstract mixin class $TimeSlotsStateLoadedCopyWith<$Res> implements $TimeSlotsStateCopyWith<$Res> {
  factory $TimeSlotsStateLoadedCopyWith(TimeSlotsStateLoaded value, $Res Function(TimeSlotsStateLoaded) _then) = _$TimeSlotsStateLoadedCopyWithImpl;
@useResult
$Res call({
 List<TimeSlotsEntity?>? timeSlots
});




}
/// @nodoc
class _$TimeSlotsStateLoadedCopyWithImpl<$Res>
    implements $TimeSlotsStateLoadedCopyWith<$Res> {
  _$TimeSlotsStateLoadedCopyWithImpl(this._self, this._then);

  final TimeSlotsStateLoaded _self;
  final $Res Function(TimeSlotsStateLoaded) _then;

/// Create a copy of TimeSlotsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? timeSlots = freezed,}) {
  return _then(TimeSlotsStateLoaded(
timeSlots: freezed == timeSlots ? _self._timeSlots : timeSlots // ignore: cast_nullable_to_non_nullable
as List<TimeSlotsEntity?>?,
  ));
}


}

/// @nodoc


class TimeSlotsStateError implements TimeSlotsState {
  const TimeSlotsStateError({required this.message});
  

 final  String message;

/// Create a copy of TimeSlotsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TimeSlotsStateErrorCopyWith<TimeSlotsStateError> get copyWith => _$TimeSlotsStateErrorCopyWithImpl<TimeSlotsStateError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TimeSlotsStateError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'TimeSlotsState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $TimeSlotsStateErrorCopyWith<$Res> implements $TimeSlotsStateCopyWith<$Res> {
  factory $TimeSlotsStateErrorCopyWith(TimeSlotsStateError value, $Res Function(TimeSlotsStateError) _then) = _$TimeSlotsStateErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$TimeSlotsStateErrorCopyWithImpl<$Res>
    implements $TimeSlotsStateErrorCopyWith<$Res> {
  _$TimeSlotsStateErrorCopyWithImpl(this._self, this._then);

  final TimeSlotsStateError _self;
  final $Res Function(TimeSlotsStateError) _then;

/// Create a copy of TimeSlotsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(TimeSlotsStateError(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class TimeSlotsStateNoData implements TimeSlotsState {
  const TimeSlotsStateNoData();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TimeSlotsStateNoData);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TimeSlotsState.noData()';
}


}




/// @nodoc


class TimeSlotsStateSessionExpired implements TimeSlotsState {
  const TimeSlotsStateSessionExpired();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TimeSlotsStateSessionExpired);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TimeSlotsState.sessionExpired()';
}


}




/// @nodoc


class TimeSlotsStateNoInternet implements TimeSlotsState {
  const TimeSlotsStateNoInternet();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TimeSlotsStateNoInternet);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TimeSlotsState.noInternet()';
}


}




// dart format on
