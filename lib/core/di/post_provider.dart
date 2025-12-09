import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:damta/data/data_source/post_data_source.dart';
import 'package:damta/data/data_source_impl/post_data_source_impl.dart';
import 'package:damta/data/repository_impl/post_repository_impl.dart';
import 'package:damta/domain/repository/post_repository.dart';
import 'package:damta/domain/usecase/post_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'post_provider.g.dart';

@riverpod
FirebaseFirestore firestore(Ref ref) {
  return FirebaseFirestore.instance;
}

@riverpod
PostDataSource postDataSource(Ref ref) {
  final firestore = ref.watch(firestoreProvider);
  return PostDataSourceImpl(firestore);
}

@riverpod
PostRepository postRepository(Ref ref) {
  final postDataSource = ref.watch(postDataSourceProvider);
  return PostRepositoryImpl(postDataSource);
}

@riverpod
PostUsecase postUsecase(Ref ref) {
  final postRepository = ref.watch(postRepositoryProvider);
  return PostUsecase(postRepository);
}
