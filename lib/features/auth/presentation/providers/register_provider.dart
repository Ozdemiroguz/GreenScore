import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/injections/locator.dart';
import '../../../../core/models/auth_epection.dart';
import '../../../../core/models/status.dart';
import '../../../../core/models/user_data.dart';
import '../../../../utils/validators/validators.dart';
import '../states/registerState/register_state.dart';

final registerProvider =
    NotifierProvider.autoDispose<_RegisterNotifier, RegisterState>(
        _RegisterNotifier.new);

class _RegisterNotifier extends AutoDisposeNotifier<RegisterState> {
  @override
  RegisterState build() {
    return RegisterState.initial();
  }

  Future<void> register() async {
    state = state.copyWith(status: AuthStatus.loading);
    try {
      await ref
          .read(authRepositoryProvider)
          .signUpWithEmailAndPassword(state.mail, state.password);
      await ref.read(authRepositoryProvider).addUserInfo(
            UserData(
              id: FirebaseAuth.instance.currentUser!.uid,
              name: state.name,
              surname: state.surname,
              email: state.mail,
              balance: 0,
              naturePoint: 0,
              savedCo2: 0,
              profileImage: "",
              bag: [],
              recycled: 0,
              phone: "",
            ),
          );

      state = state.copyWith(status: AuthStatus.authenticated);
    } on AuthException catch (e) {
      if (e.errorCode == "email-already-in-use") {
        state = state.copyWith(
          status: AuthStatus.error,
          failure: "Error: This email is already in use.",
        );
      }
      if (e.errorCode == "weak-password") {
        state = state.copyWith(
          status: AuthStatus.error,
          failure: "Error: Password is too weak.",
        );
      } else {
        state = state.copyWith(
          status: AuthStatus.error,
          failure: "Error: ${e.errorMessage}",
        );
        print(e.errorCode);
        print(e.errorMessage);
      }
    } catch (e) {
      state = state.copyWith(
        status: AuthStatus.error,
        failure: 'UnknownError: $e',
      );
    }
  }

  void onNameChanged(String name) {
    state = state.copyWith(
      name: name,
    );
  }

  void onSurnameChanged(String surname) {
    state = state.copyWith(
      surname: surname,
    );
  }

  void onEmailChanged(String mail) {
    state = state.copyWith(
      mail: mail,
      mailFailure: validateEmail(mail),
    );
  }

  void onPasswordChanged(String password) {
    state = state.copyWith(
      password: password,
      passwordFailure: validatePassword(password),
    );
  }

  void onPasswordCheckChanged(String passwordCheck) {
    state = state.copyWith(
      passwordCheck: passwordCheck,
      passwordCheckFailure:
          validatePasswordCheck(state.password, passwordCheck),
    );
  }

  void resetStatus() {
    state = state.copyWith(
      status: AuthStatus.initial,
      failure: "",
    );
  }
}
