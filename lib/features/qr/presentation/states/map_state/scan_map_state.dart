import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:greenapp/features/qr/domain/models/recycling_point.dart';
import 'package:latlong2/latlong.dart';

part 'scan_map_state.freezed.dart';

@freezed
class ScanMapState with _$ScanMapState {
  factory ScanMapState({
    required LatLng? currentLocation,
    required LatLng? currentRecyclingPoint,
    required List<RecyclingPoint>? recyclingPoints,
    required RecyclingPoint? currentRecycling,
  }) = _ScanMapState;

  factory ScanMapState.initial() => ScanMapState(
        currentLocation: null,
        currentRecyclingPoint: null,
        recyclingPoints: [],
        currentRecycling: null,
      );
}
