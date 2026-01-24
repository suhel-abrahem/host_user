// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rate_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RateEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RateEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RateEvent()';
}


}

/// @nodoc
class $RateEventCopyWith<$Res>  {
$RateEventCopyWith(RateEvent _, $Res Function(RateEvent) __);
}


/// Adds pattern-matching-related methods to [RateEvent].
extension RateEventPatterns on RateEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( RateEventStarted value)?  started,TResult Function( RateEventSentRate value)?  sentRate,TResult Function( RateEventGetRate value)?  getRate,TResult Function( RateEventSetRate value)?  setRate,required TResult orElse(),}){
final _that = this;
switch (_that) {
case RateEventStarted() when started != null:
return started(_that);case RateEventSentRate() when sentRate != null:
return sentRate(_that);case RateEventGetRate() when getRate != null:
return getRate(_that);case RateEventSetRate() when setRate != null:
return setRate(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( RateEventStarted value)  started,required TResult Function( RateEventSentRate value)  sentRate,required TResult Function( RateEventGetRate value)  getRate,required TResult Function( RateEventSetRate value)  setRate,}){
final _that = this;
switch (_that) {
case RateEventStarted():
return started(_that);case RateEventSentRate():
return sentRate(_that);case RateEventGetRate():
return getRate(_that);case RateEventSetRate():
return setRate(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( RateEventStarted value)?  started,TResult? Function( RateEventSentRate value)?  sentRate,TResult? Function( RateEventGetRate value)?  getRate,TResult? Function( RateEventSetRate value)?  setRate,}){
final _that = this;
switch (_that) {
case RateEventStarted() when started != null:
return started(_that);case RateEventSentRate() when sentRate != null:
return sentRate(_that);case RateEventGetRate() when getRate != null:
return getRate(_that);case RateEventSetRate() when setRate != null:
return setRate(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function( RateModel rateModel)?  sentRate,TResult Function()?  getRate,TResult Function( int? rate)?  setRate,required TResult orElse(),}) {final _that = this;
switch (_that) {
case RateEventStarted() when started != null:
return started();case RateEventSentRate() when sentRate != null:
return sentRate(_that.rateModel);case RateEventGetRate() when getRate != null:
return getRate();case RateEventSetRate() when setRate != null:
return setRate(_that.rate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function( RateModel rateModel)  sentRate,required TResult Function()  getRate,required TResult Function( int? rate)  setRate,}) {final _that = this;
switch (_that) {
case RateEventStarted():
return started();case RateEventSentRate():
return sentRate(_that.rateModel);case RateEventGetRate():
return getRate();case RateEventSetRate():
return setRate(_that.rate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function( RateModel rateModel)?  sentRate,TResult? Function()?  getRate,TResult? Function( int? rate)?  setRate,}) {final _that = this;
switch (_that) {
case RateEventStarted() when started != null:
return started();case RateEventSentRate() when sentRate != null:
return sentRate(_that.rateModel);case RateEventGetRate() when getRate != null:
return getRate();case RateEventSetRate() when setRate != null:
return setRate(_that.rate);case _:
  return null;

}
}

}

/// @nodoc


class RateEventStarted implements RateEvent {
  const RateEventStarted();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RateEventStarted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RateEvent.started()';
}


}




/// @nodoc


class RateEventSentRate implements RateEvent {
  const RateEventSentRate({required this.rateModel});
  

 final  RateModel rateModel;

/// Create a copy of RateEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RateEventSentRateCopyWith<RateEventSentRate> get copyWith => _$RateEventSentRateCopyWithImpl<RateEventSentRate>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RateEventSentRate&&(identical(other.rateModel, rateModel) || other.rateModel == rateModel));
}


@override
int get hashCode => Object.hash(runtimeType,rateModel);

@override
String toString() {
  return 'RateEvent.sentRate(rateModel: $rateModel)';
}


}

/// @nodoc
abstract mixin class $RateEventSentRateCopyWith<$Res> implements $RateEventCopyWith<$Res> {
  factory $RateEventSentRateCopyWith(RateEventSentRate value, $Res Function(RateEventSentRate) _then) = _$RateEventSentRateCopyWithImpl;
@useResult
$Res call({
 RateModel rateModel
});


$RateModelCopyWith<$Res> get rateModel;

}
/// @nodoc
class _$RateEventSentRateCopyWithImpl<$Res>
    implements $RateEventSentRateCopyWith<$Res> {
  _$RateEventSentRateCopyWithImpl(this._self, this._then);

  final RateEventSentRate _self;
  final $Res Function(RateEventSentRate) _then;

/// Create a copy of RateEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? rateModel = null,}) {
  return _then(RateEventSentRate(
rateModel: null == rateModel ? _self.rateModel : rateModel // ignore: cast_nullable_to_non_nullable
as RateModel,
  ));
}

/// Create a copy of RateEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RateModelCopyWith<$Res> get rateModel {
  
  return $RateModelCopyWith<$Res>(_self.rateModel, (value) {
    return _then(_self.copyWith(rateModel: value));
  });
}
}

/// @nodoc


class RateEventGetRate implements RateEvent {
  const RateEventGetRate();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RateEventGetRate);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RateEvent.getRate()';
}


}




/// @nodoc


class RateEventSetRate implements RateEvent {
  const RateEventSetRate({this.rate});
  

 final  int? rate;

/// Create a copy of RateEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RateEventSetRateCopyWith<RateEventSetRate> get copyWith => _$RateEventSetRateCopyWithImpl<RateEventSetRate>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RateEventSetRate&&(identical(other.rate, rate) || other.rate == rate));
}


@override
int get hashCode => Object.hash(runtimeType,rate);

@override
String toString() {
  return 'RateEvent.setRate(rate: $rate)';
}


}

/// @nodoc
abstract mixin class $RateEventSetRateCopyWith<$Res> implements $RateEventCopyWith<$Res> {
  factory $RateEventSetRateCopyWith(RateEventSetRate value, $Res Function(RateEventSetRate) _then) = _$RateEventSetRateCopyWithImpl;
@useResult
$Res call({
 int? rate
});




}
/// @nodoc
class _$RateEventSetRateCopyWithImpl<$Res>
    implements $RateEventSetRateCopyWith<$Res> {
  _$RateEventSetRateCopyWithImpl(this._self, this._then);

  final RateEventSetRate _self;
  final $Res Function(RateEventSetRate) _then;

/// Create a copy of RateEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? rate = freezed,}) {
  return _then(RateEventSetRate(
rate: freezed == rate ? _self.rate : rate // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

/// @nodoc
mixin _$RateState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RateState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RateState()';
}


}

/// @nodoc
class $RateStateCopyWith<$Res>  {
$RateStateCopyWith(RateState _, $Res Function(RateState) __);
}


/// Adds pattern-matching-related methods to [RateState].
extension RateStatePatterns on RateState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( RateStateInitial value)?  initial,TResult Function( RateStateLoading value)?  loading,TResult Function( RateStateSuccess value)?  success,TResult Function( RateStateFailure value)?  failure,TResult Function( RateStateUnauthenticated value)?  unauthenticated,TResult Function( RateStateNoInternet value)?  noInternet,TResult Function( RateStateGetRateSuccess value)?  getRateSuccess,TResult Function( RateStateSetRateSuccess value)?  setRateSuccess,required TResult orElse(),}){
final _that = this;
switch (_that) {
case RateStateInitial() when initial != null:
return initial(_that);case RateStateLoading() when loading != null:
return loading(_that);case RateStateSuccess() when success != null:
return success(_that);case RateStateFailure() when failure != null:
return failure(_that);case RateStateUnauthenticated() when unauthenticated != null:
return unauthenticated(_that);case RateStateNoInternet() when noInternet != null:
return noInternet(_that);case RateStateGetRateSuccess() when getRateSuccess != null:
return getRateSuccess(_that);case RateStateSetRateSuccess() when setRateSuccess != null:
return setRateSuccess(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( RateStateInitial value)  initial,required TResult Function( RateStateLoading value)  loading,required TResult Function( RateStateSuccess value)  success,required TResult Function( RateStateFailure value)  failure,required TResult Function( RateStateUnauthenticated value)  unauthenticated,required TResult Function( RateStateNoInternet value)  noInternet,required TResult Function( RateStateGetRateSuccess value)  getRateSuccess,required TResult Function( RateStateSetRateSuccess value)  setRateSuccess,}){
final _that = this;
switch (_that) {
case RateStateInitial():
return initial(_that);case RateStateLoading():
return loading(_that);case RateStateSuccess():
return success(_that);case RateStateFailure():
return failure(_that);case RateStateUnauthenticated():
return unauthenticated(_that);case RateStateNoInternet():
return noInternet(_that);case RateStateGetRateSuccess():
return getRateSuccess(_that);case RateStateSetRateSuccess():
return setRateSuccess(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( RateStateInitial value)?  initial,TResult? Function( RateStateLoading value)?  loading,TResult? Function( RateStateSuccess value)?  success,TResult? Function( RateStateFailure value)?  failure,TResult? Function( RateStateUnauthenticated value)?  unauthenticated,TResult? Function( RateStateNoInternet value)?  noInternet,TResult? Function( RateStateGetRateSuccess value)?  getRateSuccess,TResult? Function( RateStateSetRateSuccess value)?  setRateSuccess,}){
final _that = this;
switch (_that) {
case RateStateInitial() when initial != null:
return initial(_that);case RateStateLoading() when loading != null:
return loading(_that);case RateStateSuccess() when success != null:
return success(_that);case RateStateFailure() when failure != null:
return failure(_that);case RateStateUnauthenticated() when unauthenticated != null:
return unauthenticated(_that);case RateStateNoInternet() when noInternet != null:
return noInternet(_that);case RateStateGetRateSuccess() when getRateSuccess != null:
return getRateSuccess(_that);case RateStateSetRateSuccess() when setRateSuccess != null:
return setRateSuccess(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function()?  success,TResult Function( String error)?  failure,TResult Function( String error)?  unauthenticated,TResult Function()?  noInternet,TResult Function( int? rate)?  getRateSuccess,TResult Function( int? rate)?  setRateSuccess,required TResult orElse(),}) {final _that = this;
switch (_that) {
case RateStateInitial() when initial != null:
return initial();case RateStateLoading() when loading != null:
return loading();case RateStateSuccess() when success != null:
return success();case RateStateFailure() when failure != null:
return failure(_that.error);case RateStateUnauthenticated() when unauthenticated != null:
return unauthenticated(_that.error);case RateStateNoInternet() when noInternet != null:
return noInternet();case RateStateGetRateSuccess() when getRateSuccess != null:
return getRateSuccess(_that.rate);case RateStateSetRateSuccess() when setRateSuccess != null:
return setRateSuccess(_that.rate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function()  success,required TResult Function( String error)  failure,required TResult Function( String error)  unauthenticated,required TResult Function()  noInternet,required TResult Function( int? rate)  getRateSuccess,required TResult Function( int? rate)  setRateSuccess,}) {final _that = this;
switch (_that) {
case RateStateInitial():
return initial();case RateStateLoading():
return loading();case RateStateSuccess():
return success();case RateStateFailure():
return failure(_that.error);case RateStateUnauthenticated():
return unauthenticated(_that.error);case RateStateNoInternet():
return noInternet();case RateStateGetRateSuccess():
return getRateSuccess(_that.rate);case RateStateSetRateSuccess():
return setRateSuccess(_that.rate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function()?  success,TResult? Function( String error)?  failure,TResult? Function( String error)?  unauthenticated,TResult? Function()?  noInternet,TResult? Function( int? rate)?  getRateSuccess,TResult? Function( int? rate)?  setRateSuccess,}) {final _that = this;
switch (_that) {
case RateStateInitial() when initial != null:
return initial();case RateStateLoading() when loading != null:
return loading();case RateStateSuccess() when success != null:
return success();case RateStateFailure() when failure != null:
return failure(_that.error);case RateStateUnauthenticated() when unauthenticated != null:
return unauthenticated(_that.error);case RateStateNoInternet() when noInternet != null:
return noInternet();case RateStateGetRateSuccess() when getRateSuccess != null:
return getRateSuccess(_that.rate);case RateStateSetRateSuccess() when setRateSuccess != null:
return setRateSuccess(_that.rate);case _:
  return null;

}
}

}

/// @nodoc


class RateStateInitial implements RateState {
  const RateStateInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RateStateInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RateState.initial()';
}


}




/// @nodoc


class RateStateLoading implements RateState {
  const RateStateLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RateStateLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RateState.loading()';
}


}




/// @nodoc


class RateStateSuccess implements RateState {
  const RateStateSuccess();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RateStateSuccess);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RateState.success()';
}


}




/// @nodoc


class RateStateFailure implements RateState {
  const RateStateFailure({required this.error});
  

 final  String error;

/// Create a copy of RateState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RateStateFailureCopyWith<RateStateFailure> get copyWith => _$RateStateFailureCopyWithImpl<RateStateFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RateStateFailure&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'RateState.failure(error: $error)';
}


}

/// @nodoc
abstract mixin class $RateStateFailureCopyWith<$Res> implements $RateStateCopyWith<$Res> {
  factory $RateStateFailureCopyWith(RateStateFailure value, $Res Function(RateStateFailure) _then) = _$RateStateFailureCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class _$RateStateFailureCopyWithImpl<$Res>
    implements $RateStateFailureCopyWith<$Res> {
  _$RateStateFailureCopyWithImpl(this._self, this._then);

  final RateStateFailure _self;
  final $Res Function(RateStateFailure) _then;

/// Create a copy of RateState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(RateStateFailure(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class RateStateUnauthenticated implements RateState {
  const RateStateUnauthenticated({required this.error});
  

 final  String error;

/// Create a copy of RateState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RateStateUnauthenticatedCopyWith<RateStateUnauthenticated> get copyWith => _$RateStateUnauthenticatedCopyWithImpl<RateStateUnauthenticated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RateStateUnauthenticated&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'RateState.unauthenticated(error: $error)';
}


}

/// @nodoc
abstract mixin class $RateStateUnauthenticatedCopyWith<$Res> implements $RateStateCopyWith<$Res> {
  factory $RateStateUnauthenticatedCopyWith(RateStateUnauthenticated value, $Res Function(RateStateUnauthenticated) _then) = _$RateStateUnauthenticatedCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class _$RateStateUnauthenticatedCopyWithImpl<$Res>
    implements $RateStateUnauthenticatedCopyWith<$Res> {
  _$RateStateUnauthenticatedCopyWithImpl(this._self, this._then);

  final RateStateUnauthenticated _self;
  final $Res Function(RateStateUnauthenticated) _then;

/// Create a copy of RateState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(RateStateUnauthenticated(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class RateStateNoInternet implements RateState {
  const RateStateNoInternet();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RateStateNoInternet);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RateState.noInternet()';
}


}




/// @nodoc


class RateStateGetRateSuccess implements RateState {
  const RateStateGetRateSuccess({required this.rate});
  

 final  int? rate;

/// Create a copy of RateState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RateStateGetRateSuccessCopyWith<RateStateGetRateSuccess> get copyWith => _$RateStateGetRateSuccessCopyWithImpl<RateStateGetRateSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RateStateGetRateSuccess&&(identical(other.rate, rate) || other.rate == rate));
}


@override
int get hashCode => Object.hash(runtimeType,rate);

@override
String toString() {
  return 'RateState.getRateSuccess(rate: $rate)';
}


}

/// @nodoc
abstract mixin class $RateStateGetRateSuccessCopyWith<$Res> implements $RateStateCopyWith<$Res> {
  factory $RateStateGetRateSuccessCopyWith(RateStateGetRateSuccess value, $Res Function(RateStateGetRateSuccess) _then) = _$RateStateGetRateSuccessCopyWithImpl;
@useResult
$Res call({
 int? rate
});




}
/// @nodoc
class _$RateStateGetRateSuccessCopyWithImpl<$Res>
    implements $RateStateGetRateSuccessCopyWith<$Res> {
  _$RateStateGetRateSuccessCopyWithImpl(this._self, this._then);

  final RateStateGetRateSuccess _self;
  final $Res Function(RateStateGetRateSuccess) _then;

/// Create a copy of RateState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? rate = freezed,}) {
  return _then(RateStateGetRateSuccess(
rate: freezed == rate ? _self.rate : rate // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

/// @nodoc


class RateStateSetRateSuccess implements RateState {
  const RateStateSetRateSuccess({required this.rate});
  

 final  int? rate;

/// Create a copy of RateState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RateStateSetRateSuccessCopyWith<RateStateSetRateSuccess> get copyWith => _$RateStateSetRateSuccessCopyWithImpl<RateStateSetRateSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RateStateSetRateSuccess&&(identical(other.rate, rate) || other.rate == rate));
}


@override
int get hashCode => Object.hash(runtimeType,rate);

@override
String toString() {
  return 'RateState.setRateSuccess(rate: $rate)';
}


}

/// @nodoc
abstract mixin class $RateStateSetRateSuccessCopyWith<$Res> implements $RateStateCopyWith<$Res> {
  factory $RateStateSetRateSuccessCopyWith(RateStateSetRateSuccess value, $Res Function(RateStateSetRateSuccess) _then) = _$RateStateSetRateSuccessCopyWithImpl;
@useResult
$Res call({
 int? rate
});




}
/// @nodoc
class _$RateStateSetRateSuccessCopyWithImpl<$Res>
    implements $RateStateSetRateSuccessCopyWith<$Res> {
  _$RateStateSetRateSuccessCopyWithImpl(this._self, this._then);

  final RateStateSetRateSuccess _self;
  final $Res Function(RateStateSetRateSuccess) _then;

/// Create a copy of RateState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? rate = freezed,}) {
  return _then(RateStateSetRateSuccess(
rate: freezed == rate ? _self.rate : rate // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
