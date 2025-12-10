// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comment_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CommentDto {

@JsonKey(name: "c_id") String? get cId;@JsonKey(name: "u_id") String get uId;@JsonKey(name: "p_id") String get pId;@JsonKey(name: "c_content") String get cContent;@JsonKey(name: "c_writer") String get cWriter;@JsonKey(name: "c_created_at") DateTime get cCreatedAt;
/// Create a copy of CommentDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CommentDtoCopyWith<CommentDto> get copyWith => _$CommentDtoCopyWithImpl<CommentDto>(this as CommentDto, _$identity);

  /// Serializes this CommentDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CommentDto&&(identical(other.cId, cId) || other.cId == cId)&&(identical(other.uId, uId) || other.uId == uId)&&(identical(other.pId, pId) || other.pId == pId)&&(identical(other.cContent, cContent) || other.cContent == cContent)&&(identical(other.cWriter, cWriter) || other.cWriter == cWriter)&&(identical(other.cCreatedAt, cCreatedAt) || other.cCreatedAt == cCreatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,cId,uId,pId,cContent,cWriter,cCreatedAt);

@override
String toString() {
  return 'CommentDto(cId: $cId, uId: $uId, pId: $pId, cContent: $cContent, cWriter: $cWriter, cCreatedAt: $cCreatedAt)';
}


}

/// @nodoc
abstract mixin class $CommentDtoCopyWith<$Res>  {
  factory $CommentDtoCopyWith(CommentDto value, $Res Function(CommentDto) _then) = _$CommentDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "c_id") String? cId,@JsonKey(name: "u_id") String uId,@JsonKey(name: "p_id") String pId,@JsonKey(name: "c_content") String cContent,@JsonKey(name: "c_writer") String cWriter,@JsonKey(name: "c_created_at") DateTime cCreatedAt
});




}
/// @nodoc
class _$CommentDtoCopyWithImpl<$Res>
    implements $CommentDtoCopyWith<$Res> {
  _$CommentDtoCopyWithImpl(this._self, this._then);

  final CommentDto _self;
  final $Res Function(CommentDto) _then;

/// Create a copy of CommentDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? cId = freezed,Object? uId = null,Object? pId = null,Object? cContent = null,Object? cWriter = null,Object? cCreatedAt = null,}) {
  return _then(_self.copyWith(
cId: freezed == cId ? _self.cId : cId // ignore: cast_nullable_to_non_nullable
as String?,uId: null == uId ? _self.uId : uId // ignore: cast_nullable_to_non_nullable
as String,pId: null == pId ? _self.pId : pId // ignore: cast_nullable_to_non_nullable
as String,cContent: null == cContent ? _self.cContent : cContent // ignore: cast_nullable_to_non_nullable
as String,cWriter: null == cWriter ? _self.cWriter : cWriter // ignore: cast_nullable_to_non_nullable
as String,cCreatedAt: null == cCreatedAt ? _self.cCreatedAt : cCreatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [CommentDto].
extension CommentDtoPatterns on CommentDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CommentDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CommentDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CommentDto value)  $default,){
final _that = this;
switch (_that) {
case _CommentDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CommentDto value)?  $default,){
final _that = this;
switch (_that) {
case _CommentDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "c_id")  String? cId, @JsonKey(name: "u_id")  String uId, @JsonKey(name: "p_id")  String pId, @JsonKey(name: "c_content")  String cContent, @JsonKey(name: "c_writer")  String cWriter, @JsonKey(name: "c_created_at")  DateTime cCreatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CommentDto() when $default != null:
return $default(_that.cId,_that.uId,_that.pId,_that.cContent,_that.cWriter,_that.cCreatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "c_id")  String? cId, @JsonKey(name: "u_id")  String uId, @JsonKey(name: "p_id")  String pId, @JsonKey(name: "c_content")  String cContent, @JsonKey(name: "c_writer")  String cWriter, @JsonKey(name: "c_created_at")  DateTime cCreatedAt)  $default,) {final _that = this;
switch (_that) {
case _CommentDto():
return $default(_that.cId,_that.uId,_that.pId,_that.cContent,_that.cWriter,_that.cCreatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "c_id")  String? cId, @JsonKey(name: "u_id")  String uId, @JsonKey(name: "p_id")  String pId, @JsonKey(name: "c_content")  String cContent, @JsonKey(name: "c_writer")  String cWriter, @JsonKey(name: "c_created_at")  DateTime cCreatedAt)?  $default,) {final _that = this;
switch (_that) {
case _CommentDto() when $default != null:
return $default(_that.cId,_that.uId,_that.pId,_that.cContent,_that.cWriter,_that.cCreatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CommentDto implements CommentDto {
  const _CommentDto({@JsonKey(name: "c_id") this.cId, @JsonKey(name: "u_id") required this.uId, @JsonKey(name: "p_id") required this.pId, @JsonKey(name: "c_content") required this.cContent, @JsonKey(name: "c_writer") required this.cWriter, @JsonKey(name: "c_created_at") required this.cCreatedAt});
  factory _CommentDto.fromJson(Map<String, dynamic> json) => _$CommentDtoFromJson(json);

@override@JsonKey(name: "c_id") final  String? cId;
@override@JsonKey(name: "u_id") final  String uId;
@override@JsonKey(name: "p_id") final  String pId;
@override@JsonKey(name: "c_content") final  String cContent;
@override@JsonKey(name: "c_writer") final  String cWriter;
@override@JsonKey(name: "c_created_at") final  DateTime cCreatedAt;

/// Create a copy of CommentDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CommentDtoCopyWith<_CommentDto> get copyWith => __$CommentDtoCopyWithImpl<_CommentDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CommentDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CommentDto&&(identical(other.cId, cId) || other.cId == cId)&&(identical(other.uId, uId) || other.uId == uId)&&(identical(other.pId, pId) || other.pId == pId)&&(identical(other.cContent, cContent) || other.cContent == cContent)&&(identical(other.cWriter, cWriter) || other.cWriter == cWriter)&&(identical(other.cCreatedAt, cCreatedAt) || other.cCreatedAt == cCreatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,cId,uId,pId,cContent,cWriter,cCreatedAt);

@override
String toString() {
  return 'CommentDto(cId: $cId, uId: $uId, pId: $pId, cContent: $cContent, cWriter: $cWriter, cCreatedAt: $cCreatedAt)';
}


}

/// @nodoc
abstract mixin class _$CommentDtoCopyWith<$Res> implements $CommentDtoCopyWith<$Res> {
  factory _$CommentDtoCopyWith(_CommentDto value, $Res Function(_CommentDto) _then) = __$CommentDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "c_id") String? cId,@JsonKey(name: "u_id") String uId,@JsonKey(name: "p_id") String pId,@JsonKey(name: "c_content") String cContent,@JsonKey(name: "c_writer") String cWriter,@JsonKey(name: "c_created_at") DateTime cCreatedAt
});




}
/// @nodoc
class __$CommentDtoCopyWithImpl<$Res>
    implements _$CommentDtoCopyWith<$Res> {
  __$CommentDtoCopyWithImpl(this._self, this._then);

  final _CommentDto _self;
  final $Res Function(_CommentDto) _then;

/// Create a copy of CommentDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? cId = freezed,Object? uId = null,Object? pId = null,Object? cContent = null,Object? cWriter = null,Object? cCreatedAt = null,}) {
  return _then(_CommentDto(
cId: freezed == cId ? _self.cId : cId // ignore: cast_nullable_to_non_nullable
as String?,uId: null == uId ? _self.uId : uId // ignore: cast_nullable_to_non_nullable
as String,pId: null == pId ? _self.pId : pId // ignore: cast_nullable_to_non_nullable
as String,cContent: null == cContent ? _self.cContent : cContent // ignore: cast_nullable_to_non_nullable
as String,cWriter: null == cWriter ? _self.cWriter : cWriter // ignore: cast_nullable_to_non_nullable
as String,cCreatedAt: null == cCreatedAt ? _self.cCreatedAt : cCreatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
