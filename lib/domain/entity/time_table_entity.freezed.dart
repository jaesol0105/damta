// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'time_table_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TimeTableEntity {

 DateTime get date;// 시간표일자
 int get grade;// 학년
 int get classes;// 학급명(반)
 int get period;// 교시
 String get subject;
/// Create a copy of TimeTableEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TimeTableEntityCopyWith<TimeTableEntity> get copyWith => _$TimeTableEntityCopyWithImpl<TimeTableEntity>(this as TimeTableEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TimeTableEntity&&(identical(other.date, date) || other.date == date)&&(identical(other.grade, grade) || other.grade == grade)&&(identical(other.classes, classes) || other.classes == classes)&&(identical(other.period, period) || other.period == period)&&(identical(other.subject, subject) || other.subject == subject));
}


@override
int get hashCode => Object.hash(runtimeType,date,grade,classes,period,subject);

@override
String toString() {
  return 'TimeTableEntity(date: $date, grade: $grade, classes: $classes, period: $period, subject: $subject)';
}


}

/// @nodoc
abstract mixin class $TimeTableEntityCopyWith<$Res>  {
  factory $TimeTableEntityCopyWith(TimeTableEntity value, $Res Function(TimeTableEntity) _then) = _$TimeTableEntityCopyWithImpl;
@useResult
$Res call({
 DateTime date, int grade, int classes, int period, String subject
});




}
/// @nodoc
class _$TimeTableEntityCopyWithImpl<$Res>
    implements $TimeTableEntityCopyWith<$Res> {
  _$TimeTableEntityCopyWithImpl(this._self, this._then);

  final TimeTableEntity _self;
  final $Res Function(TimeTableEntity) _then;

/// Create a copy of TimeTableEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? date = null,Object? grade = null,Object? classes = null,Object? period = null,Object? subject = null,}) {
  return _then(_self.copyWith(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,grade: null == grade ? _self.grade : grade // ignore: cast_nullable_to_non_nullable
as int,classes: null == classes ? _self.classes : classes // ignore: cast_nullable_to_non_nullable
as int,period: null == period ? _self.period : period // ignore: cast_nullable_to_non_nullable
as int,subject: null == subject ? _self.subject : subject // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [TimeTableEntity].
extension TimeTableEntityPatterns on TimeTableEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TimeTableEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TimeTableEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TimeTableEntity value)  $default,){
final _that = this;
switch (_that) {
case _TimeTableEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TimeTableEntity value)?  $default,){
final _that = this;
switch (_that) {
case _TimeTableEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime date,  int grade,  int classes,  int period,  String subject)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TimeTableEntity() when $default != null:
return $default(_that.date,_that.grade,_that.classes,_that.period,_that.subject);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime date,  int grade,  int classes,  int period,  String subject)  $default,) {final _that = this;
switch (_that) {
case _TimeTableEntity():
return $default(_that.date,_that.grade,_that.classes,_that.period,_that.subject);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime date,  int grade,  int classes,  int period,  String subject)?  $default,) {final _that = this;
switch (_that) {
case _TimeTableEntity() when $default != null:
return $default(_that.date,_that.grade,_that.classes,_that.period,_that.subject);case _:
  return null;

}
}

}

/// @nodoc


class _TimeTableEntity implements TimeTableEntity {
  const _TimeTableEntity({required this.date, required this.grade, required this.classes, required this.period, required this.subject});
  

@override final  DateTime date;
// 시간표일자
@override final  int grade;
// 학년
@override final  int classes;
// 학급명(반)
@override final  int period;
// 교시
@override final  String subject;

/// Create a copy of TimeTableEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TimeTableEntityCopyWith<_TimeTableEntity> get copyWith => __$TimeTableEntityCopyWithImpl<_TimeTableEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TimeTableEntity&&(identical(other.date, date) || other.date == date)&&(identical(other.grade, grade) || other.grade == grade)&&(identical(other.classes, classes) || other.classes == classes)&&(identical(other.period, period) || other.period == period)&&(identical(other.subject, subject) || other.subject == subject));
}


@override
int get hashCode => Object.hash(runtimeType,date,grade,classes,period,subject);

@override
String toString() {
  return 'TimeTableEntity(date: $date, grade: $grade, classes: $classes, period: $period, subject: $subject)';
}


}

/// @nodoc
abstract mixin class _$TimeTableEntityCopyWith<$Res> implements $TimeTableEntityCopyWith<$Res> {
  factory _$TimeTableEntityCopyWith(_TimeTableEntity value, $Res Function(_TimeTableEntity) _then) = __$TimeTableEntityCopyWithImpl;
@override @useResult
$Res call({
 DateTime date, int grade, int classes, int period, String subject
});




}
/// @nodoc
class __$TimeTableEntityCopyWithImpl<$Res>
    implements _$TimeTableEntityCopyWith<$Res> {
  __$TimeTableEntityCopyWithImpl(this._self, this._then);

  final _TimeTableEntity _self;
  final $Res Function(_TimeTableEntity) _then;

/// Create a copy of TimeTableEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = null,Object? grade = null,Object? classes = null,Object? period = null,Object? subject = null,}) {
  return _then(_TimeTableEntity(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,grade: null == grade ? _self.grade : grade // ignore: cast_nullable_to_non_nullable
as int,classes: null == classes ? _self.classes : classes // ignore: cast_nullable_to_non_nullable
as int,period: null == period ? _self.period : period // ignore: cast_nullable_to_non_nullable
as int,subject: null == subject ? _self.subject : subject // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
