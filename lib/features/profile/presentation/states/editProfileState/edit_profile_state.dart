import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:greenapp/core/models/user_data.dart';
import 'package:greenapp/core/models/validation_result.dart';

part 'edit_profile_state.freezed.dart';

@freezed
class EditProfileState with _$EditProfileState {
  factory EditProfileState({
    required UserData? editableUser,
    required bool isEditing,
    required bool isEditingImage,
    required bool isSaved,
    required String name,
    required String surname,
    required String email,
    required String phone,
    required String? profileImagePath,
    required ValidationResult nameValidation,
    required ValidationResult surnameValidation,
    required ValidationResult emailValidation,
    required ValidationResult phoneValidation,
  }) = _EditProfileState;

  factory EditProfileState.initial() => EditProfileState(
        editableUser: null,
        isEditing: false,
        isEditingImage: false,
        isSaved: false,
        name: '',
        email: '',
        surname: '',
        phone: '',
        profileImagePath: null,
        nameValidation: ValidationResult.success(),
        surnameValidation: ValidationResult.success(),
        emailValidation: ValidationResult.success(),
        phoneValidation: ValidationResult.success(),
      );
}
