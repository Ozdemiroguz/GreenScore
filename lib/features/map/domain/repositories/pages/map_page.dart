import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greenapp/customs/custom_map.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:latlong2/latlong.dart';

import '../../../presentation/providers/map_provider.dart';

@RoutePage()
class MapPage extends HookConsumerWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(mapProvider.notifier);
    final MapController mapController = MapController();

    return Stack(
      children: [
        _MapContent(
          mapController,
        ),
      ],
    );
  }
}

class _MapContent extends ConsumerWidget {
  final MapController mapController;
  const _MapContent(this.mapController);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(mapProvider);
    return state.mapRecyclingPoints.isEmpty
        ? const CircularProgressIndicator.adaptive()
        : CustomMap(
            initialZoom: 10,
            initialCenter: ref.read(mapProvider).currentLocation,
            markers: List.generate(
                ref.read(mapProvider).mapRecyclingPoints.length,
                (index) => buildMarker(
                      state.mapRecyclingPoints[index].location,
                      ref,
                      index,
                    )),
            mapController: mapController);
  }
}

Marker buildMarker(LatLng point, WidgetRef ref, int index) {
  final state = ref.watch(mapProvider);
  return Marker(
    width: 120.w,
    height: 30.h,
    point: point,
    child: GestureDetector(
      onTap: () {
        ref.read(mapProvider.notifier).toggleMarkerVisibility(index);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Icon(
            Icons.location_on,
            color: Colors.red,
            size: 30.r,
          ),
        ],
      ),
    ),
  );
}
