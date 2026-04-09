// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'schedule_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ScheduleEntity {

 DateTime get date; String get eventName; List<int> get grades;
/// Create a copy of ScheduleEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScheduleEntityCopyWith<ScheduleEntity> get copyWith => _$ScheduleEntityCopyWithImpl<ScheduleEntity>(this as ScheduleEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScheduleEntity&&(identical(other.date, date) || other.date == date)&&(identical(other.eventName, eventName) || other.eventName == eventName)&&const DeepCollectionEquality().equals(other.grades, grades));
}


@override
int get hashCode => Object.hash(runtimeType,date,eventName,const DeepCollectionEquality().hash(grades));

@override
String toString() {
  return 'ScheduleEntity(date: $date, eventName: $eventName, grades: $grades)';
}


}

/// @nodoc
abstract mixin class $ScheduleEntityCopyWith<$Res>  {
  factory $ScheduleEntityCopyWith(ScheduleEntity value, $Res Function(ScheduleEntity) _then) = _$ScheduleEntityCopyWithImpl;
@useResult
$Res call({
 DateTime date, String eventName, List<int> grades
});




}
/// @nodoc
class _$ScheduleEntityCopyWithImpl<$Res>
    implements $ScheduleEntityCopyWith<$Res> {
  _$ScheduleEntityCopyWithImpl(this._self, this._then);

  final ScheduleEntity _self;
  final $Res Function(ScheduleEntity) _then;

/// Create a copy of ScheduleEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? date = null,Object? eventName = null,Object? grades = null,}) {
  return _then(_self.copyWith(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,eventName: null == eventName ? _self.eventName : eventName // ignore: cast_nullable_to_non_nullable
as String,grades: null == grades ? _self.grades : grades // ignore: cast_nullable_to_non_nullable
as List<int>,
  ));
}

}


/// Adds pattern-matching-related methods to [ScheduleEntity].
extension ScheduleEntityPatterns on ScheduleEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ScheduleEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ScheduleEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ScheduleEntity value)  $default,){
final _that = this;
switch (_that) {
case _ScheduleEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ScheduleEntity value)?  $default,){
final _that = this;
switch (_that) {
case _ScheduleEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime date,  String eventName,  List<int> grades)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ScheduleEntity() when $default != null:
return $default(_that.date,_that.eventName,_that.grades);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime date,  String eventName,  List<int> grades)  $default,) {final _that = this;
switch (_that) {
case _ScheduleEntity():
return $default(_that.date,_that.eventName,_that.grades);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime date,  String eventName,  List<int> grades)?  $default,) {final _that = this;
switch (_that) {
case _ScheduleEntity() when $default != null:
return $default(_that.date,_that.eventName,_that.grades);case _:
  return null;

}
}

}

/// @nodoc


class _ScheduleEntity extends ScheduleEntity {
  const _ScheduleEntity({required this.date, required this.eventName, required final  List<int> grades}): _grades = grades,super._();
  

@override final  DateTime date;
@override final  String eventName;
 final  List<int> _grades;
@override List<int> get grades {
  if (_grades is EqualUnmodifiableListView) return _grades;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_grades);
}


/// Create a copy of ScheduleEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ScheduleEntityCopyWith<_ScheduleEntity> get copyWith => __$ScheduleEntityCopyWithImpl<_ScheduleEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ScheduleEntity&&(identical(other.date, date) || other.date == date)&&(identical(other.eventName, eventName) || other.eventName == eventName)&&const DeepCollectionEquality().equals(other._grades, _grades));
}


@override
int get hashCode => Object.hash(runtimeType,date,eventName,const DeepCollectionEquality().hash(_grades));

@override
String toString() {
  return 'ScheduleEntity(date: $date, eventName: $eventName, grades: $grades)';
}


}

/// @nodoc
abstract mixin class _$ScheduleEntityCopyWith<$Res> implements $ScheduleEntityCopyWith<$Res> {
  factory _$ScheduleEntityCopyWith(_ScheduleEntity value, $Res Function(_ScheduleEntity) _then) = __$ScheduleEntityCopyWithImpl;
@override @useResult
$Res call({
 DateTime date, String eventName, List<int> grades
});




}
/// @nodoc
class __$ScheduleEntityCopyWithImpl<$Res>
    implements _$ScheduleEntityCopyWith<$Res> {
  __$ScheduleEntityCopyWithImpl(this._self, this._then);

  final _ScheduleEntity _self;
  final $Res Function(_ScheduleEntity) _then;

/// Create a copy of ScheduleEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = null,Object? eventName = null,Object? grades = null,}) {
  return _then(_ScheduleEntity(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,eventName: null == eventName ? _self.eventName : eventName // ignore: cast_nullable_to_non_nullable
as String,grades: null == grades ? _self._grades : grades // ignore: cast_nullable_to_non_nullable
as List<int>,
  ));
}


}

// dart format on
