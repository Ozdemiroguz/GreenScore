import 'package:greenapp/core/models/user_data.dart';

abstract interface class ProfileRepository {
  Future<void> updateUserData(UserData changedUserData);
  Future<void> updateImage(String url, String userId);
  Future<String> uploadImage(String path, String userId);
}
