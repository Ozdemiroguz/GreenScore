import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/models/status.dart';
import '../../../../../core/models/validationResult.dart';

part 'login_state.freezed.dart';

@freezed
class LoginState with _$LoginState {
  factory LoginState({
    required AuthStatus status,
    required String userName,
    required String password,
    required String failure,
    required ValidationResult userNameFailure,
    required ValidationResult passwordFailure,
    required bool isPageVisible,
  }) = _LoginState;

  factory LoginState.initial() => LoginState(
        status: AuthStatus.initial,
        userName: "",
        password: "",
        failure: "",
        userNameFailure: ValidationResult.error("Email cannot be empty."),
        passwordFailure: ValidationResult.error("Password cannot be empty."),
        isPageVisible: true,
      );

  const LoginState._();
}
