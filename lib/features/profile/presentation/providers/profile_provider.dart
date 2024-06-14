import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:greenapp/services/user_service/user_service_provider.dart';

import '../states/profileState/profile_state.dart';

final profileProvider = NotifierProvider<_ProfileNotifier, ProfileState>(
  _ProfileNotifier.new,
);

final class _ProfileNotifier extends Notifier<ProfileState> {
  @override
  ProfileState build() {
    Future(() => init());
    return ProfileState.initial();
  }

  Future<void> init() async {
    state = state.copyWith(currentUser: ref.watch(userService));
  }
}
