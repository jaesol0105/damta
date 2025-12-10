// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PostViewModel)
const postViewModelProvider = PostViewModelProvider._();

final class PostViewModelProvider
    extends $NotifierProvider<PostViewModel, List<PostEntity>> {
  const PostViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'postViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$postViewModelHash();

  @$internal
  @override
  PostViewModel create() => PostViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<PostEntity> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<PostEntity>>(value),
    );
  }
}

String _$postViewModelHash() => r'49c12ff7ba18cbc06ccce72d795a66f6a24d3b1a';

abstract class _$PostViewModel extends $Notifier<List<PostEntity>> {
  List<PostEntity> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<List<PostEntity>, List<PostEntity>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<PostEntity>, List<PostEntity>>,
              List<PostEntity>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
