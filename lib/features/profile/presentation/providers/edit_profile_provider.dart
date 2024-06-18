import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:greenapp/core/injections/locator.dart';
import 'package:greenapp/core/models/user_data.dart';
import 'package:greenapp/services/user_service/user_service_provider.dart';
import 'package:greenapp/utils/validators/validators.dart';

import '../../../../core/models/validation_result.dart';
import '../states/editProfileState/edit_profile_state.dart';

final editprofileProvider =
    NotifierProvider.autoDispose<_EditProfileNotifier, EditProfileState>(
  _EditProfileNotifier.new,
);

final class _EditProfileNotifier extends AutoDisposeNotifier<EditProfileState> {
  @override
  EditProfileState build() {
    Future(() => init());
    return EditProfileState.initial();
  }

  Future<void> init() async {
    state = state.copyWith(editableUser: await ref.watch(userService));
    state = state.copyWith(
      name: state.editableUser!.name,
      surname: state.editableUser!.surname,
      email: state.editableUser!.email,
      phone: state.editableUser!.phone,
    );
  }

  Future<void> nameChanged(String name) async {
    state = state.copyWith(name: name, nameValidation: validateUsername(name));
    startEditing();
  }

  Future<void> surnameChanged(String surname) async {
    state = state.copyWith(
        surname: surname, surnameValidation: validateUsername(surname));
    startEditing();
  }

  Future<void> emailChanged(String email) async {
    state = state.copyWith(email: email, emailValidation: validateEmail(email));
  }

  Future<void> phoneChanged(String phone) async {
    state = state.copyWith(
      phone: phone,
    );
    print(phone);
    startEditing();
  }

  Future<void> changeProfileImage(String profileImagePath) async {
    state = state.copyWith(
        profileImagePath: profileImagePath, isEditingImage: true);
  }

  Future<void> startEditing() async {
    if (state.editableUser!.name == state.name &&
        state.editableUser!.surname == state.surname &&
        state.editableUser!.email == state.email &&
        state.editableUser!.phone == state.phone) {
      state = state.copyWith(isEditing: false);
      return;
    }
    state = state.copyWith(isEditing: true);
  }

  Future<void> reset() async {
    state = state.copyWith(
      name: state.editableUser!.name,
      surname: state.editableUser!.surname,
      email: state.editableUser!.email,
      phone: state.editableUser!.phone,
      isEditing: false,
      isEditingImage: false,
      profileImagePath: null,
      nameValidation: ValidationResult.success(),
      surnameValidation: ValidationResult.success(),
      emailValidation: ValidationResult.success(),
      phoneValidation: ValidationResult.success(),
    );
  }

  Future<void> save() async {
    if (state.isEditingImage) {
      String url = await ref
          .read(profileRepositoryProvider)
          .uploadImage(state.profileImagePath!, state.editableUser!.id);

      await ref
          .read(profileRepositoryProvider)
          .updateImage(url, state.editableUser!.id);
      await setIsSaved();
    }
    if (state.isEditing) {
      await ref.read(profileRepositoryProvider).updateUserData(UserData(
            id: state.editableUser!.id,
            name: state.name,
            surname: state.surname,
            email: state.email,
            phone: state.phone,
            balance: state.editableUser!.balance,
            naturePoint: state.editableUser!.naturePoint,
            savedCo2: state.editableUser!.savedCo2,
            profileImage: state.editableUser!.profileImage,
            bag: state.editableUser!.bag,
            recycled: state.editableUser!.recycled,
          ));
    }
  }

  Future<void> setIsSaved() async {
    state = state.copyWith(isSaved: true);
  }
}
