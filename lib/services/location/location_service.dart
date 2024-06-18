import 'package:latlong2/latlong.dart';

abstract class LocationService {
  // Future<Either<Failure, Unit>> checkPermission();
  Future<LatLng?> getCurrentPosition();
}
