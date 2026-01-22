// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SearchEntity {

 int? get id; String? get name; String? get image; bool? get is_active; Map<String, dynamic>? get category;
/// Create a copy of SearchEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchEntityCopyWith<SearchEntity> get copyWith => _$SearchEntityCopyWithImpl<SearchEntity>(this as SearchEntity, _$identity);

  /// Serializes this SearchEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.image, image) || other.image == image)&&(identical(other.is_active, is_active) || other.is_active == is_active)&&const DeepCollectionEquality().equals(other.category, category));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,image,is_active,const DeepCollectionEquality().hash(category));

@override
String toString() {
  return 'SearchEntity(id: $id, name: $name, image: $image, is_active: $is_active, category: $category)';
}


}

/// @nodoc
abstract mixin class $SearchEntityCopyWith<$Res>  {
  factory $SearchEntityCopyWith(SearchEntity value, $Res Function(SearchEntity) _then) = _$SearchEntityCopyWithImpl;
@useResult
$Res call({
 int? id, String? name, String? image, bool? is_active, Map<String, dynamic>? category
});




}
/// @nodoc
class _$SearchEntityCopyWithImpl<$Res>
    implements $SearchEntityCopyWith<$Res> {
  _$SearchEntityCopyWithImpl(this._self, this._then);

  final SearchEntity _self;
  final $Res Function(SearchEntity) _then;

/// Create a copy of SearchEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = freezed,Object? image = freezed,Object? is_active = freezed,Object? category = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,is_active: freezed == is_active ? _self.is_active : is_active // ignore: cast_nullable_to_non_nullable
as bool?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}

}


/// Adds pattern-matching-related methods to [SearchEntity].
extension SearchEntityPatterns on SearchEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SearchEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SearchEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SearchEntity value)  $default,){
final _that = this;
switch (_that) {
case _SearchEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SearchEntity value)?  $default,){
final _that = this;
switch (_that) {
case _SearchEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String? name,  String? image,  bool? is_active,  Map<String, dynamic>? category)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchEntity() when $default != null:
return $default(_that.id,_that.name,_that.image,_that.is_active,_that.category);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String? name,  String? image,  bool? is_active,  Map<String, dynamic>? category)  $default,) {final _that = this;
switch (_that) {
case _SearchEntity():
return $default(_that.id,_that.name,_that.image,_that.is_active,_that.category);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String? name,  String? image,  bool? is_active,  Map<String, dynamic>? category)?  $default,) {final _that = this;
switch (_that) {
case _SearchEntity() when $default != null:
return $default(_that.id,_that.name,_that.image,_that.is_active,_that.category);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SearchEntity implements SearchEntity {
  const _SearchEntity({this.id = 0, this.name = "", this.image = "", this.is_active = false, final  Map<String, dynamic>? category = const {}}): _category = category;
  factory _SearchEntity.fromJson(Map<String, dynamic> json) => _$SearchEntityFromJson(json);

@override@JsonKey() final  int? id;
@override@JsonKey() final  String? name;
@override@JsonKey() final  String? image;
@override@JsonKey() final  bool? is_active;
 final  Map<String, dynamic>? _category;
@override@JsonKey() Map<String, dynamic>? get category {
  final value = _category;
  if (value == null) return null;
  if (_category is EqualUnmodifiableMapView) return _category;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of SearchEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchEntityCopyWith<_SearchEntity> get copyWith => __$SearchEntityCopyWithImpl<_SearchEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SearchEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.image, image) || other.image == image)&&(identical(other.is_active, is_active) || other.is_active == is_active)&&const DeepCollectionEquality().equals(other._category, _category));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,image,is_active,const DeepCollectionEquality().hash(_category));

@override
String toString() {
  return 'SearchEntity(id: $id, name: $name, image: $image, is_active: $is_active, category: $category)';
}


}

/// @nodoc
abstract mixin class _$SearchEntityCopyWith<$Res> implements $SearchEntityCopyWith<$Res> {
  factory _$SearchEntityCopyWith(_SearchEntity value, $Res Function(_SearchEntity) _then) = __$SearchEntityCopyWithImpl;
@override @useResult
$Res call({
 int? id, String? name, String? image, bool? is_active, Map<String, dynamic>? category
});




}
/// @nodoc
class __$SearchEntityCopyWithImpl<$Res>
    implements _$SearchEntityCopyWith<$Res> {
  __$SearchEntityCopyWithImpl(this._self, this._then);

  final _SearchEntity _self;
  final $Res Function(_SearchEntity) _then;

/// Create a copy of SearchEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = freezed,Object? image = freezed,Object? is_active = freezed,Object? category = freezed,}) {
  return _then(_SearchEntity(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,is_active: freezed == is_active ? _self.is_active : is_active // ignore: cast_nullable_to_non_nullable
as bool?,category: freezed == category ? _self._category : category // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}


}

// dart format on
