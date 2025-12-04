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

 String? get pId; String get uId; String get pTitle; String get pContent; String get pWriter; DateTime get pCreatedAt; Image? get pImage; List<String>? get emojis; int? get view; List<CommentEntity>? get comments;
/// Create a copy of PostEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PostEntityCopyWith<PostEntity> get copyWith => _$PostEntityCopyWithImpl<PostEntity>(this as PostEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PostEntity&&(identical(other.pId, pId) || other.pId == pId)&&(identical(other.uId, uId) || other.uId == uId)&&(identical(other.pTitle, pTitle) || other.pTitle == pTitle)&&(identical(other.pContent, pContent) || other.pContent == pContent)&&(identical(other.pWriter, pWriter) || other.pWriter == pWriter)&&(identical(other.pCreatedAt, pCreatedAt) || other.pCreatedAt == pCreatedAt)&&(identical(other.pImage, pImage) || other.pImage == pImage)&&const DeepCollectionEquality().equals(other.emojis, emojis)&&(identical(other.view, view) || other.view == view)&&const DeepCollectionEquality().equals(other.comments, comments));
}


@override
int get hashCode => Object.hash(runtimeType,pId,uId,pTitle,pContent,pWriter,pCreatedAt,pImage,const DeepCollectionEquality().hash(emojis),view,const DeepCollectionEquality().hash(comments));

@override
String toString() {
  return 'PostEntity(pId: $pId, uId: $uId, pTitle: $pTitle, pContent: $pContent, pWriter: $pWriter, pCreatedAt: $pCreatedAt, pImage: $pImage, emojis: $emojis, view: $view, comments: $comments)';
}


}

/// @nodoc
abstract mixin class $PostEntityCopyWith<$Res>  {
  factory $PostEntityCopyWith(PostEntity value, $Res Function(PostEntity) _then) = _$PostEntityCopyWithImpl;
@useResult
$Res call({
 String? pId, String uId, String pTitle, String pContent, String pWriter, DateTime pCreatedAt, Image? pImage, List<String>? emojis, int? view, List<CommentEntity>? comments
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
@pragma('vm:prefer-inline') @override $Res call({Object? pId = freezed,Object? uId = null,Object? pTitle = null,Object? pContent = null,Object? pWriter = null,Object? pCreatedAt = null,Object? pImage = freezed,Object? emojis = freezed,Object? view = freezed,Object? comments = freezed,}) {
  return _then(_self.copyWith(
pId: freezed == pId ? _self.pId : pId // ignore: cast_nullable_to_non_nullable
as String?,uId: null == uId ? _self.uId : uId // ignore: cast_nullable_to_non_nullable
as String,pTitle: null == pTitle ? _self.pTitle : pTitle // ignore: cast_nullable_to_non_nullable
as String,pContent: null == pContent ? _self.pContent : pContent // ignore: cast_nullable_to_non_nullable
as String,pWriter: null == pWriter ? _self.pWriter : pWriter // ignore: cast_nullable_to_non_nullable
as String,pCreatedAt: null == pCreatedAt ? _self.pCreatedAt : pCreatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,pImage: freezed == pImage ? _self.pImage : pImage // ignore: cast_nullable_to_non_nullable
as Image?,emojis: freezed == emojis ? _self.emojis : emojis // ignore: cast_nullable_to_non_nullable
as List<String>?,view: freezed == view ? _self.view : view // ignore: cast_nullable_to_non_nullable
as int?,comments: freezed == comments ? _self.comments : comments // ignore: cast_nullable_to_non_nullable
as List<CommentEntity>?,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? pId,  String uId,  String pTitle,  String pContent,  String pWriter,  DateTime pCreatedAt,  Image? pImage,  List<String>? emojis,  int? view,  List<CommentEntity>? comments)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PostEntity() when $default != null:
return $default(_that.pId,_that.uId,_that.pTitle,_that.pContent,_that.pWriter,_that.pCreatedAt,_that.pImage,_that.emojis,_that.view,_that.comments);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? pId,  String uId,  String pTitle,  String pContent,  String pWriter,  DateTime pCreatedAt,  Image? pImage,  List<String>? emojis,  int? view,  List<CommentEntity>? comments)  $default,) {final _that = this;
switch (_that) {
case _PostEntity():
return $default(_that.pId,_that.uId,_that.pTitle,_that.pContent,_that.pWriter,_that.pCreatedAt,_that.pImage,_that.emojis,_that.view,_that.comments);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? pId,  String uId,  String pTitle,  String pContent,  String pWriter,  DateTime pCreatedAt,  Image? pImage,  List<String>? emojis,  int? view,  List<CommentEntity>? comments)?  $default,) {final _that = this;
switch (_that) {
case _PostEntity() when $default != null:
return $default(_that.pId,_that.uId,_that.pTitle,_that.pContent,_that.pWriter,_that.pCreatedAt,_that.pImage,_that.emojis,_that.view,_that.comments);case _:
  return null;

}
}

}

/// @nodoc


class _PostEntity implements PostEntity {
  const _PostEntity({this.pId, required this.uId, required this.pTitle, required this.pContent, required this.pWriter, required this.pCreatedAt, this.pImage, final  List<String>? emojis, this.view, final  List<CommentEntity>? comments}): _emojis = emojis,_comments = comments;
  

@override final  String? pId;
@override final  String uId;
@override final  String pTitle;
@override final  String pContent;
@override final  String pWriter;
@override final  DateTime pCreatedAt;
@override final  Image? pImage;
 final  List<String>? _emojis;
@override List<String>? get emojis {
  final value = _emojis;
  if (value == null) return null;
  if (_emojis is EqualUnmodifiableListView) return _emojis;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  int? view;
 final  List<CommentEntity>? _comments;
@override List<CommentEntity>? get comments {
  final value = _comments;
  if (value == null) return null;
  if (_comments is EqualUnmodifiableListView) return _comments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of PostEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PostEntityCopyWith<_PostEntity> get copyWith => __$PostEntityCopyWithImpl<_PostEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PostEntity&&(identical(other.pId, pId) || other.pId == pId)&&(identical(other.uId, uId) || other.uId == uId)&&(identical(other.pTitle, pTitle) || other.pTitle == pTitle)&&(identical(other.pContent, pContent) || other.pContent == pContent)&&(identical(other.pWriter, pWriter) || other.pWriter == pWriter)&&(identical(other.pCreatedAt, pCreatedAt) || other.pCreatedAt == pCreatedAt)&&(identical(other.pImage, pImage) || other.pImage == pImage)&&const DeepCollectionEquality().equals(other._emojis, _emojis)&&(identical(other.view, view) || other.view == view)&&const DeepCollectionEquality().equals(other._comments, _comments));
}


@override
int get hashCode => Object.hash(runtimeType,pId,uId,pTitle,pContent,pWriter,pCreatedAt,pImage,const DeepCollectionEquality().hash(_emojis),view,const DeepCollectionEquality().hash(_comments));

@override
String toString() {
  return 'PostEntity(pId: $pId, uId: $uId, pTitle: $pTitle, pContent: $pContent, pWriter: $pWriter, pCreatedAt: $pCreatedAt, pImage: $pImage, emojis: $emojis, view: $view, comments: $comments)';
}


}

/// @nodoc
abstract mixin class _$PostEntityCopyWith<$Res> implements $PostEntityCopyWith<$Res> {
  factory _$PostEntityCopyWith(_PostEntity value, $Res Function(_PostEntity) _then) = __$PostEntityCopyWithImpl;
@override @useResult
$Res call({
 String? pId, String uId, String pTitle, String pContent, String pWriter, DateTime pCreatedAt, Image? pImage, List<String>? emojis, int? view, List<CommentEntity>? comments
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
@override @pragma('vm:prefer-inline') $Res call({Object? pId = freezed,Object? uId = null,Object? pTitle = null,Object? pContent = null,Object? pWriter = null,Object? pCreatedAt = null,Object? pImage = freezed,Object? emojis = freezed,Object? view = freezed,Object? comments = freezed,}) {
  return _then(_PostEntity(
pId: freezed == pId ? _self.pId : pId // ignore: cast_nullable_to_non_nullable
as String?,uId: null == uId ? _self.uId : uId // ignore: cast_nullable_to_non_nullable
as String,pTitle: null == pTitle ? _self.pTitle : pTitle // ignore: cast_nullable_to_non_nullable
as String,pContent: null == pContent ? _self.pContent : pContent // ignore: cast_nullable_to_non_nullable
as String,pWriter: null == pWriter ? _self.pWriter : pWriter // ignore: cast_nullable_to_non_nullable
as String,pCreatedAt: null == pCreatedAt ? _self.pCreatedAt : pCreatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,pImage: freezed == pImage ? _self.pImage : pImage // ignore: cast_nullable_to_non_nullable
as Image?,emojis: freezed == emojis ? _self._emojis : emojis // ignore: cast_nullable_to_non_nullable
as List<String>?,view: freezed == view ? _self.view : view // ignore: cast_nullable_to_non_nullable
as int?,comments: freezed == comments ? _self._comments : comments // ignore: cast_nullable_to_non_nullable
as List<CommentEntity>?,
  ));
}


}

// dart format on
