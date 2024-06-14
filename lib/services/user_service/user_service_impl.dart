import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../core/models/user_data.dart';
import 'user_service.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: UserService)
final class UserServiceImpl implements UserService {
  final FirebaseFirestore _firebaseFirestore;
  final FirebaseAuth _firebaseAuth;

  UserServiceImpl(this._firebaseFirestore, this._firebaseAuth);

  @override
  Stream<UserData> getUserInfo() {
    return _firebaseFirestore
        .collection('users')
        .doc(_firebaseAuth.currentUser!.uid)
        .snapshots()
        .map((snapshot) {
      try {
        final result = UserData.fromJson(snapshot.data()!);
        // print("User Info: $result");
        // print("User Name: ${result.name}");

        return result;
      } catch (error) {
        print("User Service Error: $error");

        return UserData.initial;
      }
    });
  }
}
