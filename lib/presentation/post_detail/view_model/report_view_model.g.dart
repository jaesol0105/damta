// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ReportViewModel)
const reportViewModelProvider = ReportViewModelProvider._();

final class ReportViewModelProvider
    extends $NotifierProvider<ReportViewModel, AsyncValue<void>> {
  const ReportViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'reportViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$reportViewModelHash();

  @$internal
  @override
  ReportViewModel create() => ReportViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<void> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<void>>(value),
    );
  }
}

String _$reportViewModelHash() => r'c0f139e1306e7cb39d8e73fbfd7cc42a49e2f26d';

abstract class _$ReportViewModel extends $Notifier<AsyncValue<void>> {
  AsyncValue<void> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<void>, AsyncValue<void>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<void>, AsyncValue<void>>,
              AsyncValue<void>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
