// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'schedule_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ScheduleState {

 int get selectedMonth; int get selectedYear; List<ScheduleEntity> get allSchedules;
/// Create a copy of ScheduleState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScheduleStateCopyWith<ScheduleState> get copyWith => _$ScheduleStateCopyWithImpl<ScheduleState>(this as ScheduleState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScheduleState&&(identical(other.selectedMonth, selectedMonth) || other.selectedMonth == selectedMonth)&&(identical(other.selectedYear, selectedYear) || other.selectedYear == selectedYear)&&const DeepCollectionEquality().equals(other.allSchedules, allSchedules));
}


@override
int get hashCode => Object.hash(runtimeType,selectedMonth,selectedYear,const DeepCollectionEquality().hash(allSchedules));

@override
String toString() {
  return 'ScheduleState(selectedMonth: $selectedMonth, selectedYear: $selectedYear, allSchedules: $allSchedules)';
}


}

/// @nodoc
abstract mixin class $ScheduleStateCopyWith<$Res>  {
  factory $ScheduleStateCopyWith(ScheduleState value, $Res Function(ScheduleState) _then) = _$ScheduleStateCopyWithImpl;
@useResult
$Res call({
 int selectedMonth, int selectedYear, List<ScheduleEntity> allSchedules
});




}
/// @nodoc
class _$ScheduleStateCopyWithImpl<$Res>
    implements $ScheduleStateCopyWith<$Res> {
  _$ScheduleStateCopyWithImpl(this._self, this._then);

  final ScheduleState _self;
  final $Res Function(ScheduleState) _then;

/// Create a copy of ScheduleState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? selectedMonth = null,Object? selectedYear = null,Object? allSchedules = null,}) {
  return _then(_self.copyWith(
selectedMonth: null == selectedMonth ? _self.selectedMonth : selectedMonth // ignore: cast_nullable_to_non_nullable
as int,selectedYear: null == selectedYear ? _self.selectedYear : selectedYear // ignore: cast_nullable_to_non_nullable
as int,allSchedules: null == allSchedules ? _self.allSchedules : allSchedules // ignore: cast_nullable_to_non_nullable
as List<ScheduleEntity>,
  ));
}

}


/// Adds pattern-matching-related methods to [ScheduleState].
extension ScheduleStatePatterns on ScheduleState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ScheduleState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ScheduleState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ScheduleState value)  $default,){
final _that = this;
switch (_that) {
case _ScheduleState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ScheduleState value)?  $default,){
final _that = this;
switch (_that) {
case _ScheduleState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int selectedMonth,  int selectedYear,  List<ScheduleEntity> allSchedules)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ScheduleState() when $default != null:
return $default(_that.selectedMonth,_that.selectedYear,_that.allSchedules);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int selectedMonth,  int selectedYear,  List<ScheduleEntity> allSchedules)  $default,) {final _that = this;
switch (_that) {
case _ScheduleState():
return $default(_that.selectedMonth,_that.selectedYear,_that.allSchedules);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int selectedMonth,  int selectedYear,  List<ScheduleEntity> allSchedules)?  $default,) {final _that = this;
switch (_that) {
case _ScheduleState() when $default != null:
return $default(_that.selectedMonth,_that.selectedYear,_that.allSchedules);case _:
  return null;

}
}

}

/// @nodoc


class _ScheduleState extends ScheduleState {
  const _ScheduleState({required this.selectedMonth, required this.selectedYear, required final  List<ScheduleEntity> allSchedules}): _allSchedules = allSchedules,super._();
  

@override final  int selectedMonth;
@override final  int selectedYear;
 final  List<ScheduleEntity> _allSchedules;
@override List<ScheduleEntity> get allSchedules {
  if (_allSchedules is EqualUnmodifiableListView) return _allSchedules;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_allSchedules);
}


/// Create a copy of ScheduleState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ScheduleStateCopyWith<_ScheduleState> get copyWith => __$ScheduleStateCopyWithImpl<_ScheduleState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ScheduleState&&(identical(other.selectedMonth, selectedMonth) || other.selectedMonth == selectedMonth)&&(identical(other.selectedYear, selectedYear) || other.selectedYear == selectedYear)&&const DeepCollectionEquality().equals(other._allSchedules, _allSchedules));
}


@override
int get hashCode => Object.hash(runtimeType,selectedMonth,selectedYear,const DeepCollectionEquality().hash(_allSchedules));

@override
String toString() {
  return 'ScheduleState(selectedMonth: $selectedMonth, selectedYear: $selectedYear, allSchedules: $allSchedules)';
}


}

/// @nodoc
abstract mixin class _$ScheduleStateCopyWith<$Res> implements $ScheduleStateCopyWith<$Res> {
  factory _$ScheduleStateCopyWith(_ScheduleState value, $Res Function(_ScheduleState) _then) = __$ScheduleStateCopyWithImpl;
@override @useResult
$Res call({
 int selectedMonth, int selectedYear, List<ScheduleEntity> allSchedules
});




}
/// @nodoc
class __$ScheduleStateCopyWithImpl<$Res>
    implements _$ScheduleStateCopyWith<$Res> {
  __$ScheduleStateCopyWithImpl(this._self, this._then);

  final _ScheduleState _self;
  final $Res Function(_ScheduleState) _then;

/// Create a copy of ScheduleState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? selectedMonth = null,Object? selectedYear = null,Object? allSchedules = null,}) {
  return _then(_ScheduleState(
selectedMonth: null == selectedMonth ? _self.selectedMonth : selectedMonth // ignore: cast_nullable_to_non_nullable
as int,selectedYear: null == selectedYear ? _self.selectedYear : selectedYear // ignore: cast_nullable_to_non_nullable
as int,allSchedules: null == allSchedules ? _self._allSchedules : allSchedules // ignore: cast_nullable_to_non_nullable
as List<ScheduleEntity>,
  ));
}


}

// dart format on
