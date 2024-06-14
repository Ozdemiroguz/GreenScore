import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:greenapp/core/models/user_data.dart';
import 'package:greenapp/main.dart';
import 'package:injectable/injectable.dart';
import 'package:latlong2/latlong.dart';

import '../../domain/models/product_recycle.dart';
import '../../domain/models/recycling_point.dart';
import '../../domain/repositories/product_repository.dart';

@LazySingleton(as: ProductRepository)
class ProductRepositoryImpl implements ProductRepository {
  final FirebaseFirestore _firebaseFirestore;

  ProductRepositoryImpl(this._firebaseFirestore);

  @override
  Future<ProductRecycle?> getProduct(String id) async {
    try {
      return await _firebaseFirestore
          .collection('product')
          .doc(id)
          .get()
          .then((value) {
        final data = ProductRecycle(
          id: value.id,
          name: value['name'],
          description: value['desc'],
          refund: value['refund'].toDouble(),
          image: value['image'],
          company_id: value['company_id'],
          category: value['category'],
          nature_point: value['nature_point'].toDouble(),
          decomposition_year: value['decomposition_year'],
          recycling_rate: value['recycling_rate'],
        );
        return data;
      });
    } catch (e) {
      print('Get Product An error occurred while getting the product: $e');
      // Hata durumunda, null veya başka bir değer döndürebilirsiniz.
      return null;
    }
  }

  @override
  Future<List<RecyclingPoint>> getRecyclingPoints(
    String currentCategory,
  ) async {
    try {
      return await _firebaseFirestore
          .collection('recycling_point')
          .where('categories', arrayContains: currentCategory)
          .get()
          .then((value) {
        final data = value.docs
            .map((e) => RecyclingPoint(
                  title: e['title'],
                  address: e['address'],
                  location: LatLng(e['lat'].toDouble(),
                      e['lng'].toDouble()), // LatLng(e['lat'], e['lng']),
                  phone: e['phone'],
                  capacity: e['capacity'],
                  type: e['type'],
                  categories: List<String>.from(
                    e['categories'],
                  ), // eğer categories alanı boşsa hata alabilirsiniz.
                ))
            .toList();
        print(data);
        return data;
      });
    } catch (e) {
      print('An error occurred while getting the recycling points: $e');
      // Hata durumunda, null veya başka bir değer döndürebilirsiniz.
      return [];
    }
  }

  @override
  Future<void> setUser() async {
    try {
      await _firebaseFirestore
          .collection('recycling_point')
          .doc(makinaId)
          .update({
        'current_user': FirebaseAuth.instance.currentUser!.uid,
      });
    } catch (error) {
      print(error);
    }
  }

  @override
  Stream<Map<String, dynamic>> getMachineInfo() {
    return _firebaseFirestore
        .collection('recycling_point')
        .doc(makinaId)
        .snapshots()
        .map((snapshot) {
      try {
        final result = snapshot.data()!;
        print("Machine Info: $result");

        return result;
      } catch (error) {
        print(error);

        return {};
      }
    });
  }

  @override
  Future<void> setDone(ProductRecycle product) async {
    try {
      await _firebaseFirestore
          .collection('recycling_point')
          .doc(makinaId)
          .update({
        'done_products': FieldValue.arrayUnion([product.id]),
        'is_done': true,
      });
    } catch (error) {
      print(error);
    }
  }

  @override
  Future<void> setCanceled(ProductRecycle product) async {
    try {
      await _firebaseFirestore
          .collection('recycling_point')
          .doc(makinaId)
          .update({
        'is_cancelled': true,
      });
    } catch (error) {
      print(error);
    }
  }

  @override
  Future<void> setPointAndRefund(
      ProductRecycle product, UserData userData) async {
    try {
      await _firebaseFirestore
          .collection('users')
          .where('id', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .get()
          .then((value) {
        _firebaseFirestore.collection('users').doc(value.docs.first.id).update({
          'balance': (product.refund + userData.balance.toDouble()).toDouble(),
          'nature_point':
              (product.nature_point + userData.naturePoint.toDouble())
                  .toDouble(),
        });
      });
    } catch (error) {
      print(error);
    }
  }

  @override
  Stream<Map<String, dynamic>> getUserInfo() {
    return _firebaseFirestore
        .collection('users')
        .where(
          'id',
          isEqualTo: FirebaseAuth.instance.currentUser!.uid,
        )
        .snapshots()
        .map((snapshot) {
      try {
        final result = snapshot.docs.first.data();

        return result;
      } catch (error) {
        print(error);

        return {};
      }
    });
  }

  @override
  Future<void> resetInfo() async {
    try {
      await _firebaseFirestore
          .collection('recycling_point')
          .doc(makinaId)
          .update({
        'current_user': '',
        'product_id': '',
        'is_done': false,
        'is_cancelled': false,
      });
    } catch (error) {
      print(error);
    }
  }

  @override
  Future<void> again() async {
    try {
      await _firebaseFirestore
          .collection('recycling_point')
          .doc(makinaId)
          .update({
        'product_id': '',
        'is_done': false,
        'is_cancelled': false,
      });
    } catch (error) {
      print(error);
    }
  }
}
