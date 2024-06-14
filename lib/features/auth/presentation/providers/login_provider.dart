import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/injections/locator.dart';
import '../../../../core/models/auth_epection.dart';
import '../../../../core/models/status.dart';
import '../../../../utils/validators.dart';
import '../states/loginState/login_state.dart';

final loginProvider = NotifierProvider.autoDispose<_LoginNotifier, LoginState>(
    _LoginNotifier.new);

class _LoginNotifier extends AutoDisposeNotifier<LoginState> {
  @override
  LoginState build() {
    return LoginState.initial();
  }

  Future<void> login() async {
    state = state.copyWith(status: AuthStatus.loading);
    try {
      await ref
          .read(authRepositoryProvider)
          .signInWithEmailAndPassword(state.userName, state.password);
      state = state.copyWith(status: AuthStatus.authenticated);
    } on AuthException catch (e) {
      print(e.errorCode);
      print(e.errorMessage);

      state = state.copyWith(
        status: AuthStatus.error,
        //english error message
        failure: "Error: ${e.errorMessage}",
      );
    } catch (e) {
      print(e);

      state = state.copyWith(
        status: AuthStatus.error,
        failure: 'UnknownError: $e',
      );
    }
  }

  void onEmailChanged(String userName) {
    state = state.copyWith(
      userName: userName,
      userNameFailure: validateEmail(userName),
    );
  }

  void onPasswordChanged(String password) {
    state = state.copyWith(
      password: password,
      passwordFailure: validatePassword(password),
    );
  }

  void testUserLogin() {
    state = state.copyWith(
      userName: "oguzhan1@gmail.com",
      password: "12345678",
    );
  }

  void resetStatus() {
    state = state.copyWith(
      status: AuthStatus.initial,
      failure: "",
    );
  }
}
