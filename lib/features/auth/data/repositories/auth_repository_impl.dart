import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/models/auth_epection.dart';
import '../../../../core/models/user_data.dart';
import '../../domain/repositories/auth_repository.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firebaseFirestore;

  AuthRepositoryImpl(this._firebaseAuth, this._firebaseFirestore);

  @override
  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();
  //kullanoco bilgilerini almak için

  @override
  Future<UserCredential> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw AuthException(
          errorCode: e.code, errorMessage: e.message.toString());
    }
  }

  //signup
  @override
  Future<UserCredential> signUpWithEmailAndPassword(
      String email, String password) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw AuthException(
          errorCode: e.code, errorMessage: e.message.toString());
    }
  }

  @override
  Future<void> addUserInfo(UserData user) async {
    try {
      await _firebaseFirestore.collection('users').doc(user.id).set({
        'id': user.id,
        'name': user.name,
        'surname': user.surname,
        'email': user.email,
        'nature_point': user.naturePoint,
        'balance': user.balance,
        'profile_image': '',
        'bag': [],
        'saved_co2': user.savedCo2,
        'recycled': user.recycled,
        'created_at': FieldValue.serverTimestamp(),
      });
    } catch (error) {
      print(error);
    }
  }

  //signout
  @override
  Future<void> signOut() async {
    //try catch block
    try {
      await _firebaseAuth.signOut();
    } on FirebaseAuthException catch (e) {
      throw AuthException(
          errorCode: e.code, errorMessage: e.message.toString());
    }
  }
}
