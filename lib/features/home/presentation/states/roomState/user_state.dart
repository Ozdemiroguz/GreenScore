import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:greenapp/core/models/user_data.dart';

import '../../../domain/models/appImage.dart';

part 'user_state.freezed.dart';

@freezed
class UserState with _$UserState {
  factory UserState({
    List<UserData>? leaderBordUsers,
    UserData? currentUserData,
    List<UserData>? users,
    List<AppImage>? appImages,
  }) = _UserState;

  factory UserState.initial() => UserState(
        leaderBordUsers: [],
        currentUserData: null,
        users: [],
        appImages: [],
      );
}
