import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/models/status.dart';
import '../../../../../core/models/validation_result.dart';

part 'register_state.freezed.dart';

@freezed
class RegisterState with _$RegisterState {
  factory RegisterState({
    required AuthStatus status,
    required String mail,
    required String name,
    required String surname,
    required String password,
    required String passwordCheck,
    required String failure,
    required ValidationResult mailFailure,
    required ValidationResult passwordFailure,
    required ValidationResult passwordCheckFailure,
  }) = _RegisterState;

  factory RegisterState.initial() => RegisterState(
        status: AuthStatus.initial,
        mail: "",
        password: "",
        passwordCheck: "",
        name: "",
        surname: "",
        failure: "",
        mailFailure: ValidationResult.error("Email cannot be empty."),
        passwordFailure: ValidationResult.error("Password cannot be empty."),
        passwordCheckFailure: ValidationResult.error("Passwords do not match."),
      );

  const RegisterState._();
}
