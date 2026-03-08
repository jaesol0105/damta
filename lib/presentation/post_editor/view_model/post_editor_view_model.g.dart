// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_editor_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PostEditorViewModel)
const postEditorViewModelProvider = PostEditorViewModelFamily._();

final class PostEditorViewModelProvider
    extends $NotifierProvider<PostEditorViewModel, PostEditorState> {
  const PostEditorViewModelProvider._({
    required PostEditorViewModelFamily super.from,
    required PostEntity super.argument,
  }) : super(
         retry: null,
         name: r'postEditorViewModelProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$postEditorViewModelHash();

  @override
  String toString() {
    return r'postEditorViewModelProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  PostEditorViewModel create() => PostEditorViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PostEditorState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PostEditorState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is PostEditorViewModelProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$postEditorViewModelHash() =>
    r'6fb5eeff44856602e4257a68596d007f16fa1e9f';

final class PostEditorViewModelFamily extends $Family
    with
        $ClassFamilyOverride<
          PostEditorViewModel,
          PostEditorState,
          PostEditorState,
          PostEditorState,
          PostEntity
        > {
  const PostEditorViewModelFamily._()
    : super(
        retry: null,
        name: r'postEditorViewModelProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  PostEditorViewModelProvider call(PostEntity post) =>
      PostEditorViewModelProvider._(argument: post, from: this);

  @override
  String toString() => r'postEditorViewModelProvider';
}

abstract class _$PostEditorViewModel extends $Notifier<PostEditorState> {
  late final _$args = ref.$arg as PostEntity;
  PostEntity get post => _$args;

  PostEditorState build(PostEntity post);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<PostEditorState, PostEditorState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<PostEditorState, PostEditorState>,
              PostEditorState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
