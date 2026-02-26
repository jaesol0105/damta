// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 현재 사용자의 학사일정 Provider.

@ProviderFor(scheduleForCurrentUser)
const scheduleForCurrentUserProvider = ScheduleForCurrentUserProvider._();

/// 현재 사용자의 학사일정 Provider.

final class ScheduleForCurrentUserProvider
    extends
        $FunctionalProvider<
          AsyncValue<ScheduleState>,
          ScheduleState,
          FutureOr<ScheduleState>
        >
    with $FutureModifier<ScheduleState>, $FutureProvider<ScheduleState> {
  /// 현재 사용자의 학사일정 Provider.
  const ScheduleForCurrentUserProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'scheduleForCurrentUserProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$scheduleForCurrentUserHash();

  @$internal
  @override
  $FutureProviderElement<ScheduleState> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<ScheduleState> create(Ref ref) {
    return scheduleForCurrentUser(ref);
  }
}

String _$scheduleForCurrentUserHash() =>
    r'ca882ae6853e499ad05977fc51cfaf4c8f5debb7';

/// 현재 사용자의 급식 Provider.

@ProviderFor(mealForCurrentUser)
const mealForCurrentUserProvider = MealForCurrentUserProvider._();

/// 현재 사용자의 급식 Provider.

final class MealForCurrentUserProvider
    extends
        $FunctionalProvider<
          AsyncValue<MealState>,
          MealState,
          FutureOr<MealState>
        >
    with $FutureModifier<MealState>, $FutureProvider<MealState> {
  /// 현재 사용자의 급식 Provider.
  const MealForCurrentUserProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'mealForCurrentUserProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$mealForCurrentUserHash();

  @$internal
  @override
  $FutureProviderElement<MealState> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<MealState> create(Ref ref) {
    return mealForCurrentUser(ref);
  }
}

String _$mealForCurrentUserHash() =>
    r'b738d98a865a749f987a7e660a32336e724b98ca';

/// 현재 사용자의 시간표 Provider.

@ProviderFor(timetableForCurrentUser)
const timetableForCurrentUserProvider = TimetableForCurrentUserProvider._();

/// 현재 사용자의 시간표 Provider.

final class TimetableForCurrentUserProvider
    extends
        $FunctionalProvider<
          AsyncValue<TimeTableState>,
          TimeTableState,
          FutureOr<TimeTableState>
        >
    with $FutureModifier<TimeTableState>, $FutureProvider<TimeTableState> {
  /// 현재 사용자의 시간표 Provider.
  const TimetableForCurrentUserProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'timetableForCurrentUserProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$timetableForCurrentUserHash();

  @$internal
  @override
  $FutureProviderElement<TimeTableState> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<TimeTableState> create(Ref ref) {
    return timetableForCurrentUser(ref);
  }
}

String _$timetableForCurrentUserHash() =>
    r'8f5971c704644f9ce76cb037ea2b916591fc61e1';
