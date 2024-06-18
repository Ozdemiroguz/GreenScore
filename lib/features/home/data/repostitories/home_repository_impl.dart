import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:greenapp/core/models/user_data.dart';
import 'package:greenapp/features/home/domain/models/appImage.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repositories/home_repository.dart';

@LazySingleton(as: HomeRepository)
class HomeRepositoryImpl implements HomeRepository {
  final FirebaseFirestore _firebaseFirestore;

  HomeRepositoryImpl(this._firebaseFirestore);
  @override
  Stream<List<UserData>> getUsersForLeaderBorard() {
    return _firebaseFirestore
        .collection('users')
        .orderBy(
          'nature_point',
          descending: true,
        )
        .limit(10)
        .snapshots()
        .map((snapshot) {
      try {
        final userData = snapshot.docs
            .map((data) => UserData.fromJson(
                  data.data(),
                ))
            .toList();
        return userData;
      } catch (error) {
        // print("Error LeaderBoard: $error");

        return [];
      }
    });
  }

  @override
  Future<UserData> getUserData() {
    return _firebaseFirestore
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((value) {
      final data = value.data();
      return UserData.fromJson(data!);
    });
  }

  @override
  Stream<UserData> getUserDataStream() {
    return _firebaseFirestore
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .snapshots()
        .map((snapshot) {
      final data = snapshot.data();
      return UserData.fromJson(data!);
    });
  }

  @override
  Future<List<AppImage>> getAppImage() {
    return _firebaseFirestore.collection('appImages').get().then((value) {
      final data = value.docs
          .map((e) => AppImage(
                name: e['name'],
                image: e['url'],
              ))
          .toList();
      // print('AppImage: $data');
      return data;
    });
  }
  //initilized collection
}
