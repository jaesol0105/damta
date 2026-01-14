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

String _$userHash() => r'67c89901b509b150a0aa8fe095da23c0911790d0';
