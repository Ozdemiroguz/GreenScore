import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:greenapp/services/user_service/user_service_provider.dart';

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
    state = state.copyWith(editableUser: ref.watch(userService));
  }
}
