// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PostDto {

@JsonKey(name: "p_id") String? get pId;@JsonKey(name: "u_id") String get uId;@JsonKey(name: "p_title") String get pTitle;@JsonKey(name: "p_content") String get pContent;@JsonKey(name: "p_writer") String get pWriter;@JsonKey(name: "p_created_at", fromJson: TimestampConverter.toDateTime, toJson: TimestampConverter.toTimestamp) DateTime? get pCreatedAt;@JsonKey(name: "p_image_url") String? get pImageUrl;@JsonKey(name: "view_count") int? get viewCount;@JsonKey(name: "comment_count") int? get commentCount;@JsonKey(name: "reactions") Map<String, String>? get reactions;
/// Create a copy of PostDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PostDtoCopyWith<PostDto> get copyWith => _$PostDtoCopyWithImpl<PostDto>(this as PostDto, _$identity);

  /// Serializes this PostDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PostDto&&(identical(other.pId, pId) || other.pId == pId)&&(identical(other.uId, uId) || other.uId == uId)&&(identical(other.pTitle, pTitle) || other.pTitle == pTitle)&&(identical(other.pContent, pContent) || other.pContent == pContent)&&(identical(other.pWriter, pWriter) || other.pWriter == pWriter)&&(identical(other.pCreatedAt, pCreatedAt) || other.pCreatedAt == pCreatedAt)&&(identical(other.pImageUrl, pImageUrl) || other.pImageUrl == pImageUrl)&&(identical(other.viewCount, viewCount) || other.viewCount == viewCount)&&(identical(other.commentCount, commentCount) || other.commentCount == commentCount)&&const DeepCollectionEquality().equals(other.reactions, reactions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,pId,uId,pTitle,pContent,pWriter,pCreatedAt,pImageUrl,viewCount,commentCount,const DeepCollectionEquality().hash(reactions));

@override
String toString() {
  return 'PostDto(pId: $pId, uId: $uId, pTitle: $pTitle, pContent: $pContent, pWriter: $pWriter, pCreatedAt: $pCreatedAt, pImageUrl: $pImageUrl, viewCount: $viewCount, commentCount: $commentCount, reactions: $reactions)';
}


}

/// @nodoc
abstract mixin class $PostDtoCopyWith<$Res>  {
  factory $PostDtoCopyWith(PostDto value, $Res Function(PostDto) _then) = _$PostDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "p_id") String? pId,@JsonKey(name: "u_id") String uId,@JsonKey(name: "p_title") String pTitle,@JsonKey(name: "p_content") String pContent,@JsonKey(name: "p_writer") String pWriter,@JsonKey(name: "p_created_at", fromJson: TimestampConverter.toDateTime, toJson: TimestampConverter.toTimestamp) DateTime? pCreatedAt,@JsonKey(name: "p_image_url") String? pImageUrl,@JsonKey(name: "view_count") int? viewCount,@JsonKey(name: "comment_count") int? commentCount,@JsonKey(name: "reactions") Map<String, String>? reactions
});




}
/// @nodoc
class _$PostDtoCopyWithImpl<$Res>
    implements $PostDtoCopyWith<$Res> {
  _$PostDtoCopyWithImpl(this._self, this._then);

  final PostDto _self;
  final $Res Function(PostDto) _then;

/// Create a copy of PostDto
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


/// Adds pattern-matching-related methods to [PostDto].
extension PostDtoPatterns on PostDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PostDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PostDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PostDto value)  $default,){
final _that = this;
switch (_that) {
case _PostDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PostDto value)?  $default,){
final _that = this;
switch (_that) {
case _PostDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "p_id")  String? pId, @JsonKey(name: "u_id")  String uId, @JsonKey(name: "p_title")  String pTitle, @JsonKey(name: "p_content")  String pContent, @JsonKey(name: "p_writer")  String pWriter, @JsonKey(name: "p_created_at", fromJson: TimestampConverter.toDateTime, toJson: TimestampConverter.toTimestamp)  DateTime? pCreatedAt, @JsonKey(name: "p_image_url")  String? pImageUrl, @JsonKey(name: "view_count")  int? viewCount, @JsonKey(name: "comment_count")  int? commentCount, @JsonKey(name: "reactions")  Map<String, String>? reactions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PostDto() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "p_id")  String? pId, @JsonKey(name: "u_id")  String uId, @JsonKey(name: "p_title")  String pTitle, @JsonKey(name: "p_content")  String pContent, @JsonKey(name: "p_writer")  String pWriter, @JsonKey(name: "p_created_at", fromJson: TimestampConverter.toDateTime, toJson: TimestampConverter.toTimestamp)  DateTime? pCreatedAt, @JsonKey(name: "p_image_url")  String? pImageUrl, @JsonKey(name: "view_count")  int? viewCount, @JsonKey(name: "comment_count")  int? commentCount, @JsonKey(name: "reactions")  Map<String, String>? reactions)  $default,) {final _that = this;
switch (_that) {
case _PostDto():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "p_id")  String? pId, @JsonKey(name: "u_id")  String uId, @JsonKey(name: "p_title")  String pTitle, @JsonKey(name: "p_content")  String pContent, @JsonKey(name: "p_writer")  String pWriter, @JsonKey(name: "p_created_at", fromJson: TimestampConverter.toDateTime, toJson: TimestampConverter.toTimestamp)  DateTime? pCreatedAt, @JsonKey(name: "p_image_url")  String? pImageUrl, @JsonKey(name: "view_count")  int? viewCount, @JsonKey(name: "comment_count")  int? commentCount, @JsonKey(name: "reactions")  Map<String, String>? reactions)?  $default,) {final _that = this;
switch (_that) {
case _PostDto() when $default != null:
return $default(_that.pId,_that.uId,_that.pTitle,_that.pContent,_that.pWriter,_that.pCreatedAt,_that.pImageUrl,_that.viewCount,_that.commentCount,_that.reactions);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PostDto implements PostDto {
  const _PostDto({@JsonKey(name: "p_id") required this.pId, @JsonKey(name: "u_id") required this.uId, @JsonKey(name: "p_title") required this.pTitle, @JsonKey(name: "p_content") required this.pContent, @JsonKey(name: "p_writer") required this.pWriter, @JsonKey(name: "p_created_at", fromJson: TimestampConverter.toDateTime, toJson: TimestampConverter.toTimestamp) required this.pCreatedAt, @JsonKey(name: "p_image_url") this.pImageUrl, @JsonKey(name: "view_count") this.viewCount, @JsonKey(name: "comment_count") this.commentCount, @JsonKey(name: "reactions") final  Map<String, String>? reactions}): _reactions = reactions;
  factory _PostDto.fromJson(Map<String, dynamic> json) => _$PostDtoFromJson(json);

@override@JsonKey(name: "p_id") final  String? pId;
@override@JsonKey(name: "u_id") final  String uId;
@override@JsonKey(name: "p_title") final  String pTitle;
@override@JsonKey(name: "p_content") final  String pContent;
@override@JsonKey(name: "p_writer") final  String pWriter;
@override@JsonKey(name: "p_created_at", fromJson: TimestampConverter.toDateTime, toJson: TimestampConverter.toTimestamp) final  DateTime? pCreatedAt;
@override@JsonKey(name: "p_image_url") final  String? pImageUrl;
@override@JsonKey(name: "view_count") final  int? viewCount;
@override@JsonKey(name: "comment_count") final  int? commentCount;
 final  Map<String, String>? _reactions;
@override@JsonKey(name: "reactions") Map<String, String>? get reactions {
  final value = _reactions;
  if (value == null) return null;
  if (_reactions is EqualUnmodifiableMapView) return _reactions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of PostDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PostDtoCopyWith<_PostDto> get copyWith => __$PostDtoCopyWithImpl<_PostDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PostDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PostDto&&(identical(other.pId, pId) || other.pId == pId)&&(identical(other.uId, uId) || other.uId == uId)&&(identical(other.pTitle, pTitle) || other.pTitle == pTitle)&&(identical(other.pContent, pContent) || other.pContent == pContent)&&(identical(other.pWriter, pWriter) || other.pWriter == pWriter)&&(identical(other.pCreatedAt, pCreatedAt) || other.pCreatedAt == pCreatedAt)&&(identical(other.pImageUrl, pImageUrl) || other.pImageUrl == pImageUrl)&&(identical(other.viewCount, viewCount) || other.viewCount == viewCount)&&(identical(other.commentCount, commentCount) || other.commentCount == commentCount)&&const DeepCollectionEquality().equals(other._reactions, _reactions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,pId,uId,pTitle,pContent,pWriter,pCreatedAt,pImageUrl,viewCount,commentCount,const DeepCollectionEquality().hash(_reactions));

@override
String toString() {
  return 'PostDto(pId: $pId, uId: $uId, pTitle: $pTitle, pContent: $pContent, pWriter: $pWriter, pCreatedAt: $pCreatedAt, pImageUrl: $pImageUrl, viewCount: $viewCount, commentCount: $commentCount, reactions: $reactions)';
}


}

/// @nodoc
abstract mixin class _$PostDtoCopyWith<$Res> implements $PostDtoCopyWith<$Res> {
  factory _$PostDtoCopyWith(_PostDto value, $Res Function(_PostDto) _then) = __$PostDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "p_id") String? pId,@JsonKey(name: "u_id") String uId,@JsonKey(name: "p_title") String pTitle,@JsonKey(name: "p_content") String pContent,@JsonKey(name: "p_writer") String pWriter,@JsonKey(name: "p_created_at", fromJson: TimestampConverter.toDateTime, toJson: TimestampConverter.toTimestamp) DateTime? pCreatedAt,@JsonKey(name: "p_image_url") String? pImageUrl,@JsonKey(name: "view_count") int? viewCount,@JsonKey(name: "comment_count") int? commentCount,@JsonKey(name: "reactions") Map<String, String>? reactions
});




}
/// @nodoc
class __$PostDtoCopyWithImpl<$Res>
    implements _$PostDtoCopyWith<$Res> {
  __$PostDtoCopyWithImpl(this._self, this._then);

  final _PostDto _self;
  final $Res Function(_PostDto) _then;

/// Create a copy of PostDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? pId = freezed,Object? uId = null,Object? pTitle = null,Object? pContent = null,Object? pWriter = null,Object? pCreatedAt = freezed,Object? pImageUrl = freezed,Object? viewCount = freezed,Object? commentCount = freezed,Object? reactions = freezed,}) {
  return _then(_PostDto(
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
