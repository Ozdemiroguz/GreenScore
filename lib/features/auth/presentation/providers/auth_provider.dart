import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/injections/locator.dart';
import '../../../../core/models/auth_epection.dart';
import '../states/authState/auth_state.dart';

final authProvider =
    NotifierProvider<_AuthNotifier, AuthState>(_AuthNotifier.new);

final class _AuthNotifier extends Notifier<AuthState> {
  @override
  AuthState build() {
    Future(() => init());

    return AuthState.initial();
  }

  Future<void> init() async {
    ref.read(authRepositoryProvider).authStateChanges.listen((User? user) {
      if (user != null) {
        state = state.copyWith(status: true, user: user);
      } else {
        state = state.copyWith(status: false, user: null);
      }
    });
  }
  //kullanoco bilgilerini almak için

  //signout
  Future<void> signOut() async {
    try {
      await ref.read(authRepositoryProvider).signOut();
    } on AuthException catch (e) {
      state = state.copyWith(failure: e);
    } catch (e) {
      state = state.copyWith(
          failure:
              AuthException(errorCode: "Unknown", errorMessage: e.toString()));
    }
  }
}
