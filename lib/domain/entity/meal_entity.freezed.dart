// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'meal_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MealEntity {

 DateTime get date;// 날짜
 MealType get type;// 아침점심저녁 구분
 List<String> get dishes;// 급식메뉴 명
 String? get kcal;
/// Create a copy of MealEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MealEntityCopyWith<MealEntity> get copyWith => _$MealEntityCopyWithImpl<MealEntity>(this as MealEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MealEntity&&(identical(other.date, date) || other.date == date)&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other.dishes, dishes)&&(identical(other.kcal, kcal) || other.kcal == kcal));
}


@override
int get hashCode => Object.hash(runtimeType,date,type,const DeepCollectionEquality().hash(dishes),kcal);

@override
String toString() {
  return 'MealEntity(date: $date, type: $type, dishes: $dishes, kcal: $kcal)';
}


}

/// @nodoc
abstract mixin class $MealEntityCopyWith<$Res>  {
  factory $MealEntityCopyWith(MealEntity value, $Res Function(MealEntity) _then) = _$MealEntityCopyWithImpl;
@useResult
$Res call({
 DateTime date, MealType type, List<String> dishes, String? kcal
});




}
/// @nodoc
class _$MealEntityCopyWithImpl<$Res>
    implements $MealEntityCopyWith<$Res> {
  _$MealEntityCopyWithImpl(this._self, this._then);

  final MealEntity _self;
  final $Res Function(MealEntity) _then;

/// Create a copy of MealEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? date = null,Object? type = null,Object? dishes = null,Object? kcal = freezed,}) {
  return _then(_self.copyWith(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as MealType,dishes: null == dishes ? _self.dishes : dishes // ignore: cast_nullable_to_non_nullable
as List<String>,kcal: freezed == kcal ? _self.kcal : kcal // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [MealEntity].
extension MealEntityPatterns on MealEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MealEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MealEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MealEntity value)  $default,){
final _that = this;
switch (_that) {
case _MealEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MealEntity value)?  $default,){
final _that = this;
switch (_that) {
case _MealEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime date,  MealType type,  List<String> dishes,  String? kcal)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MealEntity() when $default != null:
return $default(_that.date,_that.type,_that.dishes,_that.kcal);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime date,  MealType type,  List<String> dishes,  String? kcal)  $default,) {final _that = this;
switch (_that) {
case _MealEntity():
return $default(_that.date,_that.type,_that.dishes,_that.kcal);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime date,  MealType type,  List<String> dishes,  String? kcal)?  $default,) {final _that = this;
switch (_that) {
case _MealEntity() when $default != null:
return $default(_that.date,_that.type,_that.dishes,_that.kcal);case _:
  return null;

}
}

}

/// @nodoc


class _MealEntity implements MealEntity {
  const _MealEntity({required this.date, required this.type, required final  List<String> dishes, this.kcal}): _dishes = dishes;
  

@override final  DateTime date;
// 날짜
@override final  MealType type;
// 아침점심저녁 구분
 final  List<String> _dishes;
// 아침점심저녁 구분
@override List<String> get dishes {
  if (_dishes is EqualUnmodifiableListView) return _dishes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_dishes);
}

// 급식메뉴 명
@override final  String? kcal;

/// Create a copy of MealEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MealEntityCopyWith<_MealEntity> get copyWith => __$MealEntityCopyWithImpl<_MealEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MealEntity&&(identical(other.date, date) || other.date == date)&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other._dishes, _dishes)&&(identical(other.kcal, kcal) || other.kcal == kcal));
}


@override
int get hashCode => Object.hash(runtimeType,date,type,const DeepCollectionEquality().hash(_dishes),kcal);

@override
String toString() {
  return 'MealEntity(date: $date, type: $type, dishes: $dishes, kcal: $kcal)';
}


}

/// @nodoc
abstract mixin class _$MealEntityCopyWith<$Res> implements $MealEntityCopyWith<$Res> {
  factory _$MealEntityCopyWith(_MealEntity value, $Res Function(_MealEntity) _then) = __$MealEntityCopyWithImpl;
@override @useResult
$Res call({
 DateTime date, MealType type, List<String> dishes, String? kcal
});




}
/// @nodoc
class __$MealEntityCopyWithImpl<$Res>
    implements _$MealEntityCopyWith<$Res> {
  __$MealEntityCopyWithImpl(this._self, this._then);

  final _MealEntity _self;
  final $Res Function(_MealEntity) _then;

/// Create a copy of MealEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = null,Object? type = null,Object? dishes = null,Object? kcal = freezed,}) {
  return _then(_MealEntity(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as MealType,dishes: null == dishes ? _self._dishes : dishes // ignore: cast_nullable_to_non_nullable
as List<String>,kcal: freezed == kcal ? _self.kcal : kcal // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
