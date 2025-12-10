// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(WeatherViewModel)
const weatherViewModelProvider = WeatherViewModelProvider._();

final class WeatherViewModelProvider
    extends $AsyncNotifierProvider<WeatherViewModel, WeatherEntity> {
  const WeatherViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'weatherViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$weatherViewModelHash();

  @$internal
  @override
  WeatherViewModel create() => WeatherViewModel();
}

String _$weatherViewModelHash() => r'9a7926572255b761e3d04da906bb73a5630e24fd';

abstract class _$WeatherViewModel extends $AsyncNotifier<WeatherEntity> {
  FutureOr<WeatherEntity> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<WeatherEntity>, WeatherEntity>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<WeatherEntity>, WeatherEntity>,
              AsyncValue<WeatherEntity>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
