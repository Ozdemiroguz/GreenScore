import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/models/auth_epection.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  factory AuthState({
    required bool status,
    required User? user,
    required AuthException failure,
  }) = _AuthState;

  factory AuthState.initial() => AuthState(
        status: false,
        user: null,
        failure: AuthException(errorCode: "", errorMessage: ""),
      );

  const AuthState._();
}
