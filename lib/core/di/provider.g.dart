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

@ProviderFor(firebaseStorage)
const firebaseStorageProvider = FirebaseStorageProvider._();

final class FirebaseStorageProvider
    extends
        $FunctionalProvider<FirebaseStorage, FirebaseStorage, FirebaseStorage>
    with $Provider<FirebaseStorage> {
  const FirebaseStorageProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'firebaseStorageProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$firebaseStorageHash();

  @$internal
  @override
  $ProviderElement<FirebaseStorage> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  FirebaseStorage create(Ref ref) {
    return firebaseStorage(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FirebaseStorage value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FirebaseStorage>(value),
    );
  }
}

String _$firebaseStorageHash() => r'47903c48019f7dfa1ba82fa0a905885442d69f6b';

@ProviderFor(auth)
const authProvider = AuthProvider._();

final class AuthProvider
    extends $FunctionalProvider<FirebaseAuth, FirebaseAuth, FirebaseAuth>
    with $Provider<FirebaseAuth> {
  const AuthProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authHash();

  @$internal
  @override
  $ProviderElement<FirebaseAuth> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  FirebaseAuth create(Ref ref) {
    return auth(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FirebaseAuth value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FirebaseAuth>(value),
    );
  }
}

String _$authHash() => r'32f5302faf182139a28024fdbc77728e9b3c1598';

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

@ProviderFor(storageDataSource)
const storageDataSourceProvider = StorageDataSourceProvider._();

final class StorageDataSourceProvider
    extends
        $FunctionalProvider<
          StorageDataSource,
          StorageDataSource,
          StorageDataSource
        >
    with $Provider<StorageDataSource> {
  const StorageDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'storageDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$storageDataSourceHash();

  @$internal
  @override
  $ProviderElement<StorageDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  StorageDataSource create(Ref ref) {
    return storageDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(StorageDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<StorageDataSource>(value),
    );
  }
}

String _$storageDataSourceHash() => r'eae3b62fbaa0e855e5ef662ba9eea5bcb33a5f82';

@ProviderFor(notificationDataSource)
const notificationDataSourceProvider = NotificationDataSourceProvider._();

final class NotificationDataSourceProvider
    extends
        $FunctionalProvider<
          NotificationDataSource,
          NotificationDataSource,
          NotificationDataSource
        >
    with $Provider<NotificationDataSource> {
  const NotificationDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'notificationDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$notificationDataSourceHash();

  @$internal
  @override
  $ProviderElement<NotificationDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  NotificationDataSource create(Ref ref) {
    return notificationDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(NotificationDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<NotificationDataSource>(value),
    );
  }
}

String _$notificationDataSourceHash() =>
    r'd91cd5f68f1c0e52a09defdc1946e7a0c2426efc';

@ProviderFor(usersDataSource)
const usersDataSourceProvider = UsersDataSourceProvider._();

final class UsersDataSourceProvider
    extends
        $FunctionalProvider<UsersDataSource, UsersDataSource, UsersDataSource>
    with $Provider<UsersDataSource> {
  const UsersDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'usersDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$usersDataSourceHash();

  @$internal
  @override
  $ProviderElement<UsersDataSource> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  UsersDataSource create(Ref ref) {
    return usersDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UsersDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UsersDataSource>(value),
    );
  }
}

String _$usersDataSourceHash() => r'd6fe03f0610965045668cb872cec5a42dd840c45';

@ProviderFor(authDataSource)
const authDataSourceProvider = AuthDataSourceProvider._();

final class AuthDataSourceProvider
    extends $FunctionalProvider<AuthDataSource, AuthDataSource, AuthDataSource>
    with $Provider<AuthDataSource> {
  const AuthDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authDataSourceHash();

  @$internal
  @override
  $ProviderElement<AuthDataSource> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AuthDataSource create(Ref ref) {
    return authDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AuthDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AuthDataSource>(value),
    );
  }
}

String _$authDataSourceHash() => r'b2920f2ea89acfb779ab041b747efb1af814cca0';

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

@ProviderFor(storageRepository)
const storageRepositoryProvider = StorageRepositoryProvider._();

final class StorageRepositoryProvider
    extends
        $FunctionalProvider<
          StorageRepository,
          StorageRepository,
          StorageRepository
        >
    with $Provider<StorageRepository> {
  const StorageRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'storageRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$storageRepositoryHash();

  @$internal
  @override
  $ProviderElement<StorageRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  StorageRepository create(Ref ref) {
    return storageRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(StorageRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<StorageRepository>(value),
    );
  }
}

String _$storageRepositoryHash() => r'056e6bb6fc39466ac856297af2331f3f7029d334';

@ProviderFor(notificationRepository)
const notificationRepositoryProvider = NotificationRepositoryProvider._();

final class NotificationRepositoryProvider
    extends
        $FunctionalProvider<
          NotificationRepository,
          NotificationRepository,
          NotificationRepository
        >
    with $Provider<NotificationRepository> {
  const NotificationRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'notificationRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$notificationRepositoryHash();

  @$internal
  @override
  $ProviderElement<NotificationRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  NotificationRepository create(Ref ref) {
    return notificationRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(NotificationRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<NotificationRepository>(value),
    );
  }
}

String _$notificationRepositoryHash() =>
    r'1a3278c215fde1e182197c1aa8857d9bc46b91b2';

@ProviderFor(usersRepository)
const usersRepositoryProvider = UsersRepositoryProvider._();

final class UsersRepositoryProvider
    extends
        $FunctionalProvider<UsersRepository, UsersRepository, UsersRepository>
    with $Provider<UsersRepository> {
  const UsersRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'usersRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$usersRepositoryHash();

  @$internal
  @override
  $ProviderElement<UsersRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  UsersRepository create(Ref ref) {
    return usersRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UsersRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UsersRepository>(value),
    );
  }
}

String _$usersRepositoryHash() => r'474ebdc65e29645a87d8932324df9362a9f72dca';

@ProviderFor(authRepository)
const authRepositoryProvider = AuthRepositoryProvider._();

final class AuthRepositoryProvider
    extends $FunctionalProvider<AuthRepository, AuthRepository, AuthRepository>
    with $Provider<AuthRepository> {
  const AuthRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authRepositoryHash();

  @$internal
  @override
  $ProviderElement<AuthRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AuthRepository create(Ref ref) {
    return authRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AuthRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AuthRepository>(value),
    );
  }
}

String _$authRepositoryHash() => r'ec654f5fa69e7facde94d755bb72d46efdc77a1b';

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
