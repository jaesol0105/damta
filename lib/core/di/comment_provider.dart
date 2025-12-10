import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:damta/data/data_source/comment_data_source.dart';
import 'package:damta/data/data_source_impl/comment_data_source_impl.dart';
import 'package:damta/data/repository_impl/comment_repository_impl.dart';
import 'package:damta/domain/repository/comment_repository.dart';
import 'package:damta/domain/usecase/comment_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'comment_provider.g.dart';

@riverpod
FirebaseFirestore firestore(Ref ref) {
  return FirebaseFirestore.instance;
}

@riverpod
CommentDataSource commentDataSource(Ref ref) {
  final firestore = ref.watch(firestoreProvider);
  return CommentDataSourceImpl(firestore);
}

@riverpod
CommentRepository commentRepository(Ref ref) {
  final commentDataSource = ref.watch(commentDataSourceProvider);
  return CommentRepositoryImpl(commentDataSource);
}

@riverpod
CommentUsecase commentUsecase(Ref ref) {
  final commentRepository = ref.watch(commentRepositoryProvider);
  return CommentUsecase(commentRepository);
}
