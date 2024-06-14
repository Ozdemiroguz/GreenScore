// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_recycle_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProductRecycleState {
  String? get productId => throw _privateConstructorUsedError;
  ProductRecycle? get productRecycle => throw _privateConstructorUsedError;
  UserData? get userData => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isDone => throw _privateConstructorUsedError;
  bool get isCanceled => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProductRecycleStateCopyWith<ProductRecycleState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductRecycleStateCopyWith<$Res> {
  factory $ProductRecycleStateCopyWith(
          ProductRecycleState value, $Res Function(ProductRecycleState) then) =
      _$ProductRecycleStateCopyWithImpl<$Res, ProductRecycleState>;
  @useResult
  $Res call(
      {String? productId,
      ProductRecycle? productRecycle,
      UserData? userData,
      bool isLoading,
      bool isDone,
      bool isCanceled});
}

/// @nodoc
class _$ProductRecycleStateCopyWithImpl<$Res, $Val extends ProductRecycleState>
    implements $ProductRecycleStateCopyWith<$Res> {
  _$ProductRecycleStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = freezed,
    Object? productRecycle = freezed,
    Object? userData = freezed,
    Object? isLoading = null,
    Object? isDone = null,
    Object? isCanceled = null,
  }) {
    return _then(_value.copyWith(
      productId: freezed == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String?,
      productRecycle: freezed == productRecycle
          ? _value.productRecycle
          : productRecycle // ignore: cast_nullable_to_non_nullable
              as ProductRecycle?,
      userData: freezed == userData
          ? _value.userData
          : userData // ignore: cast_nullable_to_non_nullable
              as UserData?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isDone: null == isDone
          ? _value.isDone
          : isDone // ignore: cast_nullable_to_non_nullable
              as bool,
      isCanceled: null == isCanceled
          ? _value.isCanceled
          : isCanceled // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductRecycleStateImplCopyWith<$Res>
    implements $ProductRecycleStateCopyWith<$Res> {
  factory _$$ProductRecycleStateImplCopyWith(_$ProductRecycleStateImpl value,
          $Res Function(_$ProductRecycleStateImpl) then) =
      __$$ProductRecycleStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? productId,
      ProductRecycle? productRecycle,
      UserData? userData,
      bool isLoading,
      bool isDone,
      bool isCanceled});
}

/// @nodoc
class __$$ProductRecycleStateImplCopyWithImpl<$Res>
    extends _$ProductRecycleStateCopyWithImpl<$Res, _$ProductRecycleStateImpl>
    implements _$$ProductRecycleStateImplCopyWith<$Res> {
  __$$ProductRecycleStateImplCopyWithImpl(_$ProductRecycleStateImpl _value,
      $Res Function(_$ProductRecycleStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = freezed,
    Object? productRecycle = freezed,
    Object? userData = freezed,
    Object? isLoading = null,
    Object? isDone = null,
    Object? isCanceled = null,
  }) {
    return _then(_$ProductRecycleStateImpl(
      productId: freezed == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String?,
      productRecycle: freezed == productRecycle
          ? _value.productRecycle
          : productRecycle // ignore: cast_nullable_to_non_nullable
              as ProductRecycle?,
      userData: freezed == userData
          ? _value.userData
          : userData // ignore: cast_nullable_to_non_nullable
              as UserData?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isDone: null == isDone
          ? _value.isDone
          : isDone // ignore: cast_nullable_to_non_nullable
              as bool,
      isCanceled: null == isCanceled
          ? _value.isCanceled
          : isCanceled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ProductRecycleStateImpl implements _ProductRecycleState {
  _$ProductRecycleStateImpl(
      {required this.productId,
      required this.productRecycle,
      required this.userData,
      required this.isLoading,
      required this.isDone,
      required this.isCanceled});

  @override
  final String? productId;
  @override
  final ProductRecycle? productRecycle;
  @override
  final UserData? userData;
  @override
  final bool isLoading;
  @override
  final bool isDone;
  @override
  final bool isCanceled;

  @override
  String toString() {
    return 'ProductRecycleState(productId: $productId, productRecycle: $productRecycle, userData: $userData, isLoading: $isLoading, isDone: $isDone, isCanceled: $isCanceled)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductRecycleStateImpl &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.productRecycle, productRecycle) ||
                other.productRecycle == productRecycle) &&
            (identical(other.userData, userData) ||
                other.userData == userData) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isDone, isDone) || other.isDone == isDone) &&
            (identical(other.isCanceled, isCanceled) ||
                other.isCanceled == isCanceled));
  }

  @override
  int get hashCode => Object.hash(runtimeType, productId, productRecycle,
      userData, isLoading, isDone, isCanceled);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductRecycleStateImplCopyWith<_$ProductRecycleStateImpl> get copyWith =>
      __$$ProductRecycleStateImplCopyWithImpl<_$ProductRecycleStateImpl>(
          this, _$identity);
}

abstract class _ProductRecycleState implements ProductRecycleState {
  factory _ProductRecycleState(
      {required final String? productId,
      required final ProductRecycle? productRecycle,
      required final UserData? userData,
      required final bool isLoading,
      required final bool isDone,
      required final bool isCanceled}) = _$ProductRecycleStateImpl;

  @override
  String? get productId;
  @override
  ProductRecycle? get productRecycle;
  @override
  UserData? get userData;
  @override
  bool get isLoading;
  @override
  bool get isDone;
  @override
  bool get isCanceled;
  @override
  @JsonKey(ignore: true)
  _$$ProductRecycleStateImplCopyWith<_$ProductRecycleStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
