// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(dio)
const dioProvider = DioProvider._();

final class DioProvider extends $FunctionalProvider<Dio, Dio, Dio>
    with $Provider<Dio> {
  const DioProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dioProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dioHash();

  @$internal
  @override
  $ProviderElement<Dio> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Dio create(Ref ref) {
    return dio(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Dio value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Dio>(value),
    );
  }
}

String _$dioHash() => r'a03da399b44b3740dc4fcfc6716203041d66ff01';

@ProviderFor(database)
const databaseProvider = DatabaseProvider._();

final class DatabaseProvider
    extends
        $FunctionalProvider<AsyncValue<Database>, Database, FutureOr<Database>>
    with $FutureModifier<Database>, $FutureProvider<Database> {
  const DatabaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'databaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$databaseHash();

  @$internal
  @override
  $FutureProviderElement<Database> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Database> create(Ref ref) {
    return database(ref);
  }
}

String _$databaseHash() => r'8ffd0b9ad24694816b2791de7c00c9fd50ffcc38';

@ProviderFor(mealRemoteDataSource)
const mealRemoteDataSourceProvider = MealRemoteDataSourceProvider._();

final class MealRemoteDataSourceProvider
    extends
        $FunctionalProvider<
          MealRemoteDataSource,
          MealRemoteDataSource,
          MealRemoteDataSource
        >
    with $Provider<MealRemoteDataSource> {
  const MealRemoteDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'mealRemoteDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$mealRemoteDataSourceHash();

  @$internal
  @override
  $ProviderElement<MealRemoteDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  MealRemoteDataSource create(Ref ref) {
    return mealRemoteDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MealRemoteDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MealRemoteDataSource>(value),
    );
  }
}

String _$mealRemoteDataSourceHash() =>
    r'85a08b7586318a6f70f3afac1860e6c590d6cbd1';

@ProviderFor(scheduleRemoteDataSource)
const scheduleRemoteDataSourceProvider = ScheduleRemoteDataSourceProvider._();

final class ScheduleRemoteDataSourceProvider
    extends
        $FunctionalProvider<
          ScheduleRemoteDataSource,
          ScheduleRemoteDataSource,
          ScheduleRemoteDataSource
        >
    with $Provider<ScheduleRemoteDataSource> {
  const ScheduleRemoteDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'scheduleRemoteDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$scheduleRemoteDataSourceHash();

  @$internal
  @override
  $ProviderElement<ScheduleRemoteDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ScheduleRemoteDataSource create(Ref ref) {
    return scheduleRemoteDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ScheduleRemoteDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ScheduleRemoteDataSource>(value),
    );
  }
}

String _$scheduleRemoteDataSourceHash() =>
    r'92ee8902818ef0ccee9246021577d5c184934e5c';

@ProviderFor(timeTableRemoteDataSource)
const timeTableRemoteDataSourceProvider = TimeTableRemoteDataSourceProvider._();

final class TimeTableRemoteDataSourceProvider
    extends
        $FunctionalProvider<
          TimeTableRemoteDataSource,
          TimeTableRemoteDataSource,
          TimeTableRemoteDataSource
        >
    with $Provider<TimeTableRemoteDataSource> {
  const TimeTableRemoteDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'timeTableRemoteDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$timeTableRemoteDataSourceHash();

  @$internal
  @override
  $ProviderElement<TimeTableRemoteDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  TimeTableRemoteDataSource create(Ref ref) {
    return timeTableRemoteDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TimeTableRemoteDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TimeTableRemoteDataSource>(value),
    );
  }
}

String _$timeTableRemoteDataSourceHash() =>
    r'f170c05b60355d70a7a171cb1c24a25fea6ec85b';

@ProviderFor(mealLocalDataSource)
const mealLocalDataSourceProvider = MealLocalDataSourceProvider._();

final class MealLocalDataSourceProvider
    extends
        $FunctionalProvider<
          AsyncValue<MealLocalDataSource>,
          MealLocalDataSource,
          FutureOr<MealLocalDataSource>
        >
    with
        $FutureModifier<MealLocalDataSource>,
        $FutureProvider<MealLocalDataSource> {
  const MealLocalDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'mealLocalDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$mealLocalDataSourceHash();

  @$internal
  @override
  $FutureProviderElement<MealLocalDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<MealLocalDataSource> create(Ref ref) {
    return mealLocalDataSource(ref);
  }
}

String _$mealLocalDataSourceHash() =>
    r'debba47bf97a253b493bb41285b9100f09cb4dd5';

@ProviderFor(scheduleLocalDataSource)
const scheduleLocalDataSourceProvider = ScheduleLocalDataSourceProvider._();

final class ScheduleLocalDataSourceProvider
    extends
        $FunctionalProvider<
          AsyncValue<ScheduleLocalDataSource>,
          ScheduleLocalDataSource,
          FutureOr<ScheduleLocalDataSource>
        >
    with
        $FutureModifier<ScheduleLocalDataSource>,
        $FutureProvider<ScheduleLocalDataSource> {
  const ScheduleLocalDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'scheduleLocalDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$scheduleLocalDataSourceHash();

  @$internal
  @override
  $FutureProviderElement<ScheduleLocalDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<ScheduleLocalDataSource> create(Ref ref) {
    return scheduleLocalDataSource(ref);
  }
}

String _$scheduleLocalDataSourceHash() =>
    r'039ddf9b059ed131a9e3595beca08e6a74968a07';

@ProviderFor(timeTableLocalDataSource)
const timeTableLocalDataSourceProvider = TimeTableLocalDataSourceProvider._();

final class TimeTableLocalDataSourceProvider
    extends
        $FunctionalProvider<
          AsyncValue<TimeTableLocalDataSource>,
          TimeTableLocalDataSource,
          FutureOr<TimeTableLocalDataSource>
        >
    with
        $FutureModifier<TimeTableLocalDataSource>,
        $FutureProvider<TimeTableLocalDataSource> {
  const TimeTableLocalDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'timeTableLocalDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$timeTableLocalDataSourceHash();

  @$internal
  @override
  $FutureProviderElement<TimeTableLocalDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<TimeTableLocalDataSource> create(Ref ref) {
    return timeTableLocalDataSource(ref);
  }
}

String _$timeTableLocalDataSourceHash() =>
    r'295645c167b7ded8e4e90d838534c7020f526613';

@ProviderFor(mealRepository)
const mealRepositoryProvider = MealRepositoryProvider._();

final class MealRepositoryProvider
    extends
        $FunctionalProvider<
          AsyncValue<MealRepository>,
          MealRepository,
          FutureOr<MealRepository>
        >
    with $FutureModifier<MealRepository>, $FutureProvider<MealRepository> {
  const MealRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'mealRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$mealRepositoryHash();

  @$internal
  @override
  $FutureProviderElement<MealRepository> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<MealRepository> create(Ref ref) {
    return mealRepository(ref);
  }
}

String _$mealRepositoryHash() => r'4c2c949d8846bb82c23aea83ba9423183cccb90d';

@ProviderFor(scheduleRepository)
const scheduleRepositoryProvider = ScheduleRepositoryProvider._();

final class ScheduleRepositoryProvider
    extends
        $FunctionalProvider<
          AsyncValue<ScheduleRepository>,
          ScheduleRepository,
          FutureOr<ScheduleRepository>
        >
    with
        $FutureModifier<ScheduleRepository>,
        $FutureProvider<ScheduleRepository> {
  const ScheduleRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'scheduleRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$scheduleRepositoryHash();

  @$internal
  @override
  $FutureProviderElement<ScheduleRepository> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<ScheduleRepository> create(Ref ref) {
    return scheduleRepository(ref);
  }
}

String _$scheduleRepositoryHash() =>
    r'd49fc4dc2576ff7137c1661fd9358682a64af8e5';

@ProviderFor(timeTableRepository)
const timeTableRepositoryProvider = TimeTableRepositoryProvider._();

final class TimeTableRepositoryProvider
    extends
        $FunctionalProvider<
          AsyncValue<TimeTableRepository>,
          TimeTableRepository,
          FutureOr<TimeTableRepository>
        >
    with
        $FutureModifier<TimeTableRepository>,
        $FutureProvider<TimeTableRepository> {
  const TimeTableRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'timeTableRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$timeTableRepositoryHash();

  @$internal
  @override
  $FutureProviderElement<TimeTableRepository> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<TimeTableRepository> create(Ref ref) {
    return timeTableRepository(ref);
  }
}

String _$timeTableRepositoryHash() =>
    r'77fb830e1617b93aa5310126256990d4416d1e7f';
