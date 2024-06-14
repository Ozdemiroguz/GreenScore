import 'package:greenapp/features/home/domain/models/appImage.dart';

import '../../../../core/models/user_data.dart';

abstract interface class HomeRepository {
  Stream<List<UserData>> getUsersForLeaderBorard();
  Future<UserData> getUserData();
  Stream<UserData> getUserDataStream();
  Future<List<AppImage>> getAppImage();
}
