import 'package:latlong2/latlong.dart';

class RecyclingPoint {
  LatLng location;
  String title;
  bool type;
  List<String> categories;
  int capacity;
  String address;
  String phone;

  RecyclingPoint({
    required this.location,
    required this.title,
    required this.type,
    required this.categories,
    required this.capacity,
    required this.address,
    required this.phone,
  });
}
