import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class CustomMap extends HookWidget {
  final TileLayer? tileLayer;
  final LatLng? initialCenter;
  final double? initialZoom;

  final List<Marker> markers;
  final List<Polyline>? polylines;
  final List<Polygon>? polygons;
  final List<CircleMarker>? circleMarkers;
  final MapOptions? options;
  final MapController mapController;

  const CustomMap({
    this.tileLayer,
    this.initialCenter,
    this.initialZoom,
    required this.markers,
    this.polylines,
    this.polygons,
    this.circleMarkers,
    this.options,
    required this.mapController,
  });

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      mapController: mapController,
      options: MapOptions(
        initialCenter: initialCenter ??
            const LatLng(
              39.782499,
              30.510203,
            ),
        initialZoom: initialZoom ?? 16,
      ),
      children: [
        tileLayer ??
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'com.example.app',
            ),
        MarkerLayer(
          markers: markers,
        ),
      ],
    );
  }
}
