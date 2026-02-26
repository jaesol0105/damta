// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(HomeViewModel)
const homeViewModelProvider = HomeViewModelProvider._();

final class HomeViewModelProvider
    extends $NotifierProvider<HomeViewModel, List<ModuleItem>> {
  const HomeViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'homeViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$homeViewModelHash();

  @$internal
  @override
  HomeViewModel create() => HomeViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<ModuleItem> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<ModuleItem>>(value),
    );
  }
}

String _$homeViewModelHash() => r'97aa9a543939a898cc3e45afbaf937ad3950b1fd';

abstract class _$HomeViewModel extends $Notifier<List<ModuleItem>> {
  List<ModuleItem> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<List<ModuleItem>, List<ModuleItem>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<ModuleItem>, List<ModuleItem>>,
              List<ModuleItem>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
