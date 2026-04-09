import 'dart:io';

import 'package:damta/core/di/provider.dart';
import 'package:damta/core/logger/log.dart';
import 'package:damta/core/util/content_filter.dart';

import 'package:damta/core/util/string_extension.dart';
import 'package:damta/domain/entity/post_entity.dart';
import 'package:damta/domain/repository/post_repository.dart';
import 'package:damta/presentation/ui_provider/users_provider.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'post_editor_view_model.freezed.dart';
part 'post_editor_view_model.g.dart';

/// post_editor_page 상태 클래스
@freezed
abstract class PostEditorState with _$PostEditorState {
  const factory PostEditorState({
    required PostEntity originalPost,
    @Default('') String title, // 현재 컨트롤러의 텍스트
    @Default('') String content, // 현재 컨트롤러의 텍스트
    XFile? image, // 새로 선택한 이미지
    @Default(false) bool isImageRemoved, // 기존 이미지를 삭제했는지
    required bool isEdited, // 수정 사항이 있는지
    @Default(false) bool loading, // 저장 중 로딩
  }) = _PostEditorState;

  const PostEditorState._();

  /// 현재 이미지가 존재하는지 (UI에 표시할지 결정)
  bool get hasImage {
    if (isImageRemoved) return false;
    return image != null || originalPost.pImageUrl.isNotNullOrEmpty;
  }

  /// 로컬 파일 이미지
  File? get localImageFile {
    if (image == null) return null;
    return File(image!.path);
  }

  /// 네트워크 이미지 URL
  String? get imageUrl {
    if (image != null) return null; // 새 이미지가 있으면 네트워크 이미지 무시
    if (isImageRemoved) return null;
    return originalPost.pImageUrl;
  }

  /// 완료 버튼 활성화 여부
  bool get canSubmit {
    return isEdited && !loading;
  }
}

@riverpod
class PostEditorViewModel extends _$PostEditorViewModel {
  PostRepository get repo => ref.read(postRepositoryProvider);

  @override
  PostEditorState build(PostEntity post) {
    return PostEditorState(
      originalPost: post,
      title: post.pTitle,
      content: post.pContent,
      isEdited: false,
    );
  }

  /// 업로드할 이미지 선택
  void pickImages() async {
    // 갤러리 사진 선택
    final picked = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 85,
      requestFullMetadata: false,
    );
    if (picked == null) return;
    state = state.copyWith(image: picked, isImageRemoved: false);
    checkIfEdited();
  }

  /// 선택한 이미지 삭제
  void removeImage() {
    state = state.copyWith(image: null, isImageRemoved: true);
    checkIfEdited();
  }

  /// 변경 여부 체크
  void checkIfEdited() {
    final titleChanged = state.title != state.originalPost.pTitle;
    final contentChanged = state.content != state.originalPost.pContent;
    bool imageChanged = false;

    if (state.isImageRemoved) {
      // 기존에 이미지가 있었는데 삭제한 경우
      imageChanged = state.originalPost.pImageUrl.isNotNullOrEmpty;
    } else if (state.image != null) {
      // 새 이미지 선택한 경우
      imageChanged = true;
    }

    final changed = titleChanged || contentChanged || imageChanged; // 제목 내용 사진
    state = state.copyWith(isEdited: changed);
  }

  /// 제목 상태값 변경
  void setTitle(String title) {
    state = state.copyWith(title: title);
    checkIfEdited();
  }

  /// 내용 상태값 변경
  void setContent(String content) {
    state = state.copyWith(content: content);
    checkIfEdited();
  }

  /// 유효성 검증
  String? validate() {
    if (state.title.isEmpty) return '제목을 입력해 주세요';
    if (state.content.isEmpty) return '내용을 입력해 주세요';
    if (ContentFilter.containsBlockedWord(state.title) ||
        ContentFilter.containsBlockedWord(state.content)) {
      return '부적절한 표현이 포함되어 있습니다. 내용을 확인해주세요.';
    }
    return null;
  }

  /// 포스트 저장
  Future<(bool success, String? error, PostEntity? data)> save() async {
    final error = validate(); // 유효성 검사
    if (error != null) return (false, error, null);
    if (state.loading) return (false, null, null); // 로딩 걸려있을 땐 호출 안하고 리턴

    try {
      state = state.copyWith(loading: true); // 더블 탭 방지용 로딩 플래그
      final storageRepo = ref.read(storageRepositoryProvider);

      String url;
      if (state.isImageRemoved) {
        // 이미지 삭제 했을경우
        url = '';
      } else if (state.image != null) {
        // 새 이미지 업로드 했을경우
        final image = state.image!;
        url = await storageRepo.uploadPostImage(image.path);
      } else {
        // 이미지 변경 없으면 기존 URL 유지
        url = state.originalPost.pImageUrl ?? '';
      }

      // 유저 정보 가져오기
      final uId = ref.read(currentUIdProvider);
      String? schoolCode;
      try {
        final user = await ref.read(userProvider.future);
        schoolCode = user.schoolCode;
      } catch (_) {}

      final updated = state.originalPost.copyWith(
        uId: uId ?? '',
        pTitle: state.title,
        pContent: state.content,
        pImageUrl: url,
      );
      if (updated.pId == null || updated.pId!.isEmpty) {
        // pId 없으면 새 게시글 생성
        await repo.addPost(updated, schoolCode: schoolCode);
      } else {
        // pId 있으면 내용 수정
        await repo.updatePostContent(updated);
      }
      // 일단 반환은 하는데 현재 로직상 낙관적업데이트 안하고 그냥 refresh함. 나중에 수정 예정
      return (true, null, updated);
      // 예외 전파
    } catch (e, s) {
      Log.e('PostEditorViewModel save 실패: $e', error: e, stackTrace: s);
      rethrow;
    } finally {
      state = state.copyWith(loading: false);
    }
  }
}
