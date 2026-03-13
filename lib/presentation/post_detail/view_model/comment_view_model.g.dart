// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CommentViewModel)
const commentViewModelProvider = CommentViewModelProvider._();

final class CommentViewModelProvider
    extends $NotifierProvider<CommentViewModel, List<CommentEntity>> {
  const CommentViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'commentViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$commentViewModelHash();

  @$internal
  @override
  CommentViewModel create() => CommentViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<CommentEntity> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<CommentEntity>>(value),
    );
  }
}

String _$commentViewModelHash() => r'bbe2c6d73d63454b120e89210f3438652e914a5d';

abstract class _$CommentViewModel extends $Notifier<List<CommentEntity>> {
  List<CommentEntity> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<List<CommentEntity>, List<CommentEntity>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<CommentEntity>, List<CommentEntity>>,
              List<CommentEntity>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
