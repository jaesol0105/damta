// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(user)
const userProvider = UserProvider._();

final class UserProvider
    extends
        $FunctionalProvider<
          AsyncValue<UsersEntity>,
          UsersEntity,
          FutureOr<UsersEntity>
        >
    with $FutureModifier<UsersEntity>, $FutureProvider<UsersEntity> {
  const UserProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'userProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$userHash();

  @$internal
  @override
  $FutureProviderElement<UsersEntity> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<UsersEntity> create(Ref ref) {
    return user(ref);
  }
}

String _$userHash() => r'f464ddd6f6a448def443eed9d0bf7b6275b299e2';

@ProviderFor(authState)
const authStateProvider = AuthStateProvider._();

final class AuthStateProvider
    extends
        $FunctionalProvider<
          AsyncValue<UsersEntity?>,
          UsersEntity?,
          Stream<UsersEntity?>
        >
    with $FutureModifier<UsersEntity?>, $StreamProvider<UsersEntity?> {
  const AuthStateProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authStateProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authStateHash();

  @$internal
  @override
  $StreamProviderElement<UsersEntity?> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<UsersEntity?> create(Ref ref) {
    return authState(ref);
  }
}

String _$authStateHash() => r'2afb8f66c2354ac8d34795dfba1def6572931ea2';
