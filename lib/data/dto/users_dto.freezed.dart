// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'users_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UsersDto {

 String? get uId; String get officeCode; String get schoolCode; String get schoolName;
/// Create a copy of UsersDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UsersDtoCopyWith<UsersDto> get copyWith => _$UsersDtoCopyWithImpl<UsersDto>(this as UsersDto, _$identity);

  /// Serializes this UsersDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UsersDto&&(identical(other.uId, uId) || other.uId == uId)&&(identical(other.officeCode, officeCode) || other.officeCode == officeCode)&&(identical(other.schoolCode, schoolCode) || other.schoolCode == schoolCode)&&(identical(other.schoolName, schoolName) || other.schoolName == schoolName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,uId,officeCode,schoolCode,schoolName);

@override
String toString() {
  return 'UsersDto(uId: $uId, officeCode: $officeCode, schoolCode: $schoolCode, schoolName: $schoolName)';
}


}

/// @nodoc
abstract mixin class $UsersDtoCopyWith<$Res>  {
  factory $UsersDtoCopyWith(UsersDto value, $Res Function(UsersDto) _then) = _$UsersDtoCopyWithImpl;
@useResult
$Res call({
 String? uId, String officeCode, String schoolCode, String schoolName
});




}
/// @nodoc
class _$UsersDtoCopyWithImpl<$Res>
    implements $UsersDtoCopyWith<$Res> {
  _$UsersDtoCopyWithImpl(this._self, this._then);

  final UsersDto _self;
  final $Res Function(UsersDto) _then;

/// Create a copy of UsersDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? uId = freezed,Object? officeCode = null,Object? schoolCode = null,Object? schoolName = null,}) {
  return _then(_self.copyWith(
uId: freezed == uId ? _self.uId : uId // ignore: cast_nullable_to_non_nullable
as String?,officeCode: null == officeCode ? _self.officeCode : officeCode // ignore: cast_nullable_to_non_nullable
as String,schoolCode: null == schoolCode ? _self.schoolCode : schoolCode // ignore: cast_nullable_to_non_nullable
as String,schoolName: null == schoolName ? _self.schoolName : schoolName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [UsersDto].
extension UsersDtoPatterns on UsersDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UsersDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UsersDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UsersDto value)  $default,){
final _that = this;
switch (_that) {
case _UsersDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UsersDto value)?  $default,){
final _that = this;
switch (_that) {
case _UsersDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? uId,  String officeCode,  String schoolCode,  String schoolName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UsersDto() when $default != null:
return $default(_that.uId,_that.officeCode,_that.schoolCode,_that.schoolName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? uId,  String officeCode,  String schoolCode,  String schoolName)  $default,) {final _that = this;
switch (_that) {
case _UsersDto():
return $default(_that.uId,_that.officeCode,_that.schoolCode,_that.schoolName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? uId,  String officeCode,  String schoolCode,  String schoolName)?  $default,) {final _that = this;
switch (_that) {
case _UsersDto() when $default != null:
return $default(_that.uId,_that.officeCode,_that.schoolCode,_that.schoolName);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UsersDto implements UsersDto {
  const _UsersDto({this.uId, required this.officeCode, required this.schoolCode, required this.schoolName});
  factory _UsersDto.fromJson(Map<String, dynamic> json) => _$UsersDtoFromJson(json);

@override final  String? uId;
@override final  String officeCode;
@override final  String schoolCode;
@override final  String schoolName;

/// Create a copy of UsersDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UsersDtoCopyWith<_UsersDto> get copyWith => __$UsersDtoCopyWithImpl<_UsersDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UsersDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UsersDto&&(identical(other.uId, uId) || other.uId == uId)&&(identical(other.officeCode, officeCode) || other.officeCode == officeCode)&&(identical(other.schoolCode, schoolCode) || other.schoolCode == schoolCode)&&(identical(other.schoolName, schoolName) || other.schoolName == schoolName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,uId,officeCode,schoolCode,schoolName);

@override
String toString() {
  return 'UsersDto(uId: $uId, officeCode: $officeCode, schoolCode: $schoolCode, schoolName: $schoolName)';
}


}

/// @nodoc
abstract mixin class _$UsersDtoCopyWith<$Res> implements $UsersDtoCopyWith<$Res> {
  factory _$UsersDtoCopyWith(_UsersDto value, $Res Function(_UsersDto) _then) = __$UsersDtoCopyWithImpl;
@override @useResult
$Res call({
 String? uId, String officeCode, String schoolCode, String schoolName
});




}
/// @nodoc
class __$UsersDtoCopyWithImpl<$Res>
    implements _$UsersDtoCopyWith<$Res> {
  __$UsersDtoCopyWithImpl(this._self, this._then);

  final _UsersDto _self;
  final $Res Function(_UsersDto) _then;

/// Create a copy of UsersDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? uId = freezed,Object? officeCode = null,Object? schoolCode = null,Object? schoolName = null,}) {
  return _then(_UsersDto(
uId: freezed == uId ? _self.uId : uId // ignore: cast_nullable_to_non_nullable
as String?,officeCode: null == officeCode ? _self.officeCode : officeCode // ignore: cast_nullable_to_non_nullable
as String,schoolCode: null == schoolCode ? _self.schoolCode : schoolCode // ignore: cast_nullable_to_non_nullable
as String,schoolName: null == schoolName ? _self.schoolName : schoolName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
