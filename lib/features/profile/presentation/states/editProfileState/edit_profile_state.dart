import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:greenapp/core/models/user_data.dart';

part 'edit_profile_state.freezed.dart';

@freezed
class EditProfileState with _$EditProfileState {
  factory EditProfileState({
    required UserData? editableUser,
    required bool isEditing,
    required bool isSaving,
    required String name,
    required String surname,
    required String email,
  }) = _EditProfileState;

  factory EditProfileState.initial() => EditProfileState(
        editableUser: null,
        isEditing: false,
        isSaving: false,
        name: '',
        email: '',
        surname: '',
      );
}
