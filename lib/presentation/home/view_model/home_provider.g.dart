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
    r'e2b4ef03e693f4477c4ce037529c6ac8e1c595ba';

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
    r'1b273e635e1d560a405de229174381368d59a205';

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
    r'e802b9b93a859c0d6d67acdcf361226575b96a29';
