// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'neis_meal_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NeisMealDTO {

@JsonKey(name: 'SCHUL_NM') String get schoolName;// 학교명
@JsonKey(name: 'MMEAL_SC_CODE') String get mealTypeCode;// 1/2/3 (아침/점심/저녁)
@JsonKey(name: 'MLSV_YMD') String get dateYmd;// 날짜 "20251207" 형태
@JsonKey(name: 'DDISH_NM') String get dishNm;// 메뉴명 문자열, "<br/>"이랑 알레르기 정보 필터링 필요
@JsonKey(name: 'CAL_INFO') String? get calInfo;
/// Create a copy of NeisMealDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NeisMealDTOCopyWith<NeisMealDTO> get copyWith => _$NeisMealDTOCopyWithImpl<NeisMealDTO>(this as NeisMealDTO, _$identity);

  /// Serializes this NeisMealDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NeisMealDTO&&(identical(other.schoolName, schoolName) || other.schoolName == schoolName)&&(identical(other.mealTypeCode, mealTypeCode) || other.mealTypeCode == mealTypeCode)&&(identical(other.dateYmd, dateYmd) || other.dateYmd == dateYmd)&&(identical(other.dishNm, dishNm) || other.dishNm == dishNm)&&(identical(other.calInfo, calInfo) || other.calInfo == calInfo));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,schoolName,mealTypeCode,dateYmd,dishNm,calInfo);

@override
String toString() {
  return 'NeisMealDTO(schoolName: $schoolName, mealTypeCode: $mealTypeCode, dateYmd: $dateYmd, dishNm: $dishNm, calInfo: $calInfo)';
}


}

/// @nodoc
abstract mixin class $NeisMealDTOCopyWith<$Res>  {
  factory $NeisMealDTOCopyWith(NeisMealDTO value, $Res Function(NeisMealDTO) _then) = _$NeisMealDTOCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'SCHUL_NM') String schoolName,@JsonKey(name: 'MMEAL_SC_CODE') String mealTypeCode,@JsonKey(name: 'MLSV_YMD') String dateYmd,@JsonKey(name: 'DDISH_NM') String dishNm,@JsonKey(name: 'CAL_INFO') String? calInfo
});




}
/// @nodoc
class _$NeisMealDTOCopyWithImpl<$Res>
    implements $NeisMealDTOCopyWith<$Res> {
  _$NeisMealDTOCopyWithImpl(this._self, this._then);

  final NeisMealDTO _self;
  final $Res Function(NeisMealDTO) _then;

/// Create a copy of NeisMealDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? schoolName = null,Object? mealTypeCode = null,Object? dateYmd = null,Object? dishNm = null,Object? calInfo = freezed,}) {
  return _then(_self.copyWith(
schoolName: null == schoolName ? _self.schoolName : schoolName // ignore: cast_nullable_to_non_nullable
as String,mealTypeCode: null == mealTypeCode ? _self.mealTypeCode : mealTypeCode // ignore: cast_nullable_to_non_nullable
as String,dateYmd: null == dateYmd ? _self.dateYmd : dateYmd // ignore: cast_nullable_to_non_nullable
as String,dishNm: null == dishNm ? _self.dishNm : dishNm // ignore: cast_nullable_to_non_nullable
as String,calInfo: freezed == calInfo ? _self.calInfo : calInfo // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [NeisMealDTO].
extension NeisMealDTOPatterns on NeisMealDTO {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NeisMealDTO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NeisMealDTO() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NeisMealDTO value)  $default,){
final _that = this;
switch (_that) {
case _NeisMealDTO():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NeisMealDTO value)?  $default,){
final _that = this;
switch (_that) {
case _NeisMealDTO() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'SCHUL_NM')  String schoolName, @JsonKey(name: 'MMEAL_SC_CODE')  String mealTypeCode, @JsonKey(name: 'MLSV_YMD')  String dateYmd, @JsonKey(name: 'DDISH_NM')  String dishNm, @JsonKey(name: 'CAL_INFO')  String? calInfo)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NeisMealDTO() when $default != null:
return $default(_that.schoolName,_that.mealTypeCode,_that.dateYmd,_that.dishNm,_that.calInfo);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'SCHUL_NM')  String schoolName, @JsonKey(name: 'MMEAL_SC_CODE')  String mealTypeCode, @JsonKey(name: 'MLSV_YMD')  String dateYmd, @JsonKey(name: 'DDISH_NM')  String dishNm, @JsonKey(name: 'CAL_INFO')  String? calInfo)  $default,) {final _that = this;
switch (_that) {
case _NeisMealDTO():
return $default(_that.schoolName,_that.mealTypeCode,_that.dateYmd,_that.dishNm,_that.calInfo);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'SCHUL_NM')  String schoolName, @JsonKey(name: 'MMEAL_SC_CODE')  String mealTypeCode, @JsonKey(name: 'MLSV_YMD')  String dateYmd, @JsonKey(name: 'DDISH_NM')  String dishNm, @JsonKey(name: 'CAL_INFO')  String? calInfo)?  $default,) {final _that = this;
switch (_that) {
case _NeisMealDTO() when $default != null:
return $default(_that.schoolName,_that.mealTypeCode,_that.dateYmd,_that.dishNm,_that.calInfo);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NeisMealDTO implements NeisMealDTO {
  const _NeisMealDTO({@JsonKey(name: 'SCHUL_NM') required this.schoolName, @JsonKey(name: 'MMEAL_SC_CODE') required this.mealTypeCode, @JsonKey(name: 'MLSV_YMD') required this.dateYmd, @JsonKey(name: 'DDISH_NM') required this.dishNm, @JsonKey(name: 'CAL_INFO') this.calInfo});
  factory _NeisMealDTO.fromJson(Map<String, dynamic> json) => _$NeisMealDTOFromJson(json);

@override@JsonKey(name: 'SCHUL_NM') final  String schoolName;
// 학교명
@override@JsonKey(name: 'MMEAL_SC_CODE') final  String mealTypeCode;
// 1/2/3 (아침/점심/저녁)
@override@JsonKey(name: 'MLSV_YMD') final  String dateYmd;
// 날짜 "20251207" 형태
@override@JsonKey(name: 'DDISH_NM') final  String dishNm;
// 메뉴명 문자열, "<br/>"이랑 알레르기 정보 필터링 필요
@override@JsonKey(name: 'CAL_INFO') final  String? calInfo;

/// Create a copy of NeisMealDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NeisMealDTOCopyWith<_NeisMealDTO> get copyWith => __$NeisMealDTOCopyWithImpl<_NeisMealDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NeisMealDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NeisMealDTO&&(identical(other.schoolName, schoolName) || other.schoolName == schoolName)&&(identical(other.mealTypeCode, mealTypeCode) || other.mealTypeCode == mealTypeCode)&&(identical(other.dateYmd, dateYmd) || other.dateYmd == dateYmd)&&(identical(other.dishNm, dishNm) || other.dishNm == dishNm)&&(identical(other.calInfo, calInfo) || other.calInfo == calInfo));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,schoolName,mealTypeCode,dateYmd,dishNm,calInfo);

@override
String toString() {
  return 'NeisMealDTO(schoolName: $schoolName, mealTypeCode: $mealTypeCode, dateYmd: $dateYmd, dishNm: $dishNm, calInfo: $calInfo)';
}


}

/// @nodoc
abstract mixin class _$NeisMealDTOCopyWith<$Res> implements $NeisMealDTOCopyWith<$Res> {
  factory _$NeisMealDTOCopyWith(_NeisMealDTO value, $Res Function(_NeisMealDTO) _then) = __$NeisMealDTOCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'SCHUL_NM') String schoolName,@JsonKey(name: 'MMEAL_SC_CODE') String mealTypeCode,@JsonKey(name: 'MLSV_YMD') String dateYmd,@JsonKey(name: 'DDISH_NM') String dishNm,@JsonKey(name: 'CAL_INFO') String? calInfo
});




}
/// @nodoc
class __$NeisMealDTOCopyWithImpl<$Res>
    implements _$NeisMealDTOCopyWith<$Res> {
  __$NeisMealDTOCopyWithImpl(this._self, this._then);

  final _NeisMealDTO _self;
  final $Res Function(_NeisMealDTO) _then;

/// Create a copy of NeisMealDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? schoolName = null,Object? mealTypeCode = null,Object? dateYmd = null,Object? dishNm = null,Object? calInfo = freezed,}) {
  return _then(_NeisMealDTO(
schoolName: null == schoolName ? _self.schoolName : schoolName // ignore: cast_nullable_to_non_nullable
as String,mealTypeCode: null == mealTypeCode ? _self.mealTypeCode : mealTypeCode // ignore: cast_nullable_to_non_nullable
as String,dateYmd: null == dateYmd ? _self.dateYmd : dateYmd // ignore: cast_nullable_to_non_nullable
as String,dishNm: null == dishNm ? _self.dishNm : dishNm // ignore: cast_nullable_to_non_nullable
as String,calInfo: freezed == calInfo ? _self.calInfo : calInfo // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
