// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'map_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MapState {
  List<MapRecyclingPoint> get mapRecyclingPoints =>
      throw _privateConstructorUsedError;
  LatLng? get currentLocation => throw _privateConstructorUsedError;
  List<bool> get visibleMarkers => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MapStateCopyWith<MapState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MapStateCopyWith<$Res> {
  factory $MapStateCopyWith(MapState value, $Res Function(MapState) then) =
      _$MapStateCopyWithImpl<$Res, MapState>;
  @useResult
  $Res call(
      {List<MapRecyclingPoint> mapRecyclingPoints,
      LatLng? currentLocation,
      List<bool> visibleMarkers});
}

/// @nodoc
class _$MapStateCopyWithImpl<$Res, $Val extends MapState>
    implements $MapStateCopyWith<$Res> {
  _$MapStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mapRecyclingPoints = null,
    Object? currentLocation = freezed,
    Object? visibleMarkers = null,
  }) {
    return _then(_value.copyWith(
      mapRecyclingPoints: null == mapRecyclingPoints
          ? _value.mapRecyclingPoints
          : mapRecyclingPoints // ignore: cast_nullable_to_non_nullable
              as List<MapRecyclingPoint>,
      currentLocation: freezed == currentLocation
          ? _value.currentLocation
          : currentLocation // ignore: cast_nullable_to_non_nullable
              as LatLng?,
      visibleMarkers: null == visibleMarkers
          ? _value.visibleMarkers
          : visibleMarkers // ignore: cast_nullable_to_non_nullable
              as List<bool>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MapStateImplCopyWith<$Res>
    implements $MapStateCopyWith<$Res> {
  factory _$$MapStateImplCopyWith(
          _$MapStateImpl value, $Res Function(_$MapStateImpl) then) =
      __$$MapStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<MapRecyclingPoint> mapRecyclingPoints,
      LatLng? currentLocation,
      List<bool> visibleMarkers});
}

/// @nodoc
class __$$MapStateImplCopyWithImpl<$Res>
    extends _$MapStateCopyWithImpl<$Res, _$MapStateImpl>
    implements _$$MapStateImplCopyWith<$Res> {
  __$$MapStateImplCopyWithImpl(
      _$MapStateImpl _value, $Res Function(_$MapStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mapRecyclingPoints = null,
    Object? currentLocation = freezed,
    Object? visibleMarkers = null,
  }) {
    return _then(_$MapStateImpl(
      mapRecyclingPoints: null == mapRecyclingPoints
          ? _value._mapRecyclingPoints
          : mapRecyclingPoints // ignore: cast_nullable_to_non_nullable
              as List<MapRecyclingPoint>,
      currentLocation: freezed == currentLocation
          ? _value.currentLocation
          : currentLocation // ignore: cast_nullable_to_non_nullable
              as LatLng?,
      visibleMarkers: null == visibleMarkers
          ? _value._visibleMarkers
          : visibleMarkers // ignore: cast_nullable_to_non_nullable
              as List<bool>,
    ));
  }
}

/// @nodoc

class _$MapStateImpl implements _MapState {
  _$MapStateImpl(
      {required final List<MapRecyclingPoint> mapRecyclingPoints,
      required this.currentLocation,
      required final List<bool> visibleMarkers})
      : _mapRecyclingPoints = mapRecyclingPoints,
        _visibleMarkers = visibleMarkers;

  final List<MapRecyclingPoint> _mapRecyclingPoints;
  @override
  List<MapRecyclingPoint> get mapRecyclingPoints {
    if (_mapRecyclingPoints is EqualUnmodifiableListView)
      return _mapRecyclingPoints;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_mapRecyclingPoints);
  }

  @override
  final LatLng? currentLocation;
  final List<bool> _visibleMarkers;
  @override
  List<bool> get visibleMarkers {
    if (_visibleMarkers is EqualUnmodifiableListView) return _visibleMarkers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_visibleMarkers);
  }

  @override
  String toString() {
    return 'MapState(mapRecyclingPoints: $mapRecyclingPoints, currentLocation: $currentLocation, visibleMarkers: $visibleMarkers)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MapStateImpl &&
            const DeepCollectionEquality()
                .equals(other._mapRecyclingPoints, _mapRecyclingPoints) &&
            (identical(other.currentLocation, currentLocation) ||
                other.currentLocation == currentLocation) &&
            const DeepCollectionEquality()
                .equals(other._visibleMarkers, _visibleMarkers));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_mapRecyclingPoints),
      currentLocation,
      const DeepCollectionEquality().hash(_visibleMarkers));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MapStateImplCopyWith<_$MapStateImpl> get copyWith =>
      __$$MapStateImplCopyWithImpl<_$MapStateImpl>(this, _$identity);
}

abstract class _MapState implements MapState {
  factory _MapState(
      {required final List<MapRecyclingPoint> mapRecyclingPoints,
      required final LatLng? currentLocation,
      required final List<bool> visibleMarkers}) = _$MapStateImpl;

  @override
  List<MapRecyclingPoint> get mapRecyclingPoints;
  @override
  LatLng? get currentLocation;
  @override
  List<bool> get visibleMarkers;
  @override
  @JsonKey(ignore: true)
  _$$MapStateImplCopyWith<_$MapStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
