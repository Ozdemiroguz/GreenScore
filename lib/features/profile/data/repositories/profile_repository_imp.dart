import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:greenapp/core/models/user_data.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repositories/profile_repository.dart';

@LazySingleton(as: ProfileRepository)
class ProfileRepositoryImpl implements ProfileRepository {
  final FirebaseFirestore _firebaseFirestore;
  final FirebaseStorage _firebaseStorage;

  ProfileRepositoryImpl(this._firebaseFirestore, this._firebaseStorage);

  @override
  Future<String> uploadImage(String path, String userId) async {
    Reference ref = _firebaseStorage.ref().child('profile_images/$userId');
    UploadTask uploadTask = ref.putFile(File(path));

    TaskSnapshot snapshot = await uploadTask.whenComplete(() {});
    String downloadUrl = await snapshot.ref.getDownloadURL();

    return downloadUrl;

    // Returns the download url
  }

  @override
  Future<void> updateUserData(UserData changedUserData) async {
    print(changedUserData.id);
    _firebaseFirestore.collection('users').doc(changedUserData.id).update({
      'name': changedUserData.name,
      'email': changedUserData.email,
      'phone': changedUserData.phone,
      'surname': changedUserData.surname,
    });
  }

  @override
  Future<void> updateImage(String url, String userId) async {
    _firebaseFirestore.collection('users').doc(userId).update({
      'profile_image': url,
    });
  }
}
