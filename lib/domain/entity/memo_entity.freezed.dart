// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'memo_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MemoEntity {

 String get content;
/// Create a copy of MemoEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MemoEntityCopyWith<MemoEntity> get copyWith => _$MemoEntityCopyWithImpl<MemoEntity>(this as MemoEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MemoEntity&&(identical(other.content, content) || other.content == content));
}


@override
int get hashCode => Object.hash(runtimeType,content);

@override
String toString() {
  return 'MemoEntity(content: $content)';
}


}

/// @nodoc
abstract mixin class $MemoEntityCopyWith<$Res>  {
  factory $MemoEntityCopyWith(MemoEntity value, $Res Function(MemoEntity) _then) = _$MemoEntityCopyWithImpl;
@useResult
$Res call({
 String content
});




}
/// @nodoc
class _$MemoEntityCopyWithImpl<$Res>
    implements $MemoEntityCopyWith<$Res> {
  _$MemoEntityCopyWithImpl(this._self, this._then);

  final MemoEntity _self;
  final $Res Function(MemoEntity) _then;

/// Create a copy of MemoEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? content = null,}) {
  return _then(_self.copyWith(
content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [MemoEntity].
extension MemoEntityPatterns on MemoEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MemoEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MemoEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MemoEntity value)  $default,){
final _that = this;
switch (_that) {
case _MemoEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MemoEntity value)?  $default,){
final _that = this;
switch (_that) {
case _MemoEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String content)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MemoEntity() when $default != null:
return $default(_that.content);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String content)  $default,) {final _that = this;
switch (_that) {
case _MemoEntity():
return $default(_that.content);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String content)?  $default,) {final _that = this;
switch (_that) {
case _MemoEntity() when $default != null:
return $default(_that.content);case _:
  return null;

}
}

}

/// @nodoc


class _MemoEntity implements MemoEntity {
  const _MemoEntity({required this.content});
  

@override final  String content;

/// Create a copy of MemoEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MemoEntityCopyWith<_MemoEntity> get copyWith => __$MemoEntityCopyWithImpl<_MemoEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MemoEntity&&(identical(other.content, content) || other.content == content));
}


@override
int get hashCode => Object.hash(runtimeType,content);

@override
String toString() {
  return 'MemoEntity(content: $content)';
}


}

/// @nodoc
abstract mixin class _$MemoEntityCopyWith<$Res> implements $MemoEntityCopyWith<$Res> {
  factory _$MemoEntityCopyWith(_MemoEntity value, $Res Function(_MemoEntity) _then) = __$MemoEntityCopyWithImpl;
@override @useResult
$Res call({
 String content
});




}
/// @nodoc
class __$MemoEntityCopyWithImpl<$Res>
    implements _$MemoEntityCopyWith<$Res> {
  __$MemoEntityCopyWithImpl(this._self, this._then);

  final _MemoEntity _self;
  final $Res Function(_MemoEntity) _then;

/// Create a copy of MemoEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? content = null,}) {
  return _then(_MemoEntity(
content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
