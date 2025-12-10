// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'meal_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MealState {

 DateTime get selectedDate; List<MealEntity> get allMeals;
/// Create a copy of MealState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MealStateCopyWith<MealState> get copyWith => _$MealStateCopyWithImpl<MealState>(this as MealState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MealState&&(identical(other.selectedDate, selectedDate) || other.selectedDate == selectedDate)&&const DeepCollectionEquality().equals(other.allMeals, allMeals));
}


@override
int get hashCode => Object.hash(runtimeType,selectedDate,const DeepCollectionEquality().hash(allMeals));

@override
String toString() {
  return 'MealState(selectedDate: $selectedDate, allMeals: $allMeals)';
}


}

/// @nodoc
abstract mixin class $MealStateCopyWith<$Res>  {
  factory $MealStateCopyWith(MealState value, $Res Function(MealState) _then) = _$MealStateCopyWithImpl;
@useResult
$Res call({
 DateTime selectedDate, List<MealEntity> allMeals
});




}
/// @nodoc
class _$MealStateCopyWithImpl<$Res>
    implements $MealStateCopyWith<$Res> {
  _$MealStateCopyWithImpl(this._self, this._then);

  final MealState _self;
  final $Res Function(MealState) _then;

/// Create a copy of MealState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? selectedDate = null,Object? allMeals = null,}) {
  return _then(_self.copyWith(
selectedDate: null == selectedDate ? _self.selectedDate : selectedDate // ignore: cast_nullable_to_non_nullable
as DateTime,allMeals: null == allMeals ? _self.allMeals : allMeals // ignore: cast_nullable_to_non_nullable
as List<MealEntity>,
  ));
}

}


/// Adds pattern-matching-related methods to [MealState].
extension MealStatePatterns on MealState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MealState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MealState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MealState value)  $default,){
final _that = this;
switch (_that) {
case _MealState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MealState value)?  $default,){
final _that = this;
switch (_that) {
case _MealState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime selectedDate,  List<MealEntity> allMeals)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MealState() when $default != null:
return $default(_that.selectedDate,_that.allMeals);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime selectedDate,  List<MealEntity> allMeals)  $default,) {final _that = this;
switch (_that) {
case _MealState():
return $default(_that.selectedDate,_that.allMeals);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime selectedDate,  List<MealEntity> allMeals)?  $default,) {final _that = this;
switch (_that) {
case _MealState() when $default != null:
return $default(_that.selectedDate,_that.allMeals);case _:
  return null;

}
}

}

/// @nodoc


class _MealState extends MealState {
  const _MealState({required this.selectedDate, required final  List<MealEntity> allMeals}): _allMeals = allMeals,super._();
  

@override final  DateTime selectedDate;
 final  List<MealEntity> _allMeals;
@override List<MealEntity> get allMeals {
  if (_allMeals is EqualUnmodifiableListView) return _allMeals;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_allMeals);
}


/// Create a copy of MealState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MealStateCopyWith<_MealState> get copyWith => __$MealStateCopyWithImpl<_MealState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MealState&&(identical(other.selectedDate, selectedDate) || other.selectedDate == selectedDate)&&const DeepCollectionEquality().equals(other._allMeals, _allMeals));
}


@override
int get hashCode => Object.hash(runtimeType,selectedDate,const DeepCollectionEquality().hash(_allMeals));

@override
String toString() {
  return 'MealState(selectedDate: $selectedDate, allMeals: $allMeals)';
}


}

/// @nodoc
abstract mixin class _$MealStateCopyWith<$Res> implements $MealStateCopyWith<$Res> {
  factory _$MealStateCopyWith(_MealState value, $Res Function(_MealState) _then) = __$MealStateCopyWithImpl;
@override @useResult
$Res call({
 DateTime selectedDate, List<MealEntity> allMeals
});




}
/// @nodoc
class __$MealStateCopyWithImpl<$Res>
    implements _$MealStateCopyWith<$Res> {
  __$MealStateCopyWithImpl(this._self, this._then);

  final _MealState _self;
  final $Res Function(_MealState) _then;

/// Create a copy of MealState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? selectedDate = null,Object? allMeals = null,}) {
  return _then(_MealState(
selectedDate: null == selectedDate ? _self.selectedDate : selectedDate // ignore: cast_nullable_to_non_nullable
as DateTime,allMeals: null == allMeals ? _self._allMeals : allMeals // ignore: cast_nullable_to_non_nullable
as List<MealEntity>,
  ));
}


}

// dart format on
