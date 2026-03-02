// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'report_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ReportEntity {

 String? get rId; String get reporterUid; ReportTargetType get targetType; String get targetId; String get targetUid; ReportReason get reason; String get schoolCode; DateTime get rCreatedAt;
/// Create a copy of ReportEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReportEntityCopyWith<ReportEntity> get copyWith => _$ReportEntityCopyWithImpl<ReportEntity>(this as ReportEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReportEntity&&(identical(other.rId, rId) || other.rId == rId)&&(identical(other.reporterUid, reporterUid) || other.reporterUid == reporterUid)&&(identical(other.targetType, targetType) || other.targetType == targetType)&&(identical(other.targetId, targetId) || other.targetId == targetId)&&(identical(other.targetUid, targetUid) || other.targetUid == targetUid)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.schoolCode, schoolCode) || other.schoolCode == schoolCode)&&(identical(other.rCreatedAt, rCreatedAt) || other.rCreatedAt == rCreatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,rId,reporterUid,targetType,targetId,targetUid,reason,schoolCode,rCreatedAt);

@override
String toString() {
  return 'ReportEntity(rId: $rId, reporterUid: $reporterUid, targetType: $targetType, targetId: $targetId, targetUid: $targetUid, reason: $reason, schoolCode: $schoolCode, rCreatedAt: $rCreatedAt)';
}


}

/// @nodoc
abstract mixin class $ReportEntityCopyWith<$Res>  {
  factory $ReportEntityCopyWith(ReportEntity value, $Res Function(ReportEntity) _then) = _$ReportEntityCopyWithImpl;
@useResult
$Res call({
 String? rId, String reporterUid, ReportTargetType targetType, String targetId, String targetUid, ReportReason reason, String schoolCode, DateTime rCreatedAt
});




}
/// @nodoc
class _$ReportEntityCopyWithImpl<$Res>
    implements $ReportEntityCopyWith<$Res> {
  _$ReportEntityCopyWithImpl(this._self, this._then);

  final ReportEntity _self;
  final $Res Function(ReportEntity) _then;

/// Create a copy of ReportEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? rId = freezed,Object? reporterUid = null,Object? targetType = null,Object? targetId = null,Object? targetUid = null,Object? reason = null,Object? schoolCode = null,Object? rCreatedAt = null,}) {
  return _then(_self.copyWith(
rId: freezed == rId ? _self.rId : rId // ignore: cast_nullable_to_non_nullable
as String?,reporterUid: null == reporterUid ? _self.reporterUid : reporterUid // ignore: cast_nullable_to_non_nullable
as String,targetType: null == targetType ? _self.targetType : targetType // ignore: cast_nullable_to_non_nullable
as ReportTargetType,targetId: null == targetId ? _self.targetId : targetId // ignore: cast_nullable_to_non_nullable
as String,targetUid: null == targetUid ? _self.targetUid : targetUid // ignore: cast_nullable_to_non_nullable
as String,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as ReportReason,schoolCode: null == schoolCode ? _self.schoolCode : schoolCode // ignore: cast_nullable_to_non_nullable
as String,rCreatedAt: null == rCreatedAt ? _self.rCreatedAt : rCreatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [ReportEntity].
extension ReportEntityPatterns on ReportEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReportEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReportEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReportEntity value)  $default,){
final _that = this;
switch (_that) {
case _ReportEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReportEntity value)?  $default,){
final _that = this;
switch (_that) {
case _ReportEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? rId,  String reporterUid,  ReportTargetType targetType,  String targetId,  String targetUid,  ReportReason reason,  String schoolCode,  DateTime rCreatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReportEntity() when $default != null:
return $default(_that.rId,_that.reporterUid,_that.targetType,_that.targetId,_that.targetUid,_that.reason,_that.schoolCode,_that.rCreatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? rId,  String reporterUid,  ReportTargetType targetType,  String targetId,  String targetUid,  ReportReason reason,  String schoolCode,  DateTime rCreatedAt)  $default,) {final _that = this;
switch (_that) {
case _ReportEntity():
return $default(_that.rId,_that.reporterUid,_that.targetType,_that.targetId,_that.targetUid,_that.reason,_that.schoolCode,_that.rCreatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? rId,  String reporterUid,  ReportTargetType targetType,  String targetId,  String targetUid,  ReportReason reason,  String schoolCode,  DateTime rCreatedAt)?  $default,) {final _that = this;
switch (_that) {
case _ReportEntity() when $default != null:
return $default(_that.rId,_that.reporterUid,_that.targetType,_that.targetId,_that.targetUid,_that.reason,_that.schoolCode,_that.rCreatedAt);case _:
  return null;

}
}

}

/// @nodoc


class _ReportEntity implements ReportEntity {
  const _ReportEntity({this.rId, required this.reporterUid, required this.targetType, required this.targetId, required this.targetUid, required this.reason, required this.schoolCode, required this.rCreatedAt});
  

@override final  String? rId;
@override final  String reporterUid;
@override final  ReportTargetType targetType;
@override final  String targetId;
@override final  String targetUid;
@override final  ReportReason reason;
@override final  String schoolCode;
@override final  DateTime rCreatedAt;

/// Create a copy of ReportEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReportEntityCopyWith<_ReportEntity> get copyWith => __$ReportEntityCopyWithImpl<_ReportEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReportEntity&&(identical(other.rId, rId) || other.rId == rId)&&(identical(other.reporterUid, reporterUid) || other.reporterUid == reporterUid)&&(identical(other.targetType, targetType) || other.targetType == targetType)&&(identical(other.targetId, targetId) || other.targetId == targetId)&&(identical(other.targetUid, targetUid) || other.targetUid == targetUid)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.schoolCode, schoolCode) || other.schoolCode == schoolCode)&&(identical(other.rCreatedAt, rCreatedAt) || other.rCreatedAt == rCreatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,rId,reporterUid,targetType,targetId,targetUid,reason,schoolCode,rCreatedAt);

@override
String toString() {
  return 'ReportEntity(rId: $rId, reporterUid: $reporterUid, targetType: $targetType, targetId: $targetId, targetUid: $targetUid, reason: $reason, schoolCode: $schoolCode, rCreatedAt: $rCreatedAt)';
}


}

/// @nodoc
abstract mixin class _$ReportEntityCopyWith<$Res> implements $ReportEntityCopyWith<$Res> {
  factory _$ReportEntityCopyWith(_ReportEntity value, $Res Function(_ReportEntity) _then) = __$ReportEntityCopyWithImpl;
@override @useResult
$Res call({
 String? rId, String reporterUid, ReportTargetType targetType, String targetId, String targetUid, ReportReason reason, String schoolCode, DateTime rCreatedAt
});




}
/// @nodoc
class __$ReportEntityCopyWithImpl<$Res>
    implements _$ReportEntityCopyWith<$Res> {
  __$ReportEntityCopyWithImpl(this._self, this._then);

  final _ReportEntity _self;
  final $Res Function(_ReportEntity) _then;

/// Create a copy of ReportEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? rId = freezed,Object? reporterUid = null,Object? targetType = null,Object? targetId = null,Object? targetUid = null,Object? reason = null,Object? schoolCode = null,Object? rCreatedAt = null,}) {
  return _then(_ReportEntity(
rId: freezed == rId ? _self.rId : rId // ignore: cast_nullable_to_non_nullable
as String?,reporterUid: null == reporterUid ? _self.reporterUid : reporterUid // ignore: cast_nullable_to_non_nullable
as String,targetType: null == targetType ? _self.targetType : targetType // ignore: cast_nullable_to_non_nullable
as ReportTargetType,targetId: null == targetId ? _self.targetId : targetId // ignore: cast_nullable_to_non_nullable
as String,targetUid: null == targetUid ? _self.targetUid : targetUid // ignore: cast_nullable_to_non_nullable
as String,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as ReportReason,schoolCode: null == schoolCode ? _self.schoolCode : schoolCode // ignore: cast_nullable_to_non_nullable
as String,rCreatedAt: null == rCreatedAt ? _self.rCreatedAt : rCreatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
