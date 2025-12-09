// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(firestore)
const firestoreProvider = FirestoreProvider._();

final class FirestoreProvider
    extends
        $FunctionalProvider<
          FirebaseFirestore,
          FirebaseFirestore,
          FirebaseFirestore
        >
    with $Provider<FirebaseFirestore> {
  const FirestoreProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'firestoreProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$firestoreHash();

  @$internal
  @override
  $ProviderElement<FirebaseFirestore> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  FirebaseFirestore create(Ref ref) {
    return firestore(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FirebaseFirestore value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FirebaseFirestore>(value),
    );
  }
}

String _$firestoreHash() => r'0e25e335c5657f593fc1baf3d9fd026e70bca7fa';

@ProviderFor(postDataSource)
const postDataSourceProvider = PostDataSourceProvider._();

final class PostDataSourceProvider
    extends $FunctionalProvider<PostDataSource, PostDataSource, PostDataSource>
    with $Provider<PostDataSource> {
  const PostDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'postDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$postDataSourceHash();

  @$internal
  @override
  $ProviderElement<PostDataSource> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  PostDataSource create(Ref ref) {
    return postDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PostDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PostDataSource>(value),
    );
  }
}

String _$postDataSourceHash() => r'460504de673267020f8b1b70fb31a2789a8a72cc';

@ProviderFor(postRepository)
const postRepositoryProvider = PostRepositoryProvider._();

final class PostRepositoryProvider
    extends $FunctionalProvider<PostRepository, PostRepository, PostRepository>
    with $Provider<PostRepository> {
  const PostRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'postRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$postRepositoryHash();

  @$internal
  @override
  $ProviderElement<PostRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  PostRepository create(Ref ref) {
    return postRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PostRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PostRepository>(value),
    );
  }
}

String _$postRepositoryHash() => r'64209d8be544d729b661befbb49ad76b2e432958';

@ProviderFor(postUsecase)
const postUsecaseProvider = PostUsecaseProvider._();

final class PostUsecaseProvider
    extends $FunctionalProvider<PostUsecase, PostUsecase, PostUsecase>
    with $Provider<PostUsecase> {
  const PostUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'postUsecaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$postUsecaseHash();

  @$internal
  @override
  $ProviderElement<PostUsecase> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  PostUsecase create(Ref ref) {
    return postUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PostUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PostUsecase>(value),
    );
  }
}

String _$postUsecaseHash() => r'9b0fb7a8083f9d733cfb310cc2b1f2cd438884b3';
