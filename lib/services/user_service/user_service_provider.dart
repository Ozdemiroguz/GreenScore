import 'dart:math';

import 'package:greenapp/core/injections/locator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:latlong2/latlong.dart';

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
    ref.read(userServiceProvider).getUserInfo().listen((event) async {
      // print("User Info: $event");
      // print("User Name: ${event.name}");
      final LatLng? location =
          await ref.watch(locationServiceProvier).getCurrentPosition();

      state = event.copyWith(location: location);
      print("User Info  Location: ${state.location}");
    });
  }

  Future<void> dispose() async {
    dispose();
  }
}
