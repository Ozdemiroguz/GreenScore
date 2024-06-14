import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';

import '../../domain/models/map_recycling_point.dart';
part 'map_state.freezed.dart';

@freezed
class MapState with _$MapState {
  factory MapState({
    required List<MapRecyclingPoint> mapRecyclingPoints,
    required LatLng? currentLocation,
    required List<bool> visibleMarkers,
  }) = _MapState;

  factory MapState.initial() => MapState(
        mapRecyclingPoints: [],
        visibleMarkers: [],
        currentLocation: null,
      );
}
