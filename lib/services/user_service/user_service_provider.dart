import 'package:greenapp/core/injections/locator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../core/models/user_data.dart';

final userService =
    NotifierProvider<_UserNotifier, UserData>(_UserNotifier.new);

final class _UserNotifier extends Notifier<UserData> {
  @override
  UserData build() {
    Future(() => init());
    return UserData.initial;
  }

  Future<void> init() async {
    ref.read(userServiceProvider).getUserInfo().listen((event) {
      // print("User Info: $event");
      // print("User Name: ${event.name}");
      state = event;
    });
  }

  Future<void> dispose() async {
    dispose();
  }
}
