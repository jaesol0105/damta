import 'dart:io';

abstract class StorageDataSource {
  /// 파일을 지정된 경로에 업로드하고 URL 반환
  Future<String> uploadFile({required File file, required String path});

  /// 파일 삭제
  Future<void> deleteFile(String path);
}
