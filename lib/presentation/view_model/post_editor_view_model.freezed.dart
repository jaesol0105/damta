// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_editor_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PostEditorState {

 PostEntity get originalPost; String get title;// 현재 컨트롤러의 텍스트
 String get content;// 현재 컨트롤러의 텍스트
 XFile? get image;// 새로 선택한 이미지
 bool get isImageRemoved;// 기존 이미지를 삭제했는지
 bool get isEdited;// 수정 사항이 있는지
 bool get loading;
/// Create a copy of PostEditorState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PostEditorStateCopyWith<PostEditorState> get copyWith => _$PostEditorStateCopyWithImpl<PostEditorState>(this as PostEditorState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PostEditorState&&(identical(other.originalPost, originalPost) || other.originalPost == originalPost)&&(identical(other.title, title) || other.title == title)&&(identical(other.content, content) || other.content == content)&&(identical(other.image, image) || other.image == image)&&(identical(other.isImageRemoved, isImageRemoved) || other.isImageRemoved == isImageRemoved)&&(identical(other.isEdited, isEdited) || other.isEdited == isEdited)&&(identical(other.loading, loading) || other.loading == loading));
}


@override
int get hashCode => Object.hash(runtimeType,originalPost,title,content,image,isImageRemoved,isEdited,loading);

@override
String toString() {
  return 'PostEditorState(originalPost: $originalPost, title: $title, content: $content, image: $image, isImageRemoved: $isImageRemoved, isEdited: $isEdited, loading: $loading)';
}


}

/// @nodoc
abstract mixin class $PostEditorStateCopyWith<$Res>  {
  factory $PostEditorStateCopyWith(PostEditorState value, $Res Function(PostEditorState) _then) = _$PostEditorStateCopyWithImpl;
@useResult
$Res call({
 PostEntity originalPost, String title, String content, XFile? image, bool isImageRemoved, bool isEdited, bool loading
});


$PostEntityCopyWith<$Res> get originalPost;

}
/// @nodoc
class _$PostEditorStateCopyWithImpl<$Res>
    implements $PostEditorStateCopyWith<$Res> {
  _$PostEditorStateCopyWithImpl(this._self, this._then);

  final PostEditorState _self;
  final $Res Function(PostEditorState) _then;

/// Create a copy of PostEditorState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? originalPost = null,Object? title = null,Object? content = null,Object? image = freezed,Object? isImageRemoved = null,Object? isEdited = null,Object? loading = null,}) {
  return _then(_self.copyWith(
originalPost: null == originalPost ? _self.originalPost : originalPost // ignore: cast_nullable_to_non_nullable
as PostEntity,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as XFile?,isImageRemoved: null == isImageRemoved ? _self.isImageRemoved : isImageRemoved // ignore: cast_nullable_to_non_nullable
as bool,isEdited: null == isEdited ? _self.isEdited : isEdited // ignore: cast_nullable_to_non_nullable
as bool,loading: null == loading ? _self.loading : loading // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of PostEditorState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PostEntityCopyWith<$Res> get originalPost {
  
  return $PostEntityCopyWith<$Res>(_self.originalPost, (value) {
    return _then(_self.copyWith(originalPost: value));
  });
}
}


/// Adds pattern-matching-related methods to [PostEditorState].
extension PostEditorStatePatterns on PostEditorState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PostEditorState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PostEditorState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PostEditorState value)  $default,){
final _that = this;
switch (_that) {
case _PostEditorState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PostEditorState value)?  $default,){
final _that = this;
switch (_that) {
case _PostEditorState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PostEntity originalPost,  String title,  String content,  XFile? image,  bool isImageRemoved,  bool isEdited,  bool loading)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PostEditorState() when $default != null:
return $default(_that.originalPost,_that.title,_that.content,_that.image,_that.isImageRemoved,_that.isEdited,_that.loading);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PostEntity originalPost,  String title,  String content,  XFile? image,  bool isImageRemoved,  bool isEdited,  bool loading)  $default,) {final _that = this;
switch (_that) {
case _PostEditorState():
return $default(_that.originalPost,_that.title,_that.content,_that.image,_that.isImageRemoved,_that.isEdited,_that.loading);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PostEntity originalPost,  String title,  String content,  XFile? image,  bool isImageRemoved,  bool isEdited,  bool loading)?  $default,) {final _that = this;
switch (_that) {
case _PostEditorState() when $default != null:
return $default(_that.originalPost,_that.title,_that.content,_that.image,_that.isImageRemoved,_that.isEdited,_that.loading);case _:
  return null;

}
}

}

/// @nodoc


class _PostEditorState extends PostEditorState {
  const _PostEditorState({required this.originalPost, this.title = '', this.content = '', this.image, this.isImageRemoved = false, required this.isEdited, this.loading = false}): super._();
  

@override final  PostEntity originalPost;
@override@JsonKey() final  String title;
// 현재 컨트롤러의 텍스트
@override@JsonKey() final  String content;
// 현재 컨트롤러의 텍스트
@override final  XFile? image;
// 새로 선택한 이미지
@override@JsonKey() final  bool isImageRemoved;
// 기존 이미지를 삭제했는지
@override final  bool isEdited;
// 수정 사항이 있는지
@override@JsonKey() final  bool loading;

/// Create a copy of PostEditorState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PostEditorStateCopyWith<_PostEditorState> get copyWith => __$PostEditorStateCopyWithImpl<_PostEditorState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PostEditorState&&(identical(other.originalPost, originalPost) || other.originalPost == originalPost)&&(identical(other.title, title) || other.title == title)&&(identical(other.content, content) || other.content == content)&&(identical(other.image, image) || other.image == image)&&(identical(other.isImageRemoved, isImageRemoved) || other.isImageRemoved == isImageRemoved)&&(identical(other.isEdited, isEdited) || other.isEdited == isEdited)&&(identical(other.loading, loading) || other.loading == loading));
}


@override
int get hashCode => Object.hash(runtimeType,originalPost,title,content,image,isImageRemoved,isEdited,loading);

@override
String toString() {
  return 'PostEditorState(originalPost: $originalPost, title: $title, content: $content, image: $image, isImageRemoved: $isImageRemoved, isEdited: $isEdited, loading: $loading)';
}


}

/// @nodoc
abstract mixin class _$PostEditorStateCopyWith<$Res> implements $PostEditorStateCopyWith<$Res> {
  factory _$PostEditorStateCopyWith(_PostEditorState value, $Res Function(_PostEditorState) _then) = __$PostEditorStateCopyWithImpl;
@override @useResult
$Res call({
 PostEntity originalPost, String title, String content, XFile? image, bool isImageRemoved, bool isEdited, bool loading
});


@override $PostEntityCopyWith<$Res> get originalPost;

}
/// @nodoc
class __$PostEditorStateCopyWithImpl<$Res>
    implements _$PostEditorStateCopyWith<$Res> {
  __$PostEditorStateCopyWithImpl(this._self, this._then);

  final _PostEditorState _self;
  final $Res Function(_PostEditorState) _then;

/// Create a copy of PostEditorState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? originalPost = null,Object? title = null,Object? content = null,Object? image = freezed,Object? isImageRemoved = null,Object? isEdited = null,Object? loading = null,}) {
  return _then(_PostEditorState(
originalPost: null == originalPost ? _self.originalPost : originalPost // ignore: cast_nullable_to_non_nullable
as PostEntity,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as XFile?,isImageRemoved: null == isImageRemoved ? _self.isImageRemoved : isImageRemoved // ignore: cast_nullable_to_non_nullable
as bool,isEdited: null == isEdited ? _self.isEdited : isEdited // ignore: cast_nullable_to_non_nullable
as bool,loading: null == loading ? _self.loading : loading // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of PostEditorState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PostEntityCopyWith<$Res> get originalPost {
  
  return $PostEntityCopyWith<$Res>(_self.originalPost, (value) {
    return _then(_self.copyWith(originalPost: value));
  });
}
}

// dart format on
