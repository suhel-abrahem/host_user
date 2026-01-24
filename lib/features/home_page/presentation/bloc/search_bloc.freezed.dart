// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SearchEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SearchEvent()';
}


}

/// @nodoc
class $SearchEventCopyWith<$Res>  {
$SearchEventCopyWith(SearchEvent _, $Res Function(SearchEvent) __);
}


/// Adds pattern-matching-related methods to [SearchEvent].
extension SearchEventPatterns on SearchEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( SearchEventStarted value)?  started,TResult Function( SearchEventSearchItems value)?  searchItems,required TResult orElse(),}){
final _that = this;
switch (_that) {
case SearchEventStarted() when started != null:
return started(_that);case SearchEventSearchItems() when searchItems != null:
return searchItems(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( SearchEventStarted value)  started,required TResult Function( SearchEventSearchItems value)  searchItems,}){
final _that = this;
switch (_that) {
case SearchEventStarted():
return started(_that);case SearchEventSearchItems():
return searchItems(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( SearchEventStarted value)?  started,TResult? Function( SearchEventSearchItems value)?  searchItems,}){
final _that = this;
switch (_that) {
case SearchEventStarted() when started != null:
return started(_that);case SearchEventSearchItems() when searchItems != null:
return searchItems(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function( SearchModel? model)?  searchItems,required TResult orElse(),}) {final _that = this;
switch (_that) {
case SearchEventStarted() when started != null:
return started();case SearchEventSearchItems() when searchItems != null:
return searchItems(_that.model);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function( SearchModel? model)  searchItems,}) {final _that = this;
switch (_that) {
case SearchEventStarted():
return started();case SearchEventSearchItems():
return searchItems(_that.model);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function( SearchModel? model)?  searchItems,}) {final _that = this;
switch (_that) {
case SearchEventStarted() when started != null:
return started();case SearchEventSearchItems() when searchItems != null:
return searchItems(_that.model);case _:
  return null;

}
}

}

/// @nodoc


class SearchEventStarted implements SearchEvent {
  const SearchEventStarted();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchEventStarted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SearchEvent.started()';
}


}




/// @nodoc


class SearchEventSearchItems implements SearchEvent {
  const SearchEventSearchItems({required this.model});
  

 final  SearchModel? model;

/// Create a copy of SearchEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchEventSearchItemsCopyWith<SearchEventSearchItems> get copyWith => _$SearchEventSearchItemsCopyWithImpl<SearchEventSearchItems>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchEventSearchItems&&(identical(other.model, model) || other.model == model));
}


@override
int get hashCode => Object.hash(runtimeType,model);

@override
String toString() {
  return 'SearchEvent.searchItems(model: $model)';
}


}

/// @nodoc
abstract mixin class $SearchEventSearchItemsCopyWith<$Res> implements $SearchEventCopyWith<$Res> {
  factory $SearchEventSearchItemsCopyWith(SearchEventSearchItems value, $Res Function(SearchEventSearchItems) _then) = _$SearchEventSearchItemsCopyWithImpl;
@useResult
$Res call({
 SearchModel? model
});


$SearchModelCopyWith<$Res>? get model;

}
/// @nodoc
class _$SearchEventSearchItemsCopyWithImpl<$Res>
    implements $SearchEventSearchItemsCopyWith<$Res> {
  _$SearchEventSearchItemsCopyWithImpl(this._self, this._then);

  final SearchEventSearchItems _self;
  final $Res Function(SearchEventSearchItems) _then;

/// Create a copy of SearchEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? model = freezed,}) {
  return _then(SearchEventSearchItems(
model: freezed == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as SearchModel?,
  ));
}

/// Create a copy of SearchEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SearchModelCopyWith<$Res>? get model {
    if (_self.model == null) {
    return null;
  }

  return $SearchModelCopyWith<$Res>(_self.model!, (value) {
    return _then(_self.copyWith(model: value));
  });
}
}

/// @nodoc
mixin _$SearchState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SearchState()';
}


}

/// @nodoc
class $SearchStateCopyWith<$Res>  {
$SearchStateCopyWith(SearchState _, $Res Function(SearchState) __);
}


/// Adds pattern-matching-related methods to [SearchState].
extension SearchStatePatterns on SearchState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( SearchStateInitial value)?  initial,TResult Function( SearchStateLoading value)?  loading,TResult Function( SearchStateLoaded value)?  loaded,TResult Function( SearchStateError value)?  error,TResult Function( SearchStateNoResults value)?  noResults,TResult Function( SearchStateNoInternet value)?  noInternet,TResult Function( SearchStateUnauthenticated value)?  unauthenticated,required TResult orElse(),}){
final _that = this;
switch (_that) {
case SearchStateInitial() when initial != null:
return initial(_that);case SearchStateLoading() when loading != null:
return loading(_that);case SearchStateLoaded() when loaded != null:
return loaded(_that);case SearchStateError() when error != null:
return error(_that);case SearchStateNoResults() when noResults != null:
return noResults(_that);case SearchStateNoInternet() when noInternet != null:
return noInternet(_that);case SearchStateUnauthenticated() when unauthenticated != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( SearchStateInitial value)  initial,required TResult Function( SearchStateLoading value)  loading,required TResult Function( SearchStateLoaded value)  loaded,required TResult Function( SearchStateError value)  error,required TResult Function( SearchStateNoResults value)  noResults,required TResult Function( SearchStateNoInternet value)  noInternet,required TResult Function( SearchStateUnauthenticated value)  unauthenticated,}){
final _that = this;
switch (_that) {
case SearchStateInitial():
return initial(_that);case SearchStateLoading():
return loading(_that);case SearchStateLoaded():
return loaded(_that);case SearchStateError():
return error(_that);case SearchStateNoResults():
return noResults(_that);case SearchStateNoInternet():
return noInternet(_that);case SearchStateUnauthenticated():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( SearchStateInitial value)?  initial,TResult? Function( SearchStateLoading value)?  loading,TResult? Function( SearchStateLoaded value)?  loaded,TResult? Function( SearchStateError value)?  error,TResult? Function( SearchStateNoResults value)?  noResults,TResult? Function( SearchStateNoInternet value)?  noInternet,TResult? Function( SearchStateUnauthenticated value)?  unauthenticated,}){
final _that = this;
switch (_that) {
case SearchStateInitial() when initial != null:
return initial(_that);case SearchStateLoading() when loading != null:
return loading(_that);case SearchStateLoaded() when loaded != null:
return loaded(_that);case SearchStateError() when error != null:
return error(_that);case SearchStateNoResults() when noResults != null:
return noResults(_that);case SearchStateNoInternet() when noInternet != null:
return noInternet(_that);case SearchStateUnauthenticated() when unauthenticated != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<SearchEntity?>? results)?  loaded,TResult Function( String? message)?  error,TResult Function()?  noResults,TResult Function()?  noInternet,TResult Function()?  unauthenticated,required TResult orElse(),}) {final _that = this;
switch (_that) {
case SearchStateInitial() when initial != null:
return initial();case SearchStateLoading() when loading != null:
return loading();case SearchStateLoaded() when loaded != null:
return loaded(_that.results);case SearchStateError() when error != null:
return error(_that.message);case SearchStateNoResults() when noResults != null:
return noResults();case SearchStateNoInternet() when noInternet != null:
return noInternet();case SearchStateUnauthenticated() when unauthenticated != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<SearchEntity?>? results)  loaded,required TResult Function( String? message)  error,required TResult Function()  noResults,required TResult Function()  noInternet,required TResult Function()  unauthenticated,}) {final _that = this;
switch (_that) {
case SearchStateInitial():
return initial();case SearchStateLoading():
return loading();case SearchStateLoaded():
return loaded(_that.results);case SearchStateError():
return error(_that.message);case SearchStateNoResults():
return noResults();case SearchStateNoInternet():
return noInternet();case SearchStateUnauthenticated():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<SearchEntity?>? results)?  loaded,TResult? Function( String? message)?  error,TResult? Function()?  noResults,TResult? Function()?  noInternet,TResult? Function()?  unauthenticated,}) {final _that = this;
switch (_that) {
case SearchStateInitial() when initial != null:
return initial();case SearchStateLoading() when loading != null:
return loading();case SearchStateLoaded() when loaded != null:
return loaded(_that.results);case SearchStateError() when error != null:
return error(_that.message);case SearchStateNoResults() when noResults != null:
return noResults();case SearchStateNoInternet() when noInternet != null:
return noInternet();case SearchStateUnauthenticated() when unauthenticated != null:
return unauthenticated();case _:
  return null;

}
}

}

/// @nodoc


class SearchStateInitial implements SearchState {
  const SearchStateInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchStateInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SearchState.initial()';
}


}




/// @nodoc


class SearchStateLoading implements SearchState {
  const SearchStateLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchStateLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SearchState.loading()';
}


}




/// @nodoc


class SearchStateLoaded implements SearchState {
  const SearchStateLoaded({required final  List<SearchEntity?>? results}): _results = results;
  

 final  List<SearchEntity?>? _results;
 List<SearchEntity?>? get results {
  final value = _results;
  if (value == null) return null;
  if (_results is EqualUnmodifiableListView) return _results;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchStateLoadedCopyWith<SearchStateLoaded> get copyWith => _$SearchStateLoadedCopyWithImpl<SearchStateLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchStateLoaded&&const DeepCollectionEquality().equals(other._results, _results));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_results));

@override
String toString() {
  return 'SearchState.loaded(results: $results)';
}


}

/// @nodoc
abstract mixin class $SearchStateLoadedCopyWith<$Res> implements $SearchStateCopyWith<$Res> {
  factory $SearchStateLoadedCopyWith(SearchStateLoaded value, $Res Function(SearchStateLoaded) _then) = _$SearchStateLoadedCopyWithImpl;
@useResult
$Res call({
 List<SearchEntity?>? results
});




}
/// @nodoc
class _$SearchStateLoadedCopyWithImpl<$Res>
    implements $SearchStateLoadedCopyWith<$Res> {
  _$SearchStateLoadedCopyWithImpl(this._self, this._then);

  final SearchStateLoaded _self;
  final $Res Function(SearchStateLoaded) _then;

/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? results = freezed,}) {
  return _then(SearchStateLoaded(
results: freezed == results ? _self._results : results // ignore: cast_nullable_to_non_nullable
as List<SearchEntity?>?,
  ));
}


}

/// @nodoc


class SearchStateError implements SearchState {
  const SearchStateError({required this.message});
  

 final  String? message;

/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchStateErrorCopyWith<SearchStateError> get copyWith => _$SearchStateErrorCopyWithImpl<SearchStateError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchStateError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'SearchState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $SearchStateErrorCopyWith<$Res> implements $SearchStateCopyWith<$Res> {
  factory $SearchStateErrorCopyWith(SearchStateError value, $Res Function(SearchStateError) _then) = _$SearchStateErrorCopyWithImpl;
@useResult
$Res call({
 String? message
});




}
/// @nodoc
class _$SearchStateErrorCopyWithImpl<$Res>
    implements $SearchStateErrorCopyWith<$Res> {
  _$SearchStateErrorCopyWithImpl(this._self, this._then);

  final SearchStateError _self;
  final $Res Function(SearchStateError) _then;

/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = freezed,}) {
  return _then(SearchStateError(
message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class SearchStateNoResults implements SearchState {
  const SearchStateNoResults();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchStateNoResults);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SearchState.noResults()';
}


}




/// @nodoc


class SearchStateNoInternet implements SearchState {
  const SearchStateNoInternet();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchStateNoInternet);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SearchState.noInternet()';
}


}




/// @nodoc


class SearchStateUnauthenticated implements SearchState {
  const SearchStateUnauthenticated();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchStateUnauthenticated);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SearchState.unauthenticated()';
}


}




// dart format on
