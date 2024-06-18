import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';
import 'package:latlong2/latlong.dart';

import 'location_service.dart';

@LazySingleton(as: LocationService)
class LocationServiceImpl implements LocationService {
  const LocationServiceImpl();

  @override
  Future<LatLng?> getCurrentPosition() async {
    try {
      //permission check
      var permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          print('Location permissions are denied');
          return null;
        }
      } else if (permission == LocationPermission.deniedForever) {
        print(
            'Location permissions are permanently denied, we cannot request permissions.');
        return const LatLng(39000, 30000);
      } else {
        final position = await Geolocator.getCurrentPosition();
        print('Location permissions are granted');

        return LatLng(position.latitude, position.longitude);
      }
      print("Location: Location is null");

      return null;
    } catch (e) {
      print('Location:An error occurred while getting the location: $e');
      return null;
    }
  }
}
