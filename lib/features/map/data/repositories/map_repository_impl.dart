import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:greenapp/features/map/domain/models/map_recycling_point.dart';
import 'package:greenapp/features/map/domain/repositories/map_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:latlong2/latlong.dart';

@LazySingleton(as: MapRepository)
class MapRepositoryImpl implements MapRepository {
  final FirebaseFirestore _firebaseFirestore;

  MapRepositoryImpl(this._firebaseFirestore);

  @override
  Future<List<MapRecyclingPoint>> getRecyclingPoints(
    String currentCategory,
  ) async {
    try {
      if (currentCategory == '') {
        return await _firebaseFirestore
            .collection('recycling_point')
            .get()
            .then((value) {
          final data = value.docs
              .map((e) => MapRecyclingPoint(
                    title: e['title'],
                    address: e['address'],
                    location: LatLng(e['lat'].toDouble(), e['lng'].toDouble()),
                    phone: e['phone'],
                    capacity: e['capacity'],
                    type: e['type'],
                    categories: List<String>.from(
                      e['categories'],
                    ),
                  ))
              .toList();
          return data;
        });
      } else {
        return await _firebaseFirestore
            .collection('recycling_point')
            .where('categories', arrayContains: currentCategory)
            .get()
            .then((value) {
          final data = value.docs
              .map((e) => MapRecyclingPoint(
                    title: e['title'],
                    address: e['address'],
                    location: LatLng(e['lat'].toDouble(), e['lng'].toDouble()),
                    phone: e['phone'],
                    capacity: e['capacity'],
                    type: e['type'],
                    categories: List<String>.from(
                      e['categories'],
                    ),
                  ))
              .toList();
          //  print(data);
          return data;
        });
      }
    } catch (e) {
      print(' An error occurred while getting the recycling points: $e');
      // Hata durumunda, null veya başka bir değer döndürebilirsiniz.
      return [];
    }
  }
}
