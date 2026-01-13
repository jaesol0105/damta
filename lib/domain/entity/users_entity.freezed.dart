// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'users_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UsersEntity {

 String? get uId; String get officeCode; String get schoolCode; String get schoolName;
/// Create a copy of UsersEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UsersEntityCopyWith<UsersEntity> get copyWith => _$UsersEntityCopyWithImpl<UsersEntity>(this as UsersEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UsersEntity&&(identical(other.uId, uId) || other.uId == uId)&&(identical(other.officeCode, officeCode) || other.officeCode == officeCode)&&(identical(other.schoolCode, schoolCode) || other.schoolCode == schoolCode)&&(identical(other.schoolName, schoolName) || other.schoolName == schoolName));
}


@override
int get hashCode => Object.hash(runtimeType,uId,officeCode,schoolCode,schoolName);

@override
String toString() {
  return 'UsersEntity(uId: $uId, officeCode: $officeCode, schoolCode: $schoolCode, schoolName: $schoolName)';
}


}

/// @nodoc
abstract mixin class $UsersEntityCopyWith<$Res>  {
  factory $UsersEntityCopyWith(UsersEntity value, $Res Function(UsersEntity) _then) = _$UsersEntityCopyWithImpl;
@useResult
$Res call({
 String? uId, String officeCode, String schoolCode, String schoolName
});




}
/// @nodoc
class _$UsersEntityCopyWithImpl<$Res>
    implements $UsersEntityCopyWith<$Res> {
  _$UsersEntityCopyWithImpl(this._self, this._then);

  final UsersEntity _self;
  final $Res Function(UsersEntity) _then;

/// Create a copy of UsersEntity
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


/// Adds pattern-matching-related methods to [UsersEntity].
extension UsersEntityPatterns on UsersEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UsersEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UsersEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UsersEntity value)  $default,){
final _that = this;
switch (_that) {
case _UsersEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UsersEntity value)?  $default,){
final _that = this;
switch (_that) {
case _UsersEntity() when $default != null:
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
case _UsersEntity() when $default != null:
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
case _UsersEntity():
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
case _UsersEntity() when $default != null:
return $default(_that.uId,_that.officeCode,_that.schoolCode,_that.schoolName);case _:
  return null;

}
}

}

/// @nodoc


class _UsersEntity implements UsersEntity {
  const _UsersEntity({this.uId, required this.officeCode, required this.schoolCode, required this.schoolName});
  

@override final  String? uId;
@override final  String officeCode;
@override final  String schoolCode;
@override final  String schoolName;

/// Create a copy of UsersEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UsersEntityCopyWith<_UsersEntity> get copyWith => __$UsersEntityCopyWithImpl<_UsersEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UsersEntity&&(identical(other.uId, uId) || other.uId == uId)&&(identical(other.officeCode, officeCode) || other.officeCode == officeCode)&&(identical(other.schoolCode, schoolCode) || other.schoolCode == schoolCode)&&(identical(other.schoolName, schoolName) || other.schoolName == schoolName));
}


@override
int get hashCode => Object.hash(runtimeType,uId,officeCode,schoolCode,schoolName);

@override
String toString() {
  return 'UsersEntity(uId: $uId, officeCode: $officeCode, schoolCode: $schoolCode, schoolName: $schoolName)';
}


}

/// @nodoc
abstract mixin class _$UsersEntityCopyWith<$Res> implements $UsersEntityCopyWith<$Res> {
  factory _$UsersEntityCopyWith(_UsersEntity value, $Res Function(_UsersEntity) _then) = __$UsersEntityCopyWithImpl;
@override @useResult
$Res call({
 String? uId, String officeCode, String schoolCode, String schoolName
});




}
/// @nodoc
class __$UsersEntityCopyWithImpl<$Res>
    implements _$UsersEntityCopyWith<$Res> {
  __$UsersEntityCopyWithImpl(this._self, this._then);

  final _UsersEntity _self;
  final $Res Function(_UsersEntity) _then;

/// Create a copy of UsersEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? uId = freezed,Object? officeCode = null,Object? schoolCode = null,Object? schoolName = null,}) {
  return _then(_UsersEntity(
uId: freezed == uId ? _self.uId : uId // ignore: cast_nullable_to_non_nullable
as String?,officeCode: null == officeCode ? _self.officeCode : officeCode // ignore: cast_nullable_to_non_nullable
as String,schoolCode: null == schoolCode ? _self.schoolCode : schoolCode // ignore: cast_nullable_to_non_nullable
as String,schoolName: null == schoolName ? _self.schoolName : schoolName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
