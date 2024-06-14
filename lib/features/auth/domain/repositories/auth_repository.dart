import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/models/user_data.dart';

abstract interface class AuthRepository {
  Future<UserCredential> signInWithEmailAndPassword(
      String email, String password);

  Stream<User?> get authStateChanges;
  //signup
  Future<UserCredential> signUpWithEmailAndPassword(
      String email, String password);

  Future<void> addUserInfo(UserData user);
  //signout
  Future<void> signOut();
}
