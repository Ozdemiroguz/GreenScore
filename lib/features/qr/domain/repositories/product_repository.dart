import 'package:greenapp/core/models/user_data.dart';
import 'package:greenapp/features/qr/domain/models/product_recycle.dart';
import 'package:latlong2/latlong.dart';

import '../models/recycling_point.dart';

abstract interface class ProductRepository {
  Future<ProductRecycle?> getProduct(String id);

  Future<List<RecyclingPoint>> getRecyclingPoints(
      String currentCategory, LatLng currentLocation);
  Future<void> setUser();

  Stream<Map<String, dynamic>> getMachineInfo();
  Stream<Map<String, dynamic>> getUserInfo();
  Future<void> setDone(ProductRecycle productRecycle);
  Future<void> setCanceled(ProductRecycle product);
  Future<void> setPointAndRefund(ProductRecycle product, UserData userData);
  Future<void> resetInfo();
  Future<void> again();
}
