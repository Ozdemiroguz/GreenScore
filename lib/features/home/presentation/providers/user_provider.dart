import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:greenapp/core/injections/locator.dart';
import 'package:greenapp/features/home/presentation/states/roomState/user_state.dart';
import 'package:greenapp/services/user_service/user_service_provider.dart';

final homeProvider = NotifierProvider<_UsersNotifier, UserState>(
  _UsersNotifier.new,
);

final class _UsersNotifier extends Notifier<UserState> {
  @override
  UserState build() {
    Future(() => init());
    return UserState.initial();
  }

  Future<void> init() async {
    state = state.copyWith(currentUserData: ref.watch(userService));

    ref.read(homeRepositoryProvider).getUsersForLeaderBorard().listen((event) {
      state = state.copyWith(leaderBordUsers: event);
    });

    ref.read(homeRepositoryProvider).getAppImage().then((value) {
      state = state.copyWith(appImages: value);
    });
  }
}
