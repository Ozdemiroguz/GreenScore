// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'scan_map_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ScanMapState {
  LatLng? get currentLocation => throw _privateConstructorUsedError;
  LatLng? get currentRecyclingPoint => throw _privateConstructorUsedError;
  List<RecyclingPoint>? get recyclingPoints =>
      throw _privateConstructorUsedError;
  RecyclingPoint? get currentRecycling => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ScanMapStateCopyWith<ScanMapState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScanMapStateCopyWith<$Res> {
  factory $ScanMapStateCopyWith(
          ScanMapState value, $Res Function(ScanMapState) then) =
      _$ScanMapStateCopyWithImpl<$Res, ScanMapState>;
  @useResult
  $Res call(
      {LatLng? currentLocation,
      LatLng? currentRecyclingPoint,
      List<RecyclingPoint>? recyclingPoints,
      RecyclingPoint? currentRecycling});
}

/// @nodoc
class _$ScanMapStateCopyWithImpl<$Res, $Val extends ScanMapState>
    implements $ScanMapStateCopyWith<$Res> {
  _$ScanMapStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentLocation = freezed,
    Object? currentRecyclingPoint = freezed,
    Object? recyclingPoints = freezed,
    Object? currentRecycling = freezed,
  }) {
    return _then(_value.copyWith(
      currentLocation: freezed == currentLocation
          ? _value.currentLocation
          : currentLocation // ignore: cast_nullable_to_non_nullable
              as LatLng?,
      currentRecyclingPoint: freezed == currentRecyclingPoint
          ? _value.currentRecyclingPoint
          : currentRecyclingPoint // ignore: cast_nullable_to_non_nullable
              as LatLng?,
      recyclingPoints: freezed == recyclingPoints
          ? _value.recyclingPoints
          : recyclingPoints // ignore: cast_nullable_to_non_nullable
              as List<RecyclingPoint>?,
      currentRecycling: freezed == currentRecycling
          ? _value.currentRecycling
          : currentRecycling // ignore: cast_nullable_to_non_nullable
              as RecyclingPoint?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ScanMapStateImplCopyWith<$Res>
    implements $ScanMapStateCopyWith<$Res> {
  factory _$$ScanMapStateImplCopyWith(
          _$ScanMapStateImpl value, $Res Function(_$ScanMapStateImpl) then) =
      __$$ScanMapStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {LatLng? currentLocation,
      LatLng? currentRecyclingPoint,
      List<RecyclingPoint>? recyclingPoints,
      RecyclingPoint? currentRecycling});
}

/// @nodoc
class __$$ScanMapStateImplCopyWithImpl<$Res>
    extends _$ScanMapStateCopyWithImpl<$Res, _$ScanMapStateImpl>
    implements _$$ScanMapStateImplCopyWith<$Res> {
  __$$ScanMapStateImplCopyWithImpl(
      _$ScanMapStateImpl _value, $Res Function(_$ScanMapStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentLocation = freezed,
    Object? currentRecyclingPoint = freezed,
    Object? recyclingPoints = freezed,
    Object? currentRecycling = freezed,
  }) {
    return _then(_$ScanMapStateImpl(
      currentLocation: freezed == currentLocation
          ? _value.currentLocation
          : currentLocation // ignore: cast_nullable_to_non_nullable
              as LatLng?,
      currentRecyclingPoint: freezed == currentRecyclingPoint
          ? _value.currentRecyclingPoint
          : currentRecyclingPoint // ignore: cast_nullable_to_non_nullable
              as LatLng?,
      recyclingPoints: freezed == recyclingPoints
          ? _value._recyclingPoints
          : recyclingPoints // ignore: cast_nullable_to_non_nullable
              as List<RecyclingPoint>?,
      currentRecycling: freezed == currentRecycling
          ? _value.currentRecycling
          : currentRecycling // ignore: cast_nullable_to_non_nullable
              as RecyclingPoint?,
    ));
  }
}

/// @nodoc

class _$ScanMapStateImpl implements _ScanMapState {
  _$ScanMapStateImpl(
      {required this.currentLocation,
      required this.currentRecyclingPoint,
      required final List<RecyclingPoint>? recyclingPoints,
      required this.currentRecycling})
      : _recyclingPoints = recyclingPoints;

  @override
  final LatLng? currentLocation;
  @override
  final LatLng? currentRecyclingPoint;
  final List<RecyclingPoint>? _recyclingPoints;
  @override
  List<RecyclingPoint>? get recyclingPoints {
    final value = _recyclingPoints;
    if (value == null) return null;
    if (_recyclingPoints is EqualUnmodifiableListView) return _recyclingPoints;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final RecyclingPoint? currentRecycling;

  @override
  String toString() {
    return 'ScanMapState(currentLocation: $currentLocation, currentRecyclingPoint: $currentRecyclingPoint, recyclingPoints: $recyclingPoints, currentRecycling: $currentRecycling)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScanMapStateImpl &&
            (identical(other.currentLocation, currentLocation) ||
                other.currentLocation == currentLocation) &&
            (identical(other.currentRecyclingPoint, currentRecyclingPoint) ||
                other.currentRecyclingPoint == currentRecyclingPoint) &&
            const DeepCollectionEquality()
                .equals(other._recyclingPoints, _recyclingPoints) &&
            (identical(other.currentRecycling, currentRecycling) ||
                other.currentRecycling == currentRecycling));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      currentLocation,
      currentRecyclingPoint,
      const DeepCollectionEquality().hash(_recyclingPoints),
      currentRecycling);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ScanMapStateImplCopyWith<_$ScanMapStateImpl> get copyWith =>
      __$$ScanMapStateImplCopyWithImpl<_$ScanMapStateImpl>(this, _$identity);
}

abstract class _ScanMapState implements ScanMapState {
  factory _ScanMapState(
      {required final LatLng? currentLocation,
      required final LatLng? currentRecyclingPoint,
      required final List<RecyclingPoint>? recyclingPoints,
      required final RecyclingPoint? currentRecycling}) = _$ScanMapStateImpl;

  @override
  LatLng? get currentLocation;
  @override
  LatLng? get currentRecyclingPoint;
  @override
  List<RecyclingPoint>? get recyclingPoints;
  @override
  RecyclingPoint? get currentRecycling;
  @override
  @JsonKey(ignore: true)
  _$$ScanMapStateImplCopyWith<_$ScanMapStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
