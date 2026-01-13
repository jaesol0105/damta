import 'dart:io';
import 'dart:developer';
import 'package:firebase_storage/firebase_storage.dart';

abstract class StorageDataSource {
  /// 파일을 지정된 경로에 업로드하고 URL 반환
  Future<String> uploadFile({required File file, required String path});

  /// 파일 삭제
  Future<void> deleteFile(String path);
}

class StorageDataSourceImpl implements StorageDataSource {
  StorageDataSourceImpl({required this.storage});
  final FirebaseStorage storage;

  @override
  Future<String> uploadFile({required File file, required String path}) async {
    try {
      final ref = storage.ref().child(path); // 저장소 참조. path: 파일이 저장될 위치
      await ref.putFile(file); // 파일 업로드
      return await ref.getDownloadURL(); // url 받아오기
    } on FirebaseException catch (e, s) {
      log(
        'FirebaseStorage uploadFile 실패 : ${e.message}',
        error: e,
        stackTrace: s,
      );
      rethrow;
    } catch (e, s) {
      log('알 수 없는 오류로 인한 uploadFile 실패 : $e', error: e, stackTrace: s);
      rethrow;
    }
  }

  @override
  Future<void> deleteFile(String path) {
    // TODO: implement deleteFile
    throw UnimplementedError();
  }
}
