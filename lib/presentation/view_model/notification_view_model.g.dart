// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(NotificationViewModel)
const notificationViewModelProvider = NotificationViewModelFamily._();

final class NotificationViewModelProvider
    extends
        $AsyncNotifierProvider<
          NotificationViewModel,
          List<NotificationEntity>
        > {
  const NotificationViewModelProvider._({
    required NotificationViewModelFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'notificationViewModelProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$notificationViewModelHash();

  @override
  String toString() {
    return r'notificationViewModelProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  NotificationViewModel create() => NotificationViewModel();

  @override
  bool operator ==(Object other) {
    return other is NotificationViewModelProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$notificationViewModelHash() =>
    r'1f3ac7c946b5b5111a7e6bc756b40c49c5bde976';

final class NotificationViewModelFamily extends $Family
    with
        $ClassFamilyOverride<
          NotificationViewModel,
          AsyncValue<List<NotificationEntity>>,
          List<NotificationEntity>,
          FutureOr<List<NotificationEntity>>,
          String
        > {
  const NotificationViewModelFamily._()
    : super(
        retry: null,
        name: r'notificationViewModelProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  NotificationViewModelProvider call({required String uId}) =>
      NotificationViewModelProvider._(argument: uId, from: this);

  @override
  String toString() => r'notificationViewModelProvider';
}

abstract class _$NotificationViewModel
    extends $AsyncNotifier<List<NotificationEntity>> {
  late final _$args = ref.$arg as String;
  String get uId => _$args;

  FutureOr<List<NotificationEntity>> build({required String uId});
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(uId: _$args);
    final ref =
        this.ref
            as $Ref<
              AsyncValue<List<NotificationEntity>>,
              List<NotificationEntity>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<List<NotificationEntity>>,
                List<NotificationEntity>
              >,
              AsyncValue<List<NotificationEntity>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
