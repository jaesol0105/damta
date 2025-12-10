// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time_table_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(TimeTableViewModel)
const timeTableViewModelProvider = TimeTableViewModelFamily._();

final class TimeTableViewModelProvider
    extends $AsyncNotifierProvider<TimeTableViewModel, TimeTableState> {
  const TimeTableViewModelProvider._({
    required TimeTableViewModelFamily super.from,
    required ({String officeCode, String schoolCode}) super.argument,
  }) : super(
         retry: null,
         name: r'timeTableViewModelProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$timeTableViewModelHash();

  @override
  String toString() {
    return r'timeTableViewModelProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  TimeTableViewModel create() => TimeTableViewModel();

  @override
  bool operator ==(Object other) {
    return other is TimeTableViewModelProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$timeTableViewModelHash() =>
    r'c72f91d016e3fd84915616a2733831bfd4d4fad1';

final class TimeTableViewModelFamily extends $Family
    with
        $ClassFamilyOverride<
          TimeTableViewModel,
          AsyncValue<TimeTableState>,
          TimeTableState,
          FutureOr<TimeTableState>,
          ({String officeCode, String schoolCode})
        > {
  const TimeTableViewModelFamily._()
    : super(
        retry: null,
        name: r'timeTableViewModelProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  TimeTableViewModelProvider call({
    required String officeCode,
    required String schoolCode,
  }) => TimeTableViewModelProvider._(
    argument: (officeCode: officeCode, schoolCode: schoolCode),
    from: this,
  );

  @override
  String toString() => r'timeTableViewModelProvider';
}

abstract class _$TimeTableViewModel extends $AsyncNotifier<TimeTableState> {
  late final _$args = ref.$arg as ({String officeCode, String schoolCode});
  String get officeCode => _$args.officeCode;
  String get schoolCode => _$args.schoolCode;

  FutureOr<TimeTableState> build({
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
    final ref = this.ref as $Ref<AsyncValue<TimeTableState>, TimeTableState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<TimeTableState>, TimeTableState>,
              AsyncValue<TimeTableState>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
