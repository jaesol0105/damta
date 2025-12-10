// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(MealViewModel)
const mealViewModelProvider = MealViewModelFamily._();

final class MealViewModelProvider
    extends $AsyncNotifierProvider<MealViewModel, MealState> {
  const MealViewModelProvider._({
    required MealViewModelFamily super.from,
    required ({String officeCode, String schoolCode}) super.argument,
  }) : super(
         retry: null,
         name: r'mealViewModelProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$mealViewModelHash();

  @override
  String toString() {
    return r'mealViewModelProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  MealViewModel create() => MealViewModel();

  @override
  bool operator ==(Object other) {
    return other is MealViewModelProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$mealViewModelHash() => r'f989e0890c7edc1e73eb8b9a2772bdc6d346dc28';

final class MealViewModelFamily extends $Family
    with
        $ClassFamilyOverride<
          MealViewModel,
          AsyncValue<MealState>,
          MealState,
          FutureOr<MealState>,
          ({String officeCode, String schoolCode})
        > {
  const MealViewModelFamily._()
    : super(
        retry: null,
        name: r'mealViewModelProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  MealViewModelProvider call({
    required String officeCode,
    required String schoolCode,
  }) => MealViewModelProvider._(
    argument: (officeCode: officeCode, schoolCode: schoolCode),
    from: this,
  );

  @override
  String toString() => r'mealViewModelProvider';
}

abstract class _$MealViewModel extends $AsyncNotifier<MealState> {
  late final _$args = ref.$arg as ({String officeCode, String schoolCode});
  String get officeCode => _$args.officeCode;
  String get schoolCode => _$args.schoolCode;

  FutureOr<MealState> build({
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
    final ref = this.ref as $Ref<AsyncValue<MealState>, MealState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<MealState>, MealState>,
              AsyncValue<MealState>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
