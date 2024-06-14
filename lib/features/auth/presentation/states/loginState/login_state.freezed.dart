// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LoginState {
  AuthStatus get status => throw _privateConstructorUsedError;
  String get userName => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get failure => throw _privateConstructorUsedError;
  ValidationResult get userNameFailure => throw _privateConstructorUsedError;
  ValidationResult get passwordFailure => throw _privateConstructorUsedError;
  bool get isPageVisible => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoginStateCopyWith<LoginState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginStateCopyWith<$Res> {
  factory $LoginStateCopyWith(
          LoginState value, $Res Function(LoginState) then) =
      _$LoginStateCopyWithImpl<$Res, LoginState>;
  @useResult
  $Res call(
      {AuthStatus status,
      String userName,
      String password,
      String failure,
      ValidationResult userNameFailure,
      ValidationResult passwordFailure,
      bool isPageVisible});
}

/// @nodoc
class _$LoginStateCopyWithImpl<$Res, $Val extends LoginState>
    implements $LoginStateCopyWith<$Res> {
  _$LoginStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? userName = null,
    Object? password = null,
    Object? failure = null,
    Object? userNameFailure = null,
    Object? passwordFailure = null,
    Object? isPageVisible = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AuthStatus,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      failure: null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as String,
      userNameFailure: null == userNameFailure
          ? _value.userNameFailure
          : userNameFailure // ignore: cast_nullable_to_non_nullable
              as ValidationResult,
      passwordFailure: null == passwordFailure
          ? _value.passwordFailure
          : passwordFailure // ignore: cast_nullable_to_non_nullable
              as ValidationResult,
      isPageVisible: null == isPageVisible
          ? _value.isPageVisible
          : isPageVisible // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoginStateImplCopyWith<$Res>
    implements $LoginStateCopyWith<$Res> {
  factory _$$LoginStateImplCopyWith(
          _$LoginStateImpl value, $Res Function(_$LoginStateImpl) then) =
      __$$LoginStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {AuthStatus status,
      String userName,
      String password,
      String failure,
      ValidationResult userNameFailure,
      ValidationResult passwordFailure,
      bool isPageVisible});
}

/// @nodoc
class __$$LoginStateImplCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res, _$LoginStateImpl>
    implements _$$LoginStateImplCopyWith<$Res> {
  __$$LoginStateImplCopyWithImpl(
      _$LoginStateImpl _value, $Res Function(_$LoginStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? userName = null,
    Object? password = null,
    Object? failure = null,
    Object? userNameFailure = null,
    Object? passwordFailure = null,
    Object? isPageVisible = null,
  }) {
    return _then(_$LoginStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AuthStatus,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      failure: null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as String,
      userNameFailure: null == userNameFailure
          ? _value.userNameFailure
          : userNameFailure // ignore: cast_nullable_to_non_nullable
              as ValidationResult,
      passwordFailure: null == passwordFailure
          ? _value.passwordFailure
          : passwordFailure // ignore: cast_nullable_to_non_nullable
              as ValidationResult,
      isPageVisible: null == isPageVisible
          ? _value.isPageVisible
          : isPageVisible // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$LoginStateImpl extends _LoginState {
  _$LoginStateImpl(
      {required this.status,
      required this.userName,
      required this.password,
      required this.failure,
      required this.userNameFailure,
      required this.passwordFailure,
      required this.isPageVisible})
      : super._();

  @override
  final AuthStatus status;
  @override
  final String userName;
  @override
  final String password;
  @override
  final String failure;
  @override
  final ValidationResult userNameFailure;
  @override
  final ValidationResult passwordFailure;
  @override
  final bool isPageVisible;

  @override
  String toString() {
    return 'LoginState(status: $status, userName: $userName, password: $password, failure: $failure, userNameFailure: $userNameFailure, passwordFailure: $passwordFailure, isPageVisible: $isPageVisible)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.failure, failure) || other.failure == failure) &&
            (identical(other.userNameFailure, userNameFailure) ||
                other.userNameFailure == userNameFailure) &&
            (identical(other.passwordFailure, passwordFailure) ||
                other.passwordFailure == passwordFailure) &&
            (identical(other.isPageVisible, isPageVisible) ||
                other.isPageVisible == isPageVisible));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, userName, password,
      failure, userNameFailure, passwordFailure, isPageVisible);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginStateImplCopyWith<_$LoginStateImpl> get copyWith =>
      __$$LoginStateImplCopyWithImpl<_$LoginStateImpl>(this, _$identity);
}

abstract class _LoginState extends LoginState {
  factory _LoginState(
      {required final AuthStatus status,
      required final String userName,
      required final String password,
      required final String failure,
      required final ValidationResult userNameFailure,
      required final ValidationResult passwordFailure,
      required final bool isPageVisible}) = _$LoginStateImpl;
  _LoginState._() : super._();

  @override
  AuthStatus get status;
  @override
  String get userName;
  @override
  String get password;
  @override
  String get failure;
  @override
  ValidationResult get userNameFailure;
  @override
  ValidationResult get passwordFailure;
  @override
  bool get isPageVisible;
  @override
  @JsonKey(ignore: true)
  _$$LoginStateImplCopyWith<_$LoginStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
