// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'time_table_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TimeTableState {

 String get selectedClass; DateTime get currentMonday; List<TimeTableEntity> get list;
/// Create a copy of TimeTableState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TimeTableStateCopyWith<TimeTableState> get copyWith => _$TimeTableStateCopyWithImpl<TimeTableState>(this as TimeTableState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TimeTableState&&(identical(other.selectedClass, selectedClass) || other.selectedClass == selectedClass)&&(identical(other.currentMonday, currentMonday) || other.currentMonday == currentMonday)&&const DeepCollectionEquality().equals(other.list, list));
}


@override
int get hashCode => Object.hash(runtimeType,selectedClass,currentMonday,const DeepCollectionEquality().hash(list));

@override
String toString() {
  return 'TimeTableState(selectedClass: $selectedClass, currentMonday: $currentMonday, list: $list)';
}


}

/// @nodoc
abstract mixin class $TimeTableStateCopyWith<$Res>  {
  factory $TimeTableStateCopyWith(TimeTableState value, $Res Function(TimeTableState) _then) = _$TimeTableStateCopyWithImpl;
@useResult
$Res call({
 String selectedClass, DateTime currentMonday, List<TimeTableEntity> list
});




}
/// @nodoc
class _$TimeTableStateCopyWithImpl<$Res>
    implements $TimeTableStateCopyWith<$Res> {
  _$TimeTableStateCopyWithImpl(this._self, this._then);

  final TimeTableState _self;
  final $Res Function(TimeTableState) _then;

/// Create a copy of TimeTableState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? selectedClass = null,Object? currentMonday = null,Object? list = null,}) {
  return _then(_self.copyWith(
selectedClass: null == selectedClass ? _self.selectedClass : selectedClass // ignore: cast_nullable_to_non_nullable
as String,currentMonday: null == currentMonday ? _self.currentMonday : currentMonday // ignore: cast_nullable_to_non_nullable
as DateTime,list: null == list ? _self.list : list // ignore: cast_nullable_to_non_nullable
as List<TimeTableEntity>,
  ));
}

}


/// Adds pattern-matching-related methods to [TimeTableState].
extension TimeTableStatePatterns on TimeTableState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TimeTableState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TimeTableState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TimeTableState value)  $default,){
final _that = this;
switch (_that) {
case _TimeTableState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TimeTableState value)?  $default,){
final _that = this;
switch (_that) {
case _TimeTableState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String selectedClass,  DateTime currentMonday,  List<TimeTableEntity> list)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TimeTableState() when $default != null:
return $default(_that.selectedClass,_that.currentMonday,_that.list);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String selectedClass,  DateTime currentMonday,  List<TimeTableEntity> list)  $default,) {final _that = this;
switch (_that) {
case _TimeTableState():
return $default(_that.selectedClass,_that.currentMonday,_that.list);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String selectedClass,  DateTime currentMonday,  List<TimeTableEntity> list)?  $default,) {final _that = this;
switch (_that) {
case _TimeTableState() when $default != null:
return $default(_that.selectedClass,_that.currentMonday,_that.list);case _:
  return null;

}
}

}

/// @nodoc


class _TimeTableState extends TimeTableState {
  const _TimeTableState({required this.selectedClass, required this.currentMonday, required final  List<TimeTableEntity> list}): _list = list,super._();
  

@override final  String selectedClass;
@override final  DateTime currentMonday;
 final  List<TimeTableEntity> _list;
@override List<TimeTableEntity> get list {
  if (_list is EqualUnmodifiableListView) return _list;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_list);
}


/// Create a copy of TimeTableState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TimeTableStateCopyWith<_TimeTableState> get copyWith => __$TimeTableStateCopyWithImpl<_TimeTableState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TimeTableState&&(identical(other.selectedClass, selectedClass) || other.selectedClass == selectedClass)&&(identical(other.currentMonday, currentMonday) || other.currentMonday == currentMonday)&&const DeepCollectionEquality().equals(other._list, _list));
}


@override
int get hashCode => Object.hash(runtimeType,selectedClass,currentMonday,const DeepCollectionEquality().hash(_list));

@override
String toString() {
  return 'TimeTableState(selectedClass: $selectedClass, currentMonday: $currentMonday, list: $list)';
}


}

/// @nodoc
abstract mixin class _$TimeTableStateCopyWith<$Res> implements $TimeTableStateCopyWith<$Res> {
  factory _$TimeTableStateCopyWith(_TimeTableState value, $Res Function(_TimeTableState) _then) = __$TimeTableStateCopyWithImpl;
@override @useResult
$Res call({
 String selectedClass, DateTime currentMonday, List<TimeTableEntity> list
});




}
/// @nodoc
class __$TimeTableStateCopyWithImpl<$Res>
    implements _$TimeTableStateCopyWith<$Res> {
  __$TimeTableStateCopyWithImpl(this._self, this._then);

  final _TimeTableState _self;
  final $Res Function(_TimeTableState) _then;

/// Create a copy of TimeTableState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? selectedClass = null,Object? currentMonday = null,Object? list = null,}) {
  return _then(_TimeTableState(
selectedClass: null == selectedClass ? _self.selectedClass : selectedClass // ignore: cast_nullable_to_non_nullable
as String,currentMonday: null == currentMonday ? _self.currentMonday : currentMonday // ignore: cast_nullable_to_non_nullable
as DateTime,list: null == list ? _self._list : list // ignore: cast_nullable_to_non_nullable
as List<TimeTableEntity>,
  ));
}


}

// dart format on
