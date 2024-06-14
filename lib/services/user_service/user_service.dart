import 'package:greenapp/core/models/user_data.dart';

abstract interface class UserService {
  Stream<UserData> getUserInfo();
}
