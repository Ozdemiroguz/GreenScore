import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:greenapp/core/models/user_data.dart';

part 'profile_state.freezed.dart';

@freezed
class ProfileState with _$ProfileState {
  factory ProfileState({
    required UserData? currentUser,
  }) = _ProfileState;

  factory ProfileState.initial() => ProfileState(
        currentUser: null,
      );
}
