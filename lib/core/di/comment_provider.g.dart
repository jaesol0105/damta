// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_provider.dart';

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

@ProviderFor(commentDataSource)
const commentDataSourceProvider = CommentDataSourceProvider._();

final class CommentDataSourceProvider
    extends
        $FunctionalProvider<
          CommentDataSource,
          CommentDataSource,
          CommentDataSource
        >
    with $Provider<CommentDataSource> {
  const CommentDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'commentDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$commentDataSourceHash();

  @$internal
  @override
  $ProviderElement<CommentDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  CommentDataSource create(Ref ref) {
    return commentDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CommentDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CommentDataSource>(value),
    );
  }
}

String _$commentDataSourceHash() => r'bc4aa84bd4220f1a2af80a37314147b030ce1767';

@ProviderFor(commentRepository)
const commentRepositoryProvider = CommentRepositoryProvider._();

final class CommentRepositoryProvider
    extends
        $FunctionalProvider<
          CommentRepository,
          CommentRepository,
          CommentRepository
        >
    with $Provider<CommentRepository> {
  const CommentRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'commentRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$commentRepositoryHash();

  @$internal
  @override
  $ProviderElement<CommentRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  CommentRepository create(Ref ref) {
    return commentRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CommentRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CommentRepository>(value),
    );
  }
}

String _$commentRepositoryHash() => r'efb95a41385877555ad31b5f12622dfa6ff4cf20';

@ProviderFor(commentUsecase)
const commentUsecaseProvider = CommentUsecaseProvider._();

final class CommentUsecaseProvider
    extends $FunctionalProvider<CommentUsecase, CommentUsecase, CommentUsecase>
    with $Provider<CommentUsecase> {
  const CommentUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'commentUsecaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$commentUsecaseHash();

  @$internal
  @override
  $ProviderElement<CommentUsecase> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  CommentUsecase create(Ref ref) {
    return commentUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CommentUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CommentUsecase>(value),
    );
  }
}

String _$commentUsecaseHash() => r'aca2489def285413f16928b373f956efd0e9598e';
