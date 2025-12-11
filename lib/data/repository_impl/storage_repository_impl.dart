import 'dart:developer';
import 'dart:io';
import 'package:damta/data/data_source/remote/storage_data_source.dart';
import 'package:damta/domain/repository/storage_repository.dart';
import 'package:path/path.dart' as p;

class StorageRepositoryImpl implements StorageRepository {
  StorageRepositoryImpl({required this.dataSource});
  final StorageDataSource dataSource;

  @override
  Future<String> uploadPostImage(String filePath) async {
    try {
      final file = File(filePath);
      final ext = p.extension(filePath);
      final name = "post_${DateTime.now().millisecondsSinceEpoch}_$ext";
      final path = "post_images/$name";

      return await dataSource.uploadFile(file: file, path: path);
    } catch (e, s) {
      log('Repository uploadPostImage 실패: $e', error: e, stackTrace: s);
      rethrow;
    }
  }
}
