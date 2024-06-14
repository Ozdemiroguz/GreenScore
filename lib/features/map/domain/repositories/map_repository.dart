import 'package:greenapp/features/map/domain/models/map_recycling_point.dart';

abstract interface class MapRepository {
  Future<List<MapRecyclingPoint>> getRecyclingPoints(
    String currentCategory,
  );
}
