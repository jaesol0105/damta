// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'neis_time_table_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NeisTimeTableDto {

@JsonKey(name: 'ALL_TI_YMD') String get date;// 시간표일자
@JsonKey(name: 'GRADE') String get grade;// 학년
@JsonKey(name: 'CLASS_NM') String get classes;// 학급명(반)
@JsonKey(name: 'PERIO') String get period;// 교시
@JsonKey(name: 'ITRT_CNTNT') String get subject;
/// Create a copy of NeisTimeTableDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NeisTimeTableDtoCopyWith<NeisTimeTableDto> get copyWith => _$NeisTimeTableDtoCopyWithImpl<NeisTimeTableDto>(this as NeisTimeTableDto, _$identity);

  /// Serializes this NeisTimeTableDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NeisTimeTableDto&&(identical(other.date, date) || other.date == date)&&(identical(other.grade, grade) || other.grade == grade)&&(identical(other.classes, classes) || other.classes == classes)&&(identical(other.period, period) || other.period == period)&&(identical(other.subject, subject) || other.subject == subject));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date,grade,classes,period,subject);

@override
String toString() {
  return 'NeisTimeTableDto(date: $date, grade: $grade, classes: $classes, period: $period, subject: $subject)';
}


}

/// @nodoc
abstract mixin class $NeisTimeTableDtoCopyWith<$Res>  {
  factory $NeisTimeTableDtoCopyWith(NeisTimeTableDto value, $Res Function(NeisTimeTableDto) _then) = _$NeisTimeTableDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'ALL_TI_YMD') String date,@JsonKey(name: 'GRADE') String grade,@JsonKey(name: 'CLASS_NM') String classes,@JsonKey(name: 'PERIO') String period,@JsonKey(name: 'ITRT_CNTNT') String subject
});




}
/// @nodoc
class _$NeisTimeTableDtoCopyWithImpl<$Res>
    implements $NeisTimeTableDtoCopyWith<$Res> {
  _$NeisTimeTableDtoCopyWithImpl(this._self, this._then);

  final NeisTimeTableDto _self;
  final $Res Function(NeisTimeTableDto) _then;

/// Create a copy of NeisTimeTableDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? date = null,Object? grade = null,Object? classes = null,Object? period = null,Object? subject = null,}) {
  return _then(_self.copyWith(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,grade: null == grade ? _self.grade : grade // ignore: cast_nullable_to_non_nullable
as String,classes: null == classes ? _self.classes : classes // ignore: cast_nullable_to_non_nullable
as String,period: null == period ? _self.period : period // ignore: cast_nullable_to_non_nullable
as String,subject: null == subject ? _self.subject : subject // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [NeisTimeTableDto].
extension NeisTimeTableDtoPatterns on NeisTimeTableDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NeisTimeTableDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NeisTimeTableDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NeisTimeTableDto value)  $default,){
final _that = this;
switch (_that) {
case _NeisTimeTableDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NeisTimeTableDto value)?  $default,){
final _that = this;
switch (_that) {
case _NeisTimeTableDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'ALL_TI_YMD')  String date, @JsonKey(name: 'GRADE')  String grade, @JsonKey(name: 'CLASS_NM')  String classes, @JsonKey(name: 'PERIO')  String period, @JsonKey(name: 'ITRT_CNTNT')  String subject)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NeisTimeTableDto() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'ALL_TI_YMD')  String date, @JsonKey(name: 'GRADE')  String grade, @JsonKey(name: 'CLASS_NM')  String classes, @JsonKey(name: 'PERIO')  String period, @JsonKey(name: 'ITRT_CNTNT')  String subject)  $default,) {final _that = this;
switch (_that) {
case _NeisTimeTableDto():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'ALL_TI_YMD')  String date, @JsonKey(name: 'GRADE')  String grade, @JsonKey(name: 'CLASS_NM')  String classes, @JsonKey(name: 'PERIO')  String period, @JsonKey(name: 'ITRT_CNTNT')  String subject)?  $default,) {final _that = this;
switch (_that) {
case _NeisTimeTableDto() when $default != null:
return $default(_that.date,_that.grade,_that.classes,_that.period,_that.subject);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NeisTimeTableDto implements NeisTimeTableDto {
  const _NeisTimeTableDto({@JsonKey(name: 'ALL_TI_YMD') required this.date, @JsonKey(name: 'GRADE') required this.grade, @JsonKey(name: 'CLASS_NM') required this.classes, @JsonKey(name: 'PERIO') required this.period, @JsonKey(name: 'ITRT_CNTNT') required this.subject});
  factory _NeisTimeTableDto.fromJson(Map<String, dynamic> json) => _$NeisTimeTableDtoFromJson(json);

@override@JsonKey(name: 'ALL_TI_YMD') final  String date;
// 시간표일자
@override@JsonKey(name: 'GRADE') final  String grade;
// 학년
@override@JsonKey(name: 'CLASS_NM') final  String classes;
// 학급명(반)
@override@JsonKey(name: 'PERIO') final  String period;
// 교시
@override@JsonKey(name: 'ITRT_CNTNT') final  String subject;

/// Create a copy of NeisTimeTableDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NeisTimeTableDtoCopyWith<_NeisTimeTableDto> get copyWith => __$NeisTimeTableDtoCopyWithImpl<_NeisTimeTableDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NeisTimeTableDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NeisTimeTableDto&&(identical(other.date, date) || other.date == date)&&(identical(other.grade, grade) || other.grade == grade)&&(identical(other.classes, classes) || other.classes == classes)&&(identical(other.period, period) || other.period == period)&&(identical(other.subject, subject) || other.subject == subject));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date,grade,classes,period,subject);

@override
String toString() {
  return 'NeisTimeTableDto(date: $date, grade: $grade, classes: $classes, period: $period, subject: $subject)';
}


}

/// @nodoc
abstract mixin class _$NeisTimeTableDtoCopyWith<$Res> implements $NeisTimeTableDtoCopyWith<$Res> {
  factory _$NeisTimeTableDtoCopyWith(_NeisTimeTableDto value, $Res Function(_NeisTimeTableDto) _then) = __$NeisTimeTableDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'ALL_TI_YMD') String date,@JsonKey(name: 'GRADE') String grade,@JsonKey(name: 'CLASS_NM') String classes,@JsonKey(name: 'PERIO') String period,@JsonKey(name: 'ITRT_CNTNT') String subject
});




}
/// @nodoc
class __$NeisTimeTableDtoCopyWithImpl<$Res>
    implements _$NeisTimeTableDtoCopyWith<$Res> {
  __$NeisTimeTableDtoCopyWithImpl(this._self, this._then);

  final _NeisTimeTableDto _self;
  final $Res Function(_NeisTimeTableDto) _then;

/// Create a copy of NeisTimeTableDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = null,Object? grade = null,Object? classes = null,Object? period = null,Object? subject = null,}) {
  return _then(_NeisTimeTableDto(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,grade: null == grade ? _self.grade : grade // ignore: cast_nullable_to_non_nullable
as String,classes: null == classes ? _self.classes : classes // ignore: cast_nullable_to_non_nullable
as String,period: null == period ? _self.period : period // ignore: cast_nullable_to_non_nullable
as String,subject: null == subject ? _self.subject : subject // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
