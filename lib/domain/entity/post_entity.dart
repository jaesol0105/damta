import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_entity.freezed.dart';

@freezed
abstract class PostEntity with _$PostEntity {
  const factory PostEntity({
    String? pId, // 게시글 id
    required String uId, // 작성자 id
    required String pTitle, // 제목
    required String pContent, // 내용
    required String pWriter, // 작성자 이름
    DateTime? pCreatedAt, // 생성 시간
    String? pImageUrl, // 이미지 url
    int? viewCount, // 조회수
    int? commentCount, // 댓글 수
    Map<String, String>? reactions, // 반응 목록
  }) = _PostEntity;
}
