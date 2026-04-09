// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'memo_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(MemoViewModel)
const memoViewModelProvider = MemoViewModelProvider._();

final class MemoViewModelProvider
    extends $AsyncNotifierProvider<MemoViewModel, String> {
  const MemoViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'memoViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$memoViewModelHash();

  @$internal
  @override
  MemoViewModel create() => MemoViewModel();
}

String _$memoViewModelHash() => r'9fb14d676e6ed07d7742a20aeaef3a413fbf663d';

abstract class _$MemoViewModel extends $AsyncNotifier<String> {
  FutureOr<String> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<String>, String>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<String>, String>,
              AsyncValue<String>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
