// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comment_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CommentEntity {

 String? get cId; String get cContent; String get cWriter; DateTime get cCreatedAt; String get pId;
/// Create a copy of CommentEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CommentEntityCopyWith<CommentEntity> get copyWith => _$CommentEntityCopyWithImpl<CommentEntity>(this as CommentEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CommentEntity&&(identical(other.cId, cId) || other.cId == cId)&&(identical(other.cContent, cContent) || other.cContent == cContent)&&(identical(other.cWriter, cWriter) || other.cWriter == cWriter)&&(identical(other.cCreatedAt, cCreatedAt) || other.cCreatedAt == cCreatedAt)&&(identical(other.pId, pId) || other.pId == pId));
}


@override
int get hashCode => Object.hash(runtimeType,cId,cContent,cWriter,cCreatedAt,pId);

@override
String toString() {
  return 'CommentEntity(cId: $cId, cContent: $cContent, cWriter: $cWriter, cCreatedAt: $cCreatedAt, pId: $pId)';
}


}

/// @nodoc
abstract mixin class $CommentEntityCopyWith<$Res>  {
  factory $CommentEntityCopyWith(CommentEntity value, $Res Function(CommentEntity) _then) = _$CommentEntityCopyWithImpl;
@useResult
$Res call({
 String? cId, String cContent, String cWriter, DateTime cCreatedAt, String pId
});




}
/// @nodoc
class _$CommentEntityCopyWithImpl<$Res>
    implements $CommentEntityCopyWith<$Res> {
  _$CommentEntityCopyWithImpl(this._self, this._then);

  final CommentEntity _self;
  final $Res Function(CommentEntity) _then;

/// Create a copy of CommentEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? cId = freezed,Object? cContent = null,Object? cWriter = null,Object? cCreatedAt = null,Object? pId = null,}) {
  return _then(_self.copyWith(
cId: freezed == cId ? _self.cId : cId // ignore: cast_nullable_to_non_nullable
as String?,cContent: null == cContent ? _self.cContent : cContent // ignore: cast_nullable_to_non_nullable
as String,cWriter: null == cWriter ? _self.cWriter : cWriter // ignore: cast_nullable_to_non_nullable
as String,cCreatedAt: null == cCreatedAt ? _self.cCreatedAt : cCreatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,pId: null == pId ? _self.pId : pId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CommentEntity].
extension CommentEntityPatterns on CommentEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CommentEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CommentEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CommentEntity value)  $default,){
final _that = this;
switch (_that) {
case _CommentEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CommentEntity value)?  $default,){
final _that = this;
switch (_that) {
case _CommentEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? cId,  String cContent,  String cWriter,  DateTime cCreatedAt,  String pId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CommentEntity() when $default != null:
return $default(_that.cId,_that.cContent,_that.cWriter,_that.cCreatedAt,_that.pId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? cId,  String cContent,  String cWriter,  DateTime cCreatedAt,  String pId)  $default,) {final _that = this;
switch (_that) {
case _CommentEntity():
return $default(_that.cId,_that.cContent,_that.cWriter,_that.cCreatedAt,_that.pId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? cId,  String cContent,  String cWriter,  DateTime cCreatedAt,  String pId)?  $default,) {final _that = this;
switch (_that) {
case _CommentEntity() when $default != null:
return $default(_that.cId,_that.cContent,_that.cWriter,_that.cCreatedAt,_that.pId);case _:
  return null;

}
}

}

/// @nodoc


class _CommentEntity implements CommentEntity {
  const _CommentEntity({this.cId, required this.cContent, required this.cWriter, required this.cCreatedAt, required this.pId});
  

@override final  String? cId;
@override final  String cContent;
@override final  String cWriter;
@override final  DateTime cCreatedAt;
@override final  String pId;

/// Create a copy of CommentEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CommentEntityCopyWith<_CommentEntity> get copyWith => __$CommentEntityCopyWithImpl<_CommentEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CommentEntity&&(identical(other.cId, cId) || other.cId == cId)&&(identical(other.cContent, cContent) || other.cContent == cContent)&&(identical(other.cWriter, cWriter) || other.cWriter == cWriter)&&(identical(other.cCreatedAt, cCreatedAt) || other.cCreatedAt == cCreatedAt)&&(identical(other.pId, pId) || other.pId == pId));
}


@override
int get hashCode => Object.hash(runtimeType,cId,cContent,cWriter,cCreatedAt,pId);

@override
String toString() {
  return 'CommentEntity(cId: $cId, cContent: $cContent, cWriter: $cWriter, cCreatedAt: $cCreatedAt, pId: $pId)';
}


}

/// @nodoc
abstract mixin class _$CommentEntityCopyWith<$Res> implements $CommentEntityCopyWith<$Res> {
  factory _$CommentEntityCopyWith(_CommentEntity value, $Res Function(_CommentEntity) _then) = __$CommentEntityCopyWithImpl;
@override @useResult
$Res call({
 String? cId, String cContent, String cWriter, DateTime cCreatedAt, String pId
});




}
/// @nodoc
class __$CommentEntityCopyWithImpl<$Res>
    implements _$CommentEntityCopyWith<$Res> {
  __$CommentEntityCopyWithImpl(this._self, this._then);

  final _CommentEntity _self;
  final $Res Function(_CommentEntity) _then;

/// Create a copy of CommentEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? cId = freezed,Object? cContent = null,Object? cWriter = null,Object? cCreatedAt = null,Object? pId = null,}) {
  return _then(_CommentEntity(
cId: freezed == cId ? _self.cId : cId // ignore: cast_nullable_to_non_nullable
as String?,cContent: null == cContent ? _self.cContent : cContent // ignore: cast_nullable_to_non_nullable
as String,cWriter: null == cWriter ? _self.cWriter : cWriter // ignore: cast_nullable_to_non_nullable
as String,cCreatedAt: null == cCreatedAt ? _self.cCreatedAt : cCreatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,pId: null == pId ? _self.pId : pId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
