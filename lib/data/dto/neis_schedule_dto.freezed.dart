// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'neis_schedule_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NeisScheduleDTO {

@JsonKey(name: 'AA_YMD') String get eventDate;// 날짜 "20251207" 형태
@JsonKey(name: 'EVENT_NM') String get eventName;// 일정명
@JsonKey(name: 'ONE_GRADE_EVENT_YN') String? get oneGradeEventYn;// 1학년 (Y/N)
@JsonKey(name: 'TW_GRADE_EVENT_YN') String? get twGradeEventYn;// 2학년
@JsonKey(name: 'THREE_GRADE_EVENT_YN') String? get threeGradeEventYn;// 3학년
@JsonKey(name: 'FR_GRADE_EVENT_YN') String? get frGradeEventYn;// 4학년
@JsonKey(name: 'FIV_GRADE_EVENT_YN') String? get fivGradeEventYn;// 5학년
@JsonKey(name: 'SIX_GRADE_EVENT_YN') String? get sixGradeEventYn;
/// Create a copy of NeisScheduleDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NeisScheduleDTOCopyWith<NeisScheduleDTO> get copyWith => _$NeisScheduleDTOCopyWithImpl<NeisScheduleDTO>(this as NeisScheduleDTO, _$identity);

  /// Serializes this NeisScheduleDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NeisScheduleDTO&&(identical(other.eventDate, eventDate) || other.eventDate == eventDate)&&(identical(other.eventName, eventName) || other.eventName == eventName)&&(identical(other.oneGradeEventYn, oneGradeEventYn) || other.oneGradeEventYn == oneGradeEventYn)&&(identical(other.twGradeEventYn, twGradeEventYn) || other.twGradeEventYn == twGradeEventYn)&&(identical(other.threeGradeEventYn, threeGradeEventYn) || other.threeGradeEventYn == threeGradeEventYn)&&(identical(other.frGradeEventYn, frGradeEventYn) || other.frGradeEventYn == frGradeEventYn)&&(identical(other.fivGradeEventYn, fivGradeEventYn) || other.fivGradeEventYn == fivGradeEventYn)&&(identical(other.sixGradeEventYn, sixGradeEventYn) || other.sixGradeEventYn == sixGradeEventYn));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,eventDate,eventName,oneGradeEventYn,twGradeEventYn,threeGradeEventYn,frGradeEventYn,fivGradeEventYn,sixGradeEventYn);

@override
String toString() {
  return 'NeisScheduleDTO(eventDate: $eventDate, eventName: $eventName, oneGradeEventYn: $oneGradeEventYn, twGradeEventYn: $twGradeEventYn, threeGradeEventYn: $threeGradeEventYn, frGradeEventYn: $frGradeEventYn, fivGradeEventYn: $fivGradeEventYn, sixGradeEventYn: $sixGradeEventYn)';
}


}

/// @nodoc
abstract mixin class $NeisScheduleDTOCopyWith<$Res>  {
  factory $NeisScheduleDTOCopyWith(NeisScheduleDTO value, $Res Function(NeisScheduleDTO) _then) = _$NeisScheduleDTOCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'AA_YMD') String eventDate,@JsonKey(name: 'EVENT_NM') String eventName,@JsonKey(name: 'ONE_GRADE_EVENT_YN') String? oneGradeEventYn,@JsonKey(name: 'TW_GRADE_EVENT_YN') String? twGradeEventYn,@JsonKey(name: 'THREE_GRADE_EVENT_YN') String? threeGradeEventYn,@JsonKey(name: 'FR_GRADE_EVENT_YN') String? frGradeEventYn,@JsonKey(name: 'FIV_GRADE_EVENT_YN') String? fivGradeEventYn,@JsonKey(name: 'SIX_GRADE_EVENT_YN') String? sixGradeEventYn
});




}
/// @nodoc
class _$NeisScheduleDTOCopyWithImpl<$Res>
    implements $NeisScheduleDTOCopyWith<$Res> {
  _$NeisScheduleDTOCopyWithImpl(this._self, this._then);

  final NeisScheduleDTO _self;
  final $Res Function(NeisScheduleDTO) _then;

/// Create a copy of NeisScheduleDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? eventDate = null,Object? eventName = null,Object? oneGradeEventYn = freezed,Object? twGradeEventYn = freezed,Object? threeGradeEventYn = freezed,Object? frGradeEventYn = freezed,Object? fivGradeEventYn = freezed,Object? sixGradeEventYn = freezed,}) {
  return _then(_self.copyWith(
eventDate: null == eventDate ? _self.eventDate : eventDate // ignore: cast_nullable_to_non_nullable
as String,eventName: null == eventName ? _self.eventName : eventName // ignore: cast_nullable_to_non_nullable
as String,oneGradeEventYn: freezed == oneGradeEventYn ? _self.oneGradeEventYn : oneGradeEventYn // ignore: cast_nullable_to_non_nullable
as String?,twGradeEventYn: freezed == twGradeEventYn ? _self.twGradeEventYn : twGradeEventYn // ignore: cast_nullable_to_non_nullable
as String?,threeGradeEventYn: freezed == threeGradeEventYn ? _self.threeGradeEventYn : threeGradeEventYn // ignore: cast_nullable_to_non_nullable
as String?,frGradeEventYn: freezed == frGradeEventYn ? _self.frGradeEventYn : frGradeEventYn // ignore: cast_nullable_to_non_nullable
as String?,fivGradeEventYn: freezed == fivGradeEventYn ? _self.fivGradeEventYn : fivGradeEventYn // ignore: cast_nullable_to_non_nullable
as String?,sixGradeEventYn: freezed == sixGradeEventYn ? _self.sixGradeEventYn : sixGradeEventYn // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [NeisScheduleDTO].
extension NeisScheduleDTOPatterns on NeisScheduleDTO {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NeisScheduleDTO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NeisScheduleDTO() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NeisScheduleDTO value)  $default,){
final _that = this;
switch (_that) {
case _NeisScheduleDTO():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NeisScheduleDTO value)?  $default,){
final _that = this;
switch (_that) {
case _NeisScheduleDTO() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'AA_YMD')  String eventDate, @JsonKey(name: 'EVENT_NM')  String eventName, @JsonKey(name: 'ONE_GRADE_EVENT_YN')  String? oneGradeEventYn, @JsonKey(name: 'TW_GRADE_EVENT_YN')  String? twGradeEventYn, @JsonKey(name: 'THREE_GRADE_EVENT_YN')  String? threeGradeEventYn, @JsonKey(name: 'FR_GRADE_EVENT_YN')  String? frGradeEventYn, @JsonKey(name: 'FIV_GRADE_EVENT_YN')  String? fivGradeEventYn, @JsonKey(name: 'SIX_GRADE_EVENT_YN')  String? sixGradeEventYn)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NeisScheduleDTO() when $default != null:
return $default(_that.eventDate,_that.eventName,_that.oneGradeEventYn,_that.twGradeEventYn,_that.threeGradeEventYn,_that.frGradeEventYn,_that.fivGradeEventYn,_that.sixGradeEventYn);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'AA_YMD')  String eventDate, @JsonKey(name: 'EVENT_NM')  String eventName, @JsonKey(name: 'ONE_GRADE_EVENT_YN')  String? oneGradeEventYn, @JsonKey(name: 'TW_GRADE_EVENT_YN')  String? twGradeEventYn, @JsonKey(name: 'THREE_GRADE_EVENT_YN')  String? threeGradeEventYn, @JsonKey(name: 'FR_GRADE_EVENT_YN')  String? frGradeEventYn, @JsonKey(name: 'FIV_GRADE_EVENT_YN')  String? fivGradeEventYn, @JsonKey(name: 'SIX_GRADE_EVENT_YN')  String? sixGradeEventYn)  $default,) {final _that = this;
switch (_that) {
case _NeisScheduleDTO():
return $default(_that.eventDate,_that.eventName,_that.oneGradeEventYn,_that.twGradeEventYn,_that.threeGradeEventYn,_that.frGradeEventYn,_that.fivGradeEventYn,_that.sixGradeEventYn);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'AA_YMD')  String eventDate, @JsonKey(name: 'EVENT_NM')  String eventName, @JsonKey(name: 'ONE_GRADE_EVENT_YN')  String? oneGradeEventYn, @JsonKey(name: 'TW_GRADE_EVENT_YN')  String? twGradeEventYn, @JsonKey(name: 'THREE_GRADE_EVENT_YN')  String? threeGradeEventYn, @JsonKey(name: 'FR_GRADE_EVENT_YN')  String? frGradeEventYn, @JsonKey(name: 'FIV_GRADE_EVENT_YN')  String? fivGradeEventYn, @JsonKey(name: 'SIX_GRADE_EVENT_YN')  String? sixGradeEventYn)?  $default,) {final _that = this;
switch (_that) {
case _NeisScheduleDTO() when $default != null:
return $default(_that.eventDate,_that.eventName,_that.oneGradeEventYn,_that.twGradeEventYn,_that.threeGradeEventYn,_that.frGradeEventYn,_that.fivGradeEventYn,_that.sixGradeEventYn);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NeisScheduleDTO implements NeisScheduleDTO {
  const _NeisScheduleDTO({@JsonKey(name: 'AA_YMD') required this.eventDate, @JsonKey(name: 'EVENT_NM') required this.eventName, @JsonKey(name: 'ONE_GRADE_EVENT_YN') this.oneGradeEventYn, @JsonKey(name: 'TW_GRADE_EVENT_YN') this.twGradeEventYn, @JsonKey(name: 'THREE_GRADE_EVENT_YN') this.threeGradeEventYn, @JsonKey(name: 'FR_GRADE_EVENT_YN') this.frGradeEventYn, @JsonKey(name: 'FIV_GRADE_EVENT_YN') this.fivGradeEventYn, @JsonKey(name: 'SIX_GRADE_EVENT_YN') this.sixGradeEventYn});
  factory _NeisScheduleDTO.fromJson(Map<String, dynamic> json) => _$NeisScheduleDTOFromJson(json);

@override@JsonKey(name: 'AA_YMD') final  String eventDate;
// 날짜 "20251207" 형태
@override@JsonKey(name: 'EVENT_NM') final  String eventName;
// 일정명
@override@JsonKey(name: 'ONE_GRADE_EVENT_YN') final  String? oneGradeEventYn;
// 1학년 (Y/N)
@override@JsonKey(name: 'TW_GRADE_EVENT_YN') final  String? twGradeEventYn;
// 2학년
@override@JsonKey(name: 'THREE_GRADE_EVENT_YN') final  String? threeGradeEventYn;
// 3학년
@override@JsonKey(name: 'FR_GRADE_EVENT_YN') final  String? frGradeEventYn;
// 4학년
@override@JsonKey(name: 'FIV_GRADE_EVENT_YN') final  String? fivGradeEventYn;
// 5학년
@override@JsonKey(name: 'SIX_GRADE_EVENT_YN') final  String? sixGradeEventYn;

/// Create a copy of NeisScheduleDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NeisScheduleDTOCopyWith<_NeisScheduleDTO> get copyWith => __$NeisScheduleDTOCopyWithImpl<_NeisScheduleDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NeisScheduleDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NeisScheduleDTO&&(identical(other.eventDate, eventDate) || other.eventDate == eventDate)&&(identical(other.eventName, eventName) || other.eventName == eventName)&&(identical(other.oneGradeEventYn, oneGradeEventYn) || other.oneGradeEventYn == oneGradeEventYn)&&(identical(other.twGradeEventYn, twGradeEventYn) || other.twGradeEventYn == twGradeEventYn)&&(identical(other.threeGradeEventYn, threeGradeEventYn) || other.threeGradeEventYn == threeGradeEventYn)&&(identical(other.frGradeEventYn, frGradeEventYn) || other.frGradeEventYn == frGradeEventYn)&&(identical(other.fivGradeEventYn, fivGradeEventYn) || other.fivGradeEventYn == fivGradeEventYn)&&(identical(other.sixGradeEventYn, sixGradeEventYn) || other.sixGradeEventYn == sixGradeEventYn));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,eventDate,eventName,oneGradeEventYn,twGradeEventYn,threeGradeEventYn,frGradeEventYn,fivGradeEventYn,sixGradeEventYn);

@override
String toString() {
  return 'NeisScheduleDTO(eventDate: $eventDate, eventName: $eventName, oneGradeEventYn: $oneGradeEventYn, twGradeEventYn: $twGradeEventYn, threeGradeEventYn: $threeGradeEventYn, frGradeEventYn: $frGradeEventYn, fivGradeEventYn: $fivGradeEventYn, sixGradeEventYn: $sixGradeEventYn)';
}


}

/// @nodoc
abstract mixin class _$NeisScheduleDTOCopyWith<$Res> implements $NeisScheduleDTOCopyWith<$Res> {
  factory _$NeisScheduleDTOCopyWith(_NeisScheduleDTO value, $Res Function(_NeisScheduleDTO) _then) = __$NeisScheduleDTOCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'AA_YMD') String eventDate,@JsonKey(name: 'EVENT_NM') String eventName,@JsonKey(name: 'ONE_GRADE_EVENT_YN') String? oneGradeEventYn,@JsonKey(name: 'TW_GRADE_EVENT_YN') String? twGradeEventYn,@JsonKey(name: 'THREE_GRADE_EVENT_YN') String? threeGradeEventYn,@JsonKey(name: 'FR_GRADE_EVENT_YN') String? frGradeEventYn,@JsonKey(name: 'FIV_GRADE_EVENT_YN') String? fivGradeEventYn,@JsonKey(name: 'SIX_GRADE_EVENT_YN') String? sixGradeEventYn
});




}
/// @nodoc
class __$NeisScheduleDTOCopyWithImpl<$Res>
    implements _$NeisScheduleDTOCopyWith<$Res> {
  __$NeisScheduleDTOCopyWithImpl(this._self, this._then);

  final _NeisScheduleDTO _self;
  final $Res Function(_NeisScheduleDTO) _then;

/// Create a copy of NeisScheduleDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? eventDate = null,Object? eventName = null,Object? oneGradeEventYn = freezed,Object? twGradeEventYn = freezed,Object? threeGradeEventYn = freezed,Object? frGradeEventYn = freezed,Object? fivGradeEventYn = freezed,Object? sixGradeEventYn = freezed,}) {
  return _then(_NeisScheduleDTO(
eventDate: null == eventDate ? _self.eventDate : eventDate // ignore: cast_nullable_to_non_nullable
as String,eventName: null == eventName ? _self.eventName : eventName // ignore: cast_nullable_to_non_nullable
as String,oneGradeEventYn: freezed == oneGradeEventYn ? _self.oneGradeEventYn : oneGradeEventYn // ignore: cast_nullable_to_non_nullable
as String?,twGradeEventYn: freezed == twGradeEventYn ? _self.twGradeEventYn : twGradeEventYn // ignore: cast_nullable_to_non_nullable
as String?,threeGradeEventYn: freezed == threeGradeEventYn ? _self.threeGradeEventYn : threeGradeEventYn // ignore: cast_nullable_to_non_nullable
as String?,frGradeEventYn: freezed == frGradeEventYn ? _self.frGradeEventYn : frGradeEventYn // ignore: cast_nullable_to_non_nullable
as String?,fivGradeEventYn: freezed == fivGradeEventYn ? _self.fivGradeEventYn : fivGradeEventYn // ignore: cast_nullable_to_non_nullable
as String?,sixGradeEventYn: freezed == sixGradeEventYn ? _self.sixGradeEventYn : sixGradeEventYn // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
