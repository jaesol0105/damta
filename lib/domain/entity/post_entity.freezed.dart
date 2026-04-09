// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PostEntity {

 String? get pId;// 게시글 id
 String get uId;// 작성자 id
 String get pTitle;// 제목
 String get pContent;// 내용
 String get pWriter;// 작성자 이름
 DateTime? get pCreatedAt;// 생성 시간
 String? get pImageUrl;// 이미지 url
 int? get viewCount;// 조회수
 int? get commentCount;// 댓글 수
 Map<String, String>? get reactions;
/// Create a copy of PostEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PostEntityCopyWith<PostEntity> get copyWith => _$PostEntityCopyWithImpl<PostEntity>(this as PostEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PostEntity&&(identical(other.pId, pId) || other.pId == pId)&&(identical(other.uId, uId) || other.uId == uId)&&(identical(other.pTitle, pTitle) || other.pTitle == pTitle)&&(identical(other.pContent, pContent) || other.pContent == pContent)&&(identical(other.pWriter, pWriter) || other.pWriter == pWriter)&&(identical(other.pCreatedAt, pCreatedAt) || other.pCreatedAt == pCreatedAt)&&(identical(other.pImageUrl, pImageUrl) || other.pImageUrl == pImageUrl)&&(identical(other.viewCount, viewCount) || other.viewCount == viewCount)&&(identical(other.commentCount, commentCount) || other.commentCount == commentCount)&&const DeepCollectionEquality().equals(other.reactions, reactions));
}


@override
int get hashCode => Object.hash(runtimeType,pId,uId,pTitle,pContent,pWriter,pCreatedAt,pImageUrl,viewCount,commentCount,const DeepCollectionEquality().hash(reactions));

@override
String toString() {
  return 'PostEntity(pId: $pId, uId: $uId, pTitle: $pTitle, pContent: $pContent, pWriter: $pWriter, pCreatedAt: $pCreatedAt, pImageUrl: $pImageUrl, viewCount: $viewCount, commentCount: $commentCount, reactions: $reactions)';
}


}

/// @nodoc
abstract mixin class $PostEntityCopyWith<$Res>  {
  factory $PostEntityCopyWith(PostEntity value, $Res Function(PostEntity) _then) = _$PostEntityCopyWithImpl;
@useResult
$Res call({
 String? pId, String uId, String pTitle, String pContent, String pWriter, DateTime? pCreatedAt, String? pImageUrl, int? viewCount, int? commentCount, Map<String, String>? reactions
});




}
/// @nodoc
class _$PostEntityCopyWithImpl<$Res>
    implements $PostEntityCopyWith<$Res> {
  _$PostEntityCopyWithImpl(this._self, this._then);

  final PostEntity _self;
  final $Res Function(PostEntity) _then;

/// Create a copy of PostEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? pId = freezed,Object? uId = null,Object? pTitle = null,Object? pContent = null,Object? pWriter = null,Object? pCreatedAt = freezed,Object? pImageUrl = freezed,Object? viewCount = freezed,Object? commentCount = freezed,Object? reactions = freezed,}) {
  return _then(_self.copyWith(
pId: freezed == pId ? _self.pId : pId // ignore: cast_nullable_to_non_nullable
as String?,uId: null == uId ? _self.uId : uId // ignore: cast_nullable_to_non_nullable
as String,pTitle: null == pTitle ? _self.pTitle : pTitle // ignore: cast_nullable_to_non_nullable
as String,pContent: null == pContent ? _self.pContent : pContent // ignore: cast_nullable_to_non_nullable
as String,pWriter: null == pWriter ? _self.pWriter : pWriter // ignore: cast_nullable_to_non_nullable
as String,pCreatedAt: freezed == pCreatedAt ? _self.pCreatedAt : pCreatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,pImageUrl: freezed == pImageUrl ? _self.pImageUrl : pImageUrl // ignore: cast_nullable_to_non_nullable
as String?,viewCount: freezed == viewCount ? _self.viewCount : viewCount // ignore: cast_nullable_to_non_nullable
as int?,commentCount: freezed == commentCount ? _self.commentCount : commentCount // ignore: cast_nullable_to_non_nullable
as int?,reactions: freezed == reactions ? _self.reactions : reactions // ignore: cast_nullable_to_non_nullable
as Map<String, String>?,
  ));
}

}


/// Adds pattern-matching-related methods to [PostEntity].
extension PostEntityPatterns on PostEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PostEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PostEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PostEntity value)  $default,){
final _that = this;
switch (_that) {
case _PostEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PostEntity value)?  $default,){
final _that = this;
switch (_that) {
case _PostEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? pId,  String uId,  String pTitle,  String pContent,  String pWriter,  DateTime? pCreatedAt,  String? pImageUrl,  int? viewCount,  int? commentCount,  Map<String, String>? reactions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PostEntity() when $default != null:
return $default(_that.pId,_that.uId,_that.pTitle,_that.pContent,_that.pWriter,_that.pCreatedAt,_that.pImageUrl,_that.viewCount,_that.commentCount,_that.reactions);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? pId,  String uId,  String pTitle,  String pContent,  String pWriter,  DateTime? pCreatedAt,  String? pImageUrl,  int? viewCount,  int? commentCount,  Map<String, String>? reactions)  $default,) {final _that = this;
switch (_that) {
case _PostEntity():
return $default(_that.pId,_that.uId,_that.pTitle,_that.pContent,_that.pWriter,_that.pCreatedAt,_that.pImageUrl,_that.viewCount,_that.commentCount,_that.reactions);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? pId,  String uId,  String pTitle,  String pContent,  String pWriter,  DateTime? pCreatedAt,  String? pImageUrl,  int? viewCount,  int? commentCount,  Map<String, String>? reactions)?  $default,) {final _that = this;
switch (_that) {
case _PostEntity() when $default != null:
return $default(_that.pId,_that.uId,_that.pTitle,_that.pContent,_that.pWriter,_that.pCreatedAt,_that.pImageUrl,_that.viewCount,_that.commentCount,_that.reactions);case _:
  return null;

}
}

}

/// @nodoc


class _PostEntity implements PostEntity {
  const _PostEntity({this.pId, required this.uId, required this.pTitle, required this.pContent, required this.pWriter, this.pCreatedAt, this.pImageUrl, this.viewCount, this.commentCount, final  Map<String, String>? reactions}): _reactions = reactions;
  

@override final  String? pId;
// 게시글 id
@override final  String uId;
// 작성자 id
@override final  String pTitle;
// 제목
@override final  String pContent;
// 내용
@override final  String pWriter;
// 작성자 이름
@override final  DateTime? pCreatedAt;
// 생성 시간
@override final  String? pImageUrl;
// 이미지 url
@override final  int? viewCount;
// 조회수
@override final  int? commentCount;
// 댓글 수
 final  Map<String, String>? _reactions;
// 댓글 수
@override Map<String, String>? get reactions {
  final value = _reactions;
  if (value == null) return null;
  if (_reactions is EqualUnmodifiableMapView) return _reactions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of PostEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PostEntityCopyWith<_PostEntity> get copyWith => __$PostEntityCopyWithImpl<_PostEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PostEntity&&(identical(other.pId, pId) || other.pId == pId)&&(identical(other.uId, uId) || other.uId == uId)&&(identical(other.pTitle, pTitle) || other.pTitle == pTitle)&&(identical(other.pContent, pContent) || other.pContent == pContent)&&(identical(other.pWriter, pWriter) || other.pWriter == pWriter)&&(identical(other.pCreatedAt, pCreatedAt) || other.pCreatedAt == pCreatedAt)&&(identical(other.pImageUrl, pImageUrl) || other.pImageUrl == pImageUrl)&&(identical(other.viewCount, viewCount) || other.viewCount == viewCount)&&(identical(other.commentCount, commentCount) || other.commentCount == commentCount)&&const DeepCollectionEquality().equals(other._reactions, _reactions));
}


@override
int get hashCode => Object.hash(runtimeType,pId,uId,pTitle,pContent,pWriter,pCreatedAt,pImageUrl,viewCount,commentCount,const DeepCollectionEquality().hash(_reactions));

@override
String toString() {
  return 'PostEntity(pId: $pId, uId: $uId, pTitle: $pTitle, pContent: $pContent, pWriter: $pWriter, pCreatedAt: $pCreatedAt, pImageUrl: $pImageUrl, viewCount: $viewCount, commentCount: $commentCount, reactions: $reactions)';
}


}

/// @nodoc
abstract mixin class _$PostEntityCopyWith<$Res> implements $PostEntityCopyWith<$Res> {
  factory _$PostEntityCopyWith(_PostEntity value, $Res Function(_PostEntity) _then) = __$PostEntityCopyWithImpl;
@override @useResult
$Res call({
 String? pId, String uId, String pTitle, String pContent, String pWriter, DateTime? pCreatedAt, String? pImageUrl, int? viewCount, int? commentCount, Map<String, String>? reactions
});




}
/// @nodoc
class __$PostEntityCopyWithImpl<$Res>
    implements _$PostEntityCopyWith<$Res> {
  __$PostEntityCopyWithImpl(this._self, this._then);

  final _PostEntity _self;
  final $Res Function(_PostEntity) _then;

/// Create a copy of PostEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? pId = freezed,Object? uId = null,Object? pTitle = null,Object? pContent = null,Object? pWriter = null,Object? pCreatedAt = freezed,Object? pImageUrl = freezed,Object? viewCount = freezed,Object? commentCount = freezed,Object? reactions = freezed,}) {
  return _then(_PostEntity(
pId: freezed == pId ? _self.pId : pId // ignore: cast_nullable_to_non_nullable
as String?,uId: null == uId ? _self.uId : uId // ignore: cast_nullable_to_non_nullable
as String,pTitle: null == pTitle ? _self.pTitle : pTitle // ignore: cast_nullable_to_non_nullable
as String,pContent: null == pContent ? _self.pContent : pContent // ignore: cast_nullable_to_non_nullable
as String,pWriter: null == pWriter ? _self.pWriter : pWriter // ignore: cast_nullable_to_non_nullable
as String,pCreatedAt: freezed == pCreatedAt ? _self.pCreatedAt : pCreatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,pImageUrl: freezed == pImageUrl ? _self.pImageUrl : pImageUrl // ignore: cast_nullable_to_non_nullable
as String?,viewCount: freezed == viewCount ? _self.viewCount : viewCount // ignore: cast_nullable_to_non_nullable
as int?,commentCount: freezed == commentCount ? _self.commentCount : commentCount // ignore: cast_nullable_to_non_nullable
as int?,reactions: freezed == reactions ? _self._reactions : reactions // ignore: cast_nullable_to_non_nullable
as Map<String, String>?,
  ));
}


}

// dart format on
