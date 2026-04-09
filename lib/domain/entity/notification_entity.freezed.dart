// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NotificationEntity {

 String? get nId; String get uId;// 사용자 ID (내가 쓴 게시글 알림만 받아오기 위한 변수)
 String get pId;// 해당 게시글 ID
 String get pTitle;// 해당 게시글 제목
 DateTime? get nCreatedAt;// 알림 생성 시간
 bool get isComment;// 댓글인지 여부 (true = 댓글, false = 반응)
 String get content;// 댓글,반응 내용
 bool get isNew;// 새로운 알림인지 여부 (댓글 표시 형식 다르게 하기 위한 변수)
 bool get isRead;
/// Create a copy of NotificationEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotificationEntityCopyWith<NotificationEntity> get copyWith => _$NotificationEntityCopyWithImpl<NotificationEntity>(this as NotificationEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationEntity&&(identical(other.nId, nId) || other.nId == nId)&&(identical(other.uId, uId) || other.uId == uId)&&(identical(other.pId, pId) || other.pId == pId)&&(identical(other.pTitle, pTitle) || other.pTitle == pTitle)&&(identical(other.nCreatedAt, nCreatedAt) || other.nCreatedAt == nCreatedAt)&&(identical(other.isComment, isComment) || other.isComment == isComment)&&(identical(other.content, content) || other.content == content)&&(identical(other.isNew, isNew) || other.isNew == isNew)&&(identical(other.isRead, isRead) || other.isRead == isRead));
}


@override
int get hashCode => Object.hash(runtimeType,nId,uId,pId,pTitle,nCreatedAt,isComment,content,isNew,isRead);

@override
String toString() {
  return 'NotificationEntity(nId: $nId, uId: $uId, pId: $pId, pTitle: $pTitle, nCreatedAt: $nCreatedAt, isComment: $isComment, content: $content, isNew: $isNew, isRead: $isRead)';
}


}

/// @nodoc
abstract mixin class $NotificationEntityCopyWith<$Res>  {
  factory $NotificationEntityCopyWith(NotificationEntity value, $Res Function(NotificationEntity) _then) = _$NotificationEntityCopyWithImpl;
@useResult
$Res call({
 String? nId, String uId, String pId, String pTitle, DateTime? nCreatedAt, bool isComment, String content, bool isNew, bool isRead
});




}
/// @nodoc
class _$NotificationEntityCopyWithImpl<$Res>
    implements $NotificationEntityCopyWith<$Res> {
  _$NotificationEntityCopyWithImpl(this._self, this._then);

  final NotificationEntity _self;
  final $Res Function(NotificationEntity) _then;

/// Create a copy of NotificationEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? nId = freezed,Object? uId = null,Object? pId = null,Object? pTitle = null,Object? nCreatedAt = freezed,Object? isComment = null,Object? content = null,Object? isNew = null,Object? isRead = null,}) {
  return _then(_self.copyWith(
nId: freezed == nId ? _self.nId : nId // ignore: cast_nullable_to_non_nullable
as String?,uId: null == uId ? _self.uId : uId // ignore: cast_nullable_to_non_nullable
as String,pId: null == pId ? _self.pId : pId // ignore: cast_nullable_to_non_nullable
as String,pTitle: null == pTitle ? _self.pTitle : pTitle // ignore: cast_nullable_to_non_nullable
as String,nCreatedAt: freezed == nCreatedAt ? _self.nCreatedAt : nCreatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,isComment: null == isComment ? _self.isComment : isComment // ignore: cast_nullable_to_non_nullable
as bool,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,isNew: null == isNew ? _self.isNew : isNew // ignore: cast_nullable_to_non_nullable
as bool,isRead: null == isRead ? _self.isRead : isRead // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [NotificationEntity].
extension NotificationEntityPatterns on NotificationEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NotificationEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NotificationEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NotificationEntity value)  $default,){
final _that = this;
switch (_that) {
case _NotificationEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NotificationEntity value)?  $default,){
final _that = this;
switch (_that) {
case _NotificationEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? nId,  String uId,  String pId,  String pTitle,  DateTime? nCreatedAt,  bool isComment,  String content,  bool isNew,  bool isRead)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NotificationEntity() when $default != null:
return $default(_that.nId,_that.uId,_that.pId,_that.pTitle,_that.nCreatedAt,_that.isComment,_that.content,_that.isNew,_that.isRead);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? nId,  String uId,  String pId,  String pTitle,  DateTime? nCreatedAt,  bool isComment,  String content,  bool isNew,  bool isRead)  $default,) {final _that = this;
switch (_that) {
case _NotificationEntity():
return $default(_that.nId,_that.uId,_that.pId,_that.pTitle,_that.nCreatedAt,_that.isComment,_that.content,_that.isNew,_that.isRead);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? nId,  String uId,  String pId,  String pTitle,  DateTime? nCreatedAt,  bool isComment,  String content,  bool isNew,  bool isRead)?  $default,) {final _that = this;
switch (_that) {
case _NotificationEntity() when $default != null:
return $default(_that.nId,_that.uId,_that.pId,_that.pTitle,_that.nCreatedAt,_that.isComment,_that.content,_that.isNew,_that.isRead);case _:
  return null;

}
}

}

/// @nodoc


class _NotificationEntity implements NotificationEntity {
  const _NotificationEntity({this.nId, required this.uId, required this.pId, required this.pTitle, this.nCreatedAt, required this.isComment, required this.content, required this.isNew, required this.isRead});
  

@override final  String? nId;
@override final  String uId;
// 사용자 ID (내가 쓴 게시글 알림만 받아오기 위한 변수)
@override final  String pId;
// 해당 게시글 ID
@override final  String pTitle;
// 해당 게시글 제목
@override final  DateTime? nCreatedAt;
// 알림 생성 시간
@override final  bool isComment;
// 댓글인지 여부 (true = 댓글, false = 반응)
@override final  String content;
// 댓글,반응 내용
@override final  bool isNew;
// 새로운 알림인지 여부 (댓글 표시 형식 다르게 하기 위한 변수)
@override final  bool isRead;

/// Create a copy of NotificationEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NotificationEntityCopyWith<_NotificationEntity> get copyWith => __$NotificationEntityCopyWithImpl<_NotificationEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NotificationEntity&&(identical(other.nId, nId) || other.nId == nId)&&(identical(other.uId, uId) || other.uId == uId)&&(identical(other.pId, pId) || other.pId == pId)&&(identical(other.pTitle, pTitle) || other.pTitle == pTitle)&&(identical(other.nCreatedAt, nCreatedAt) || other.nCreatedAt == nCreatedAt)&&(identical(other.isComment, isComment) || other.isComment == isComment)&&(identical(other.content, content) || other.content == content)&&(identical(other.isNew, isNew) || other.isNew == isNew)&&(identical(other.isRead, isRead) || other.isRead == isRead));
}


@override
int get hashCode => Object.hash(runtimeType,nId,uId,pId,pTitle,nCreatedAt,isComment,content,isNew,isRead);

@override
String toString() {
  return 'NotificationEntity(nId: $nId, uId: $uId, pId: $pId, pTitle: $pTitle, nCreatedAt: $nCreatedAt, isComment: $isComment, content: $content, isNew: $isNew, isRead: $isRead)';
}


}

/// @nodoc
abstract mixin class _$NotificationEntityCopyWith<$Res> implements $NotificationEntityCopyWith<$Res> {
  factory _$NotificationEntityCopyWith(_NotificationEntity value, $Res Function(_NotificationEntity) _then) = __$NotificationEntityCopyWithImpl;
@override @useResult
$Res call({
 String? nId, String uId, String pId, String pTitle, DateTime? nCreatedAt, bool isComment, String content, bool isNew, bool isRead
});




}
/// @nodoc
class __$NotificationEntityCopyWithImpl<$Res>
    implements _$NotificationEntityCopyWith<$Res> {
  __$NotificationEntityCopyWithImpl(this._self, this._then);

  final _NotificationEntity _self;
  final $Res Function(_NotificationEntity) _then;

/// Create a copy of NotificationEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? nId = freezed,Object? uId = null,Object? pId = null,Object? pTitle = null,Object? nCreatedAt = freezed,Object? isComment = null,Object? content = null,Object? isNew = null,Object? isRead = null,}) {
  return _then(_NotificationEntity(
nId: freezed == nId ? _self.nId : nId // ignore: cast_nullable_to_non_nullable
as String?,uId: null == uId ? _self.uId : uId // ignore: cast_nullable_to_non_nullable
as String,pId: null == pId ? _self.pId : pId // ignore: cast_nullable_to_non_nullable
as String,pTitle: null == pTitle ? _self.pTitle : pTitle // ignore: cast_nullable_to_non_nullable
as String,nCreatedAt: freezed == nCreatedAt ? _self.nCreatedAt : nCreatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,isComment: null == isComment ? _self.isComment : isComment // ignore: cast_nullable_to_non_nullable
as bool,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,isNew: null == isNew ? _self.isNew : isNew // ignore: cast_nullable_to_non_nullable
as bool,isRead: null == isRead ? _self.isRead : isRead // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
