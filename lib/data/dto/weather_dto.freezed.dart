// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weather_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WeatherDto {

@JsonKey(name: 'time') DateTime get time;@JsonKey(name: 'temperature_2m') num get temperature;@JsonKey(name: 'precipitation_probability') int get precipitation;
/// Create a copy of WeatherDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WeatherDtoCopyWith<WeatherDto> get copyWith => _$WeatherDtoCopyWithImpl<WeatherDto>(this as WeatherDto, _$identity);

  /// Serializes this WeatherDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WeatherDto&&(identical(other.time, time) || other.time == time)&&(identical(other.temperature, temperature) || other.temperature == temperature)&&(identical(other.precipitation, precipitation) || other.precipitation == precipitation));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,time,temperature,precipitation);

@override
String toString() {
  return 'WeatherDto(time: $time, temperature: $temperature, precipitation: $precipitation)';
}


}

/// @nodoc
abstract mixin class $WeatherDtoCopyWith<$Res>  {
  factory $WeatherDtoCopyWith(WeatherDto value, $Res Function(WeatherDto) _then) = _$WeatherDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'time') DateTime time,@JsonKey(name: 'temperature_2m') num temperature,@JsonKey(name: 'precipitation_probability') int precipitation
});




}
/// @nodoc
class _$WeatherDtoCopyWithImpl<$Res>
    implements $WeatherDtoCopyWith<$Res> {
  _$WeatherDtoCopyWithImpl(this._self, this._then);

  final WeatherDto _self;
  final $Res Function(WeatherDto) _then;

/// Create a copy of WeatherDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? time = null,Object? temperature = null,Object? precipitation = null,}) {
  return _then(_self.copyWith(
time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as DateTime,temperature: null == temperature ? _self.temperature : temperature // ignore: cast_nullable_to_non_nullable
as num,precipitation: null == precipitation ? _self.precipitation : precipitation // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [WeatherDto].
extension WeatherDtoPatterns on WeatherDto {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WeatherDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WeatherDto() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WeatherDto value)  $default,){
final _that = this;
switch (_that) {
case _WeatherDto():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WeatherDto value)?  $default,){
final _that = this;
switch (_that) {
case _WeatherDto() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'time')  DateTime time, @JsonKey(name: 'temperature_2m')  num temperature, @JsonKey(name: 'precipitation_probability')  int precipitation)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WeatherDto() when $default != null:
return $default(_that.time,_that.temperature,_that.precipitation);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'time')  DateTime time, @JsonKey(name: 'temperature_2m')  num temperature, @JsonKey(name: 'precipitation_probability')  int precipitation)  $default,) {final _that = this;
switch (_that) {
case _WeatherDto():
return $default(_that.time,_that.temperature,_that.precipitation);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'time')  DateTime time, @JsonKey(name: 'temperature_2m')  num temperature, @JsonKey(name: 'precipitation_probability')  int precipitation)?  $default,) {final _that = this;
switch (_that) {
case _WeatherDto() when $default != null:
return $default(_that.time,_that.temperature,_that.precipitation);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WeatherDto implements WeatherDto {
  const _WeatherDto({@JsonKey(name: 'time') required this.time, @JsonKey(name: 'temperature_2m') required this.temperature, @JsonKey(name: 'precipitation_probability') required this.precipitation});
  factory _WeatherDto.fromJson(Map<String, dynamic> json) => _$WeatherDtoFromJson(json);

@override@JsonKey(name: 'time') final  DateTime time;
@override@JsonKey(name: 'temperature_2m') final  num temperature;
@override@JsonKey(name: 'precipitation_probability') final  int precipitation;

/// Create a copy of WeatherDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WeatherDtoCopyWith<_WeatherDto> get copyWith => __$WeatherDtoCopyWithImpl<_WeatherDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WeatherDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WeatherDto&&(identical(other.time, time) || other.time == time)&&(identical(other.temperature, temperature) || other.temperature == temperature)&&(identical(other.precipitation, precipitation) || other.precipitation == precipitation));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,time,temperature,precipitation);

@override
String toString() {
  return 'WeatherDto(time: $time, temperature: $temperature, precipitation: $precipitation)';
}


}

/// @nodoc
abstract mixin class _$WeatherDtoCopyWith<$Res> implements $WeatherDtoCopyWith<$Res> {
  factory _$WeatherDtoCopyWith(_WeatherDto value, $Res Function(_WeatherDto) _then) = __$WeatherDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'time') DateTime time,@JsonKey(name: 'temperature_2m') num temperature,@JsonKey(name: 'precipitation_probability') int precipitation
});




}
/// @nodoc
class __$WeatherDtoCopyWithImpl<$Res>
    implements _$WeatherDtoCopyWith<$Res> {
  __$WeatherDtoCopyWithImpl(this._self, this._then);

  final _WeatherDto _self;
  final $Res Function(_WeatherDto) _then;

/// Create a copy of WeatherDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? time = null,Object? temperature = null,Object? precipitation = null,}) {
  return _then(_WeatherDto(
time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as DateTime,temperature: null == temperature ? _self.temperature : temperature // ignore: cast_nullable_to_non_nullable
as num,precipitation: null == precipitation ? _self.precipitation : precipitation // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
