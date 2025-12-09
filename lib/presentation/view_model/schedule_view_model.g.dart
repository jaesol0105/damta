// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ScheduleViewModel)
const scheduleViewModelProvider = ScheduleViewModelFamily._();

final class ScheduleViewModelProvider
    extends $AsyncNotifierProvider<ScheduleViewModel, ScheduleState> {
  const ScheduleViewModelProvider._({
    required ScheduleViewModelFamily super.from,
    required ({String officeCode, String schoolCode}) super.argument,
  }) : super(
         retry: null,
         name: r'scheduleViewModelProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$scheduleViewModelHash();

  @override
  String toString() {
    return r'scheduleViewModelProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  ScheduleViewModel create() => ScheduleViewModel();

  @override
  bool operator ==(Object other) {
    return other is ScheduleViewModelProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$scheduleViewModelHash() => r'e1a7e0f2acefbd1f135e72c2103ceae9d44f3452';

final class ScheduleViewModelFamily extends $Family
    with
        $ClassFamilyOverride<
          ScheduleViewModel,
          AsyncValue<ScheduleState>,
          ScheduleState,
          FutureOr<ScheduleState>,
          ({String officeCode, String schoolCode})
        > {
  const ScheduleViewModelFamily._()
    : super(
        retry: null,
        name: r'scheduleViewModelProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ScheduleViewModelProvider call({
    required String officeCode,
    required String schoolCode,
  }) => ScheduleViewModelProvider._(
    argument: (officeCode: officeCode, schoolCode: schoolCode),
    from: this,
  );

  @override
  String toString() => r'scheduleViewModelProvider';
}

abstract class _$ScheduleViewModel extends $AsyncNotifier<ScheduleState> {
  late final _$args = ref.$arg as ({String officeCode, String schoolCode});
  String get officeCode => _$args.officeCode;
  String get schoolCode => _$args.schoolCode;

  FutureOr<ScheduleState> build({
    required String officeCode,
    required String schoolCode,
  });
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(
      officeCode: _$args.officeCode,
      schoolCode: _$args.schoolCode,
    );
    final ref = this.ref as $Ref<AsyncValue<ScheduleState>, ScheduleState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<ScheduleState>, ScheduleState>,
              AsyncValue<ScheduleState>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
