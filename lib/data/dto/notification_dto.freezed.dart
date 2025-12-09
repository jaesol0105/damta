// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NotificationDto {

 String? get nId; String get uId; String get pId; String get pTitle;@JsonKey(fromJson: _convertToDateTime, toJson: _convertFromDateTime) DateTime get createdAt; bool get isComment; String get content; bool get isNew; bool get isRead;
/// Create a copy of NotificationDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotificationDtoCopyWith<NotificationDto> get copyWith => _$NotificationDtoCopyWithImpl<NotificationDto>(this as NotificationDto, _$identity);

  /// Serializes this NotificationDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationDto&&(identical(other.nId, nId) || other.nId == nId)&&(identical(other.uId, uId) || other.uId == uId)&&(identical(other.pId, pId) || other.pId == pId)&&(identical(other.pTitle, pTitle) || other.pTitle == pTitle)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.isComment, isComment) || other.isComment == isComment)&&(identical(other.content, content) || other.content == content)&&(identical(other.isNew, isNew) || other.isNew == isNew)&&(identical(other.isRead, isRead) || other.isRead == isRead));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,nId,uId,pId,pTitle,createdAt,isComment,content,isNew,isRead);

@override
String toString() {
  return 'NotificationDto(nId: $nId, uId: $uId, pId: $pId, pTitle: $pTitle, createdAt: $createdAt, isComment: $isComment, content: $content, isNew: $isNew, isRead: $isRead)';
}


}

/// @nodoc
abstract mixin class $NotificationDtoCopyWith<$Res>  {
  factory $NotificationDtoCopyWith(NotificationDto value, $Res Function(NotificationDto) _then) = _$NotificationDtoCopyWithImpl;
@useResult
$Res call({
 String? nId, String uId, String pId, String pTitle,@JsonKey(fromJson: _convertToDateTime, toJson: _convertFromDateTime) DateTime createdAt, bool isComment, String content, bool isNew, bool isRead
});




}
/// @nodoc
class _$NotificationDtoCopyWithImpl<$Res>
    implements $NotificationDtoCopyWith<$Res> {
  _$NotificationDtoCopyWithImpl(this._self, this._then);

  final NotificationDto _self;
  final $Res Function(NotificationDto) _then;

/// Create a copy of NotificationDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? nId = freezed,Object? uId = null,Object? pId = null,Object? pTitle = null,Object? createdAt = null,Object? isComment = null,Object? content = null,Object? isNew = null,Object? isRead = null,}) {
  return _then(_self.copyWith(
nId: freezed == nId ? _self.nId : nId // ignore: cast_nullable_to_non_nullable
as String?,uId: null == uId ? _self.uId : uId // ignore: cast_nullable_to_non_nullable
as String,pId: null == pId ? _self.pId : pId // ignore: cast_nullable_to_non_nullable
as String,pTitle: null == pTitle ? _self.pTitle : pTitle // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,isComment: null == isComment ? _self.isComment : isComment // ignore: cast_nullable_to_non_nullable
as bool,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,isNew: null == isNew ? _self.isNew : isNew // ignore: cast_nullable_to_non_nullable
as bool,isRead: null == isRead ? _self.isRead : isRead // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [NotificationDto].
extension NotificationDtoPatterns on NotificationDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NotificationDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NotificationDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NotificationDto value)  $default,){
final _that = this;
switch (_that) {
case _NotificationDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NotificationDto value)?  $default,){
final _that = this;
switch (_that) {
case _NotificationDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? nId,  String uId,  String pId,  String pTitle, @JsonKey(fromJson: _convertToDateTime, toJson: _convertFromDateTime)  DateTime createdAt,  bool isComment,  String content,  bool isNew,  bool isRead)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NotificationDto() when $default != null:
return $default(_that.nId,_that.uId,_that.pId,_that.pTitle,_that.createdAt,_that.isComment,_that.content,_that.isNew,_that.isRead);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? nId,  String uId,  String pId,  String pTitle, @JsonKey(fromJson: _convertToDateTime, toJson: _convertFromDateTime)  DateTime createdAt,  bool isComment,  String content,  bool isNew,  bool isRead)  $default,) {final _that = this;
switch (_that) {
case _NotificationDto():
return $default(_that.nId,_that.uId,_that.pId,_that.pTitle,_that.createdAt,_that.isComment,_that.content,_that.isNew,_that.isRead);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? nId,  String uId,  String pId,  String pTitle, @JsonKey(fromJson: _convertToDateTime, toJson: _convertFromDateTime)  DateTime createdAt,  bool isComment,  String content,  bool isNew,  bool isRead)?  $default,) {final _that = this;
switch (_that) {
case _NotificationDto() when $default != null:
return $default(_that.nId,_that.uId,_that.pId,_that.pTitle,_that.createdAt,_that.isComment,_that.content,_that.isNew,_that.isRead);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NotificationDto implements NotificationDto {
  const _NotificationDto({this.nId, required this.uId, required this.pId, required this.pTitle, @JsonKey(fromJson: _convertToDateTime, toJson: _convertFromDateTime) required this.createdAt, required this.isComment, required this.content, required this.isNew, required this.isRead});
  factory _NotificationDto.fromJson(Map<String, dynamic> json) => _$NotificationDtoFromJson(json);

@override final  String? nId;
@override final  String uId;
@override final  String pId;
@override final  String pTitle;
@override@JsonKey(fromJson: _convertToDateTime, toJson: _convertFromDateTime) final  DateTime createdAt;
@override final  bool isComment;
@override final  String content;
@override final  bool isNew;
@override final  bool isRead;

/// Create a copy of NotificationDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NotificationDtoCopyWith<_NotificationDto> get copyWith => __$NotificationDtoCopyWithImpl<_NotificationDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NotificationDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NotificationDto&&(identical(other.nId, nId) || other.nId == nId)&&(identical(other.uId, uId) || other.uId == uId)&&(identical(other.pId, pId) || other.pId == pId)&&(identical(other.pTitle, pTitle) || other.pTitle == pTitle)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.isComment, isComment) || other.isComment == isComment)&&(identical(other.content, content) || other.content == content)&&(identical(other.isNew, isNew) || other.isNew == isNew)&&(identical(other.isRead, isRead) || other.isRead == isRead));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,nId,uId,pId,pTitle,createdAt,isComment,content,isNew,isRead);

@override
String toString() {
  return 'NotificationDto(nId: $nId, uId: $uId, pId: $pId, pTitle: $pTitle, createdAt: $createdAt, isComment: $isComment, content: $content, isNew: $isNew, isRead: $isRead)';
}


}

/// @nodoc
abstract mixin class _$NotificationDtoCopyWith<$Res> implements $NotificationDtoCopyWith<$Res> {
  factory _$NotificationDtoCopyWith(_NotificationDto value, $Res Function(_NotificationDto) _then) = __$NotificationDtoCopyWithImpl;
@override @useResult
$Res call({
 String? nId, String uId, String pId, String pTitle,@JsonKey(fromJson: _convertToDateTime, toJson: _convertFromDateTime) DateTime createdAt, bool isComment, String content, bool isNew, bool isRead
});




}
/// @nodoc
class __$NotificationDtoCopyWithImpl<$Res>
    implements _$NotificationDtoCopyWith<$Res> {
  __$NotificationDtoCopyWithImpl(this._self, this._then);

  final _NotificationDto _self;
  final $Res Function(_NotificationDto) _then;

/// Create a copy of NotificationDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? nId = freezed,Object? uId = null,Object? pId = null,Object? pTitle = null,Object? createdAt = null,Object? isComment = null,Object? content = null,Object? isNew = null,Object? isRead = null,}) {
  return _then(_NotificationDto(
nId: freezed == nId ? _self.nId : nId // ignore: cast_nullable_to_non_nullable
as String?,uId: null == uId ? _self.uId : uId // ignore: cast_nullable_to_non_nullable
as String,pId: null == pId ? _self.pId : pId // ignore: cast_nullable_to_non_nullable
as String,pTitle: null == pTitle ? _self.pTitle : pTitle // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,isComment: null == isComment ? _self.isComment : isComment // ignore: cast_nullable_to_non_nullable
as bool,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,isNew: null == isNew ? _self.isNew : isNew // ignore: cast_nullable_to_non_nullable
as bool,isRead: null == isRead ? _self.isRead : isRead // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
