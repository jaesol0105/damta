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

String _$dioHash() => r'088d5c03610503c2407a8d7429b0e9f3ee76406f';

@ProviderFor(firestore)
const firestoreProvider = FirestoreProvider._();

final class FirestoreProvider
    extends
        $FunctionalProvider<
          FirebaseFirestore,
          FirebaseFirestore,
          FirebaseFirestore
        >
    with $Provider<FirebaseFirestore> {
  const FirestoreProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'firestoreProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$firestoreHash();

  @$internal
  @override
  $ProviderElement<FirebaseFirestore> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  FirebaseFirestore create(Ref ref) {
    return firestore(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FirebaseFirestore value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FirebaseFirestore>(value),
    );
  }
}

String _$firestoreHash() => r'597b1a9eb96f2fae51f5b578f4b5debe4f6d30c6';

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

@ProviderFor(weatherDataSource)
const weatherDataSourceProvider = WeatherDataSourceProvider._();

final class WeatherDataSourceProvider
    extends
        $FunctionalProvider<
          WeatherDataSource,
          WeatherDataSource,
          WeatherDataSource
        >
    with $Provider<WeatherDataSource> {
  const WeatherDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'weatherDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$weatherDataSourceHash();

  @$internal
  @override
  $ProviderElement<WeatherDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  WeatherDataSource create(Ref ref) {
    return weatherDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(WeatherDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<WeatherDataSource>(value),
    );
  }
}

String _$weatherDataSourceHash() => r'1faeab990a34f07af8dad18b7ff75706253a2523';

@ProviderFor(postDataSource)
const postDataSourceProvider = PostDataSourceProvider._();

final class PostDataSourceProvider
    extends $FunctionalProvider<PostDataSource, PostDataSource, PostDataSource>
    with $Provider<PostDataSource> {
  const PostDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'postDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$postDataSourceHash();

  @$internal
  @override
  $ProviderElement<PostDataSource> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  PostDataSource create(Ref ref) {
    return postDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PostDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PostDataSource>(value),
    );
  }
}

String _$postDataSourceHash() => r'460504de673267020f8b1b70fb31a2789a8a72cc';

@ProviderFor(commentDataSource)
const commentDataSourceProvider = CommentDataSourceProvider._();

final class CommentDataSourceProvider
    extends
        $FunctionalProvider<
          CommentDataSource,
          CommentDataSource,
          CommentDataSource
        >
    with $Provider<CommentDataSource> {
  const CommentDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'commentDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$commentDataSourceHash();

  @$internal
  @override
  $ProviderElement<CommentDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  CommentDataSource create(Ref ref) {
    return commentDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CommentDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CommentDataSource>(value),
    );
  }
}

String _$commentDataSourceHash() => r'bc4aa84bd4220f1a2af80a37314147b030ce1767';

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

@ProviderFor(weatherRepository)
const weatherRepositoryProvider = WeatherRepositoryProvider._();

final class WeatherRepositoryProvider
    extends
        $FunctionalProvider<
          WeatherRepository,
          WeatherRepository,
          WeatherRepository
        >
    with $Provider<WeatherRepository> {
  const WeatherRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'weatherRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$weatherRepositoryHash();

  @$internal
  @override
  $ProviderElement<WeatherRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  WeatherRepository create(Ref ref) {
    return weatherRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(WeatherRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<WeatherRepository>(value),
    );
  }
}

String _$weatherRepositoryHash() => r'bc1fa2b02200ca7bbbc117c1a6450e60c260f8b4';

@ProviderFor(postRepository)
const postRepositoryProvider = PostRepositoryProvider._();

final class PostRepositoryProvider
    extends $FunctionalProvider<PostRepository, PostRepository, PostRepository>
    with $Provider<PostRepository> {
  const PostRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'postRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$postRepositoryHash();

  @$internal
  @override
  $ProviderElement<PostRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  PostRepository create(Ref ref) {
    return postRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PostRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PostRepository>(value),
    );
  }
}

String _$postRepositoryHash() => r'64209d8be544d729b661befbb49ad76b2e432958';

@ProviderFor(commentRepository)
const commentRepositoryProvider = CommentRepositoryProvider._();

final class CommentRepositoryProvider
    extends
        $FunctionalProvider<
          CommentRepository,
          CommentRepository,
          CommentRepository
        >
    with $Provider<CommentRepository> {
  const CommentRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'commentRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$commentRepositoryHash();

  @$internal
  @override
  $ProviderElement<CommentRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  CommentRepository create(Ref ref) {
    return commentRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CommentRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CommentRepository>(value),
    );
  }
}

String _$commentRepositoryHash() => r'efb95a41385877555ad31b5f12622dfa6ff4cf20';

@ProviderFor(postUsecase)
const postUsecaseProvider = PostUsecaseProvider._();

final class PostUsecaseProvider
    extends $FunctionalProvider<PostUsecase, PostUsecase, PostUsecase>
    with $Provider<PostUsecase> {
  const PostUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'postUsecaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$postUsecaseHash();

  @$internal
  @override
  $ProviderElement<PostUsecase> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  PostUsecase create(Ref ref) {
    return postUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PostUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PostUsecase>(value),
    );
  }
}

String _$postUsecaseHash() => r'9b0fb7a8083f9d733cfb310cc2b1f2cd438884b3';

@ProviderFor(commentUsecase)
const commentUsecaseProvider = CommentUsecaseProvider._();

final class CommentUsecaseProvider
    extends $FunctionalProvider<CommentUsecase, CommentUsecase, CommentUsecase>
    with $Provider<CommentUsecase> {
  const CommentUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'commentUsecaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$commentUsecaseHash();

  @$internal
  @override
  $ProviderElement<CommentUsecase> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  CommentUsecase create(Ref ref) {
    return commentUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CommentUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CommentUsecase>(value),
    );
  }
}

String _$commentUsecaseHash() => r'aca2489def285413f16928b373f956efd0e9598e';
