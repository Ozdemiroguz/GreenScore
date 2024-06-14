// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UserState {
  List<UserData>? get leaderBordUsers => throw _privateConstructorUsedError;
  UserData? get currentUserData => throw _privateConstructorUsedError;
  List<UserData>? get users => throw _privateConstructorUsedError;
  List<AppImage>? get appImages => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserStateCopyWith<UserState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserStateCopyWith<$Res> {
  factory $UserStateCopyWith(UserState value, $Res Function(UserState) then) =
      _$UserStateCopyWithImpl<$Res, UserState>;
  @useResult
  $Res call(
      {List<UserData>? leaderBordUsers,
      UserData? currentUserData,
      List<UserData>? users,
      List<AppImage>? appImages});
}

/// @nodoc
class _$UserStateCopyWithImpl<$Res, $Val extends UserState>
    implements $UserStateCopyWith<$Res> {
  _$UserStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? leaderBordUsers = freezed,
    Object? currentUserData = freezed,
    Object? users = freezed,
    Object? appImages = freezed,
  }) {
    return _then(_value.copyWith(
      leaderBordUsers: freezed == leaderBordUsers
          ? _value.leaderBordUsers
          : leaderBordUsers // ignore: cast_nullable_to_non_nullable
              as List<UserData>?,
      currentUserData: freezed == currentUserData
          ? _value.currentUserData
          : currentUserData // ignore: cast_nullable_to_non_nullable
              as UserData?,
      users: freezed == users
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as List<UserData>?,
      appImages: freezed == appImages
          ? _value.appImages
          : appImages // ignore: cast_nullable_to_non_nullable
              as List<AppImage>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserStateImplCopyWith<$Res>
    implements $UserStateCopyWith<$Res> {
  factory _$$UserStateImplCopyWith(
          _$UserStateImpl value, $Res Function(_$UserStateImpl) then) =
      __$$UserStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<UserData>? leaderBordUsers,
      UserData? currentUserData,
      List<UserData>? users,
      List<AppImage>? appImages});
}

/// @nodoc
class __$$UserStateImplCopyWithImpl<$Res>
    extends _$UserStateCopyWithImpl<$Res, _$UserStateImpl>
    implements _$$UserStateImplCopyWith<$Res> {
  __$$UserStateImplCopyWithImpl(
      _$UserStateImpl _value, $Res Function(_$UserStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? leaderBordUsers = freezed,
    Object? currentUserData = freezed,
    Object? users = freezed,
    Object? appImages = freezed,
  }) {
    return _then(_$UserStateImpl(
      leaderBordUsers: freezed == leaderBordUsers
          ? _value._leaderBordUsers
          : leaderBordUsers // ignore: cast_nullable_to_non_nullable
              as List<UserData>?,
      currentUserData: freezed == currentUserData
          ? _value.currentUserData
          : currentUserData // ignore: cast_nullable_to_non_nullable
              as UserData?,
      users: freezed == users
          ? _value._users
          : users // ignore: cast_nullable_to_non_nullable
              as List<UserData>?,
      appImages: freezed == appImages
          ? _value._appImages
          : appImages // ignore: cast_nullable_to_non_nullable
              as List<AppImage>?,
    ));
  }
}

/// @nodoc

class _$UserStateImpl implements _UserState {
  _$UserStateImpl(
      {final List<UserData>? leaderBordUsers,
      this.currentUserData,
      final List<UserData>? users,
      final List<AppImage>? appImages})
      : _leaderBordUsers = leaderBordUsers,
        _users = users,
        _appImages = appImages;

  final List<UserData>? _leaderBordUsers;
  @override
  List<UserData>? get leaderBordUsers {
    final value = _leaderBordUsers;
    if (value == null) return null;
    if (_leaderBordUsers is EqualUnmodifiableListView) return _leaderBordUsers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final UserData? currentUserData;
  final List<UserData>? _users;
  @override
  List<UserData>? get users {
    final value = _users;
    if (value == null) return null;
    if (_users is EqualUnmodifiableListView) return _users;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<AppImage>? _appImages;
  @override
  List<AppImage>? get appImages {
    final value = _appImages;
    if (value == null) return null;
    if (_appImages is EqualUnmodifiableListView) return _appImages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'UserState(leaderBordUsers: $leaderBordUsers, currentUserData: $currentUserData, users: $users, appImages: $appImages)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserStateImpl &&
            const DeepCollectionEquality()
                .equals(other._leaderBordUsers, _leaderBordUsers) &&
            (identical(other.currentUserData, currentUserData) ||
                other.currentUserData == currentUserData) &&
            const DeepCollectionEquality().equals(other._users, _users) &&
            const DeepCollectionEquality()
                .equals(other._appImages, _appImages));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_leaderBordUsers),
      currentUserData,
      const DeepCollectionEquality().hash(_users),
      const DeepCollectionEquality().hash(_appImages));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserStateImplCopyWith<_$UserStateImpl> get copyWith =>
      __$$UserStateImplCopyWithImpl<_$UserStateImpl>(this, _$identity);
}

abstract class _UserState implements UserState {
  factory _UserState(
      {final List<UserData>? leaderBordUsers,
      final UserData? currentUserData,
      final List<UserData>? users,
      final List<AppImage>? appImages}) = _$UserStateImpl;

  @override
  List<UserData>? get leaderBordUsers;
  @override
  UserData? get currentUserData;
  @override
  List<UserData>? get users;
  @override
  List<AppImage>? get appImages;
  @override
  @JsonKey(ignore: true)
  _$$UserStateImplCopyWith<_$UserStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
