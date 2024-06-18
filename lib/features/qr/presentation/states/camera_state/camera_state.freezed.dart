// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'camera_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CameraState {
  UserData get userData => throw _privateConstructorUsedError;
  List<CameraDescription> get cameras => throw _privateConstructorUsedError;
  CameraController? get controller => throw _privateConstructorUsedError;
  int get selectedCamera => throw _privateConstructorUsedError;
  MobileScannerController? get mobileScannerController =>
      throw _privateConstructorUsedError;
  bool get isInitialized => throw _privateConstructorUsedError;
  bool get qrAndImage => throw _privateConstructorUsedError;
  String get barcodeValue => throw _privateConstructorUsedError;
  bool get isScanned => throw _privateConstructorUsedError;
  Uint8List? get image => throw _privateConstructorUsedError;
  bool get isFlashOn => throw _privateConstructorUsedError;
  bool get isCameraOn => throw _privateConstructorUsedError;
  String get scannedInfo => throw _privateConstructorUsedError;
  bool get isQrScanned => throw _privateConstructorUsedError;
  bool get isRouting => throw _privateConstructorUsedError;
  ProductRecycle? get productRecycle => throw _privateConstructorUsedError;
  List<RecyclingPoint>? get recyclingPoints =>
      throw _privateConstructorUsedError;
  bool get isAutamated => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CameraStateCopyWith<CameraState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CameraStateCopyWith<$Res> {
  factory $CameraStateCopyWith(
          CameraState value, $Res Function(CameraState) then) =
      _$CameraStateCopyWithImpl<$Res, CameraState>;
  @useResult
  $Res call(
      {UserData userData,
      List<CameraDescription> cameras,
      CameraController? controller,
      int selectedCamera,
      MobileScannerController? mobileScannerController,
      bool isInitialized,
      bool qrAndImage,
      String barcodeValue,
      bool isScanned,
      Uint8List? image,
      bool isFlashOn,
      bool isCameraOn,
      String scannedInfo,
      bool isQrScanned,
      bool isRouting,
      ProductRecycle? productRecycle,
      List<RecyclingPoint>? recyclingPoints,
      bool isAutamated});
}

/// @nodoc
class _$CameraStateCopyWithImpl<$Res, $Val extends CameraState>
    implements $CameraStateCopyWith<$Res> {
  _$CameraStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userData = null,
    Object? cameras = null,
    Object? controller = freezed,
    Object? selectedCamera = null,
    Object? mobileScannerController = freezed,
    Object? isInitialized = null,
    Object? qrAndImage = null,
    Object? barcodeValue = null,
    Object? isScanned = null,
    Object? image = freezed,
    Object? isFlashOn = null,
    Object? isCameraOn = null,
    Object? scannedInfo = null,
    Object? isQrScanned = null,
    Object? isRouting = null,
    Object? productRecycle = freezed,
    Object? recyclingPoints = freezed,
    Object? isAutamated = null,
  }) {
    return _then(_value.copyWith(
      userData: null == userData
          ? _value.userData
          : userData // ignore: cast_nullable_to_non_nullable
              as UserData,
      cameras: null == cameras
          ? _value.cameras
          : cameras // ignore: cast_nullable_to_non_nullable
              as List<CameraDescription>,
      controller: freezed == controller
          ? _value.controller
          : controller // ignore: cast_nullable_to_non_nullable
              as CameraController?,
      selectedCamera: null == selectedCamera
          ? _value.selectedCamera
          : selectedCamera // ignore: cast_nullable_to_non_nullable
              as int,
      mobileScannerController: freezed == mobileScannerController
          ? _value.mobileScannerController
          : mobileScannerController // ignore: cast_nullable_to_non_nullable
              as MobileScannerController?,
      isInitialized: null == isInitialized
          ? _value.isInitialized
          : isInitialized // ignore: cast_nullable_to_non_nullable
              as bool,
      qrAndImage: null == qrAndImage
          ? _value.qrAndImage
          : qrAndImage // ignore: cast_nullable_to_non_nullable
              as bool,
      barcodeValue: null == barcodeValue
          ? _value.barcodeValue
          : barcodeValue // ignore: cast_nullable_to_non_nullable
              as String,
      isScanned: null == isScanned
          ? _value.isScanned
          : isScanned // ignore: cast_nullable_to_non_nullable
              as bool,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
      isFlashOn: null == isFlashOn
          ? _value.isFlashOn
          : isFlashOn // ignore: cast_nullable_to_non_nullable
              as bool,
      isCameraOn: null == isCameraOn
          ? _value.isCameraOn
          : isCameraOn // ignore: cast_nullable_to_non_nullable
              as bool,
      scannedInfo: null == scannedInfo
          ? _value.scannedInfo
          : scannedInfo // ignore: cast_nullable_to_non_nullable
              as String,
      isQrScanned: null == isQrScanned
          ? _value.isQrScanned
          : isQrScanned // ignore: cast_nullable_to_non_nullable
              as bool,
      isRouting: null == isRouting
          ? _value.isRouting
          : isRouting // ignore: cast_nullable_to_non_nullable
              as bool,
      productRecycle: freezed == productRecycle
          ? _value.productRecycle
          : productRecycle // ignore: cast_nullable_to_non_nullable
              as ProductRecycle?,
      recyclingPoints: freezed == recyclingPoints
          ? _value.recyclingPoints
          : recyclingPoints // ignore: cast_nullable_to_non_nullable
              as List<RecyclingPoint>?,
      isAutamated: null == isAutamated
          ? _value.isAutamated
          : isAutamated // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CameraStateImplCopyWith<$Res>
    implements $CameraStateCopyWith<$Res> {
  factory _$$CameraStateImplCopyWith(
          _$CameraStateImpl value, $Res Function(_$CameraStateImpl) then) =
      __$$CameraStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {UserData userData,
      List<CameraDescription> cameras,
      CameraController? controller,
      int selectedCamera,
      MobileScannerController? mobileScannerController,
      bool isInitialized,
      bool qrAndImage,
      String barcodeValue,
      bool isScanned,
      Uint8List? image,
      bool isFlashOn,
      bool isCameraOn,
      String scannedInfo,
      bool isQrScanned,
      bool isRouting,
      ProductRecycle? productRecycle,
      List<RecyclingPoint>? recyclingPoints,
      bool isAutamated});
}

/// @nodoc
class __$$CameraStateImplCopyWithImpl<$Res>
    extends _$CameraStateCopyWithImpl<$Res, _$CameraStateImpl>
    implements _$$CameraStateImplCopyWith<$Res> {
  __$$CameraStateImplCopyWithImpl(
      _$CameraStateImpl _value, $Res Function(_$CameraStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userData = null,
    Object? cameras = null,
    Object? controller = freezed,
    Object? selectedCamera = null,
    Object? mobileScannerController = freezed,
    Object? isInitialized = null,
    Object? qrAndImage = null,
    Object? barcodeValue = null,
    Object? isScanned = null,
    Object? image = freezed,
    Object? isFlashOn = null,
    Object? isCameraOn = null,
    Object? scannedInfo = null,
    Object? isQrScanned = null,
    Object? isRouting = null,
    Object? productRecycle = freezed,
    Object? recyclingPoints = freezed,
    Object? isAutamated = null,
  }) {
    return _then(_$CameraStateImpl(
      userData: null == userData
          ? _value.userData
          : userData // ignore: cast_nullable_to_non_nullable
              as UserData,
      cameras: null == cameras
          ? _value._cameras
          : cameras // ignore: cast_nullable_to_non_nullable
              as List<CameraDescription>,
      controller: freezed == controller
          ? _value.controller
          : controller // ignore: cast_nullable_to_non_nullable
              as CameraController?,
      selectedCamera: null == selectedCamera
          ? _value.selectedCamera
          : selectedCamera // ignore: cast_nullable_to_non_nullable
              as int,
      mobileScannerController: freezed == mobileScannerController
          ? _value.mobileScannerController
          : mobileScannerController // ignore: cast_nullable_to_non_nullable
              as MobileScannerController?,
      isInitialized: null == isInitialized
          ? _value.isInitialized
          : isInitialized // ignore: cast_nullable_to_non_nullable
              as bool,
      qrAndImage: null == qrAndImage
          ? _value.qrAndImage
          : qrAndImage // ignore: cast_nullable_to_non_nullable
              as bool,
      barcodeValue: null == barcodeValue
          ? _value.barcodeValue
          : barcodeValue // ignore: cast_nullable_to_non_nullable
              as String,
      isScanned: null == isScanned
          ? _value.isScanned
          : isScanned // ignore: cast_nullable_to_non_nullable
              as bool,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
      isFlashOn: null == isFlashOn
          ? _value.isFlashOn
          : isFlashOn // ignore: cast_nullable_to_non_nullable
              as bool,
      isCameraOn: null == isCameraOn
          ? _value.isCameraOn
          : isCameraOn // ignore: cast_nullable_to_non_nullable
              as bool,
      scannedInfo: null == scannedInfo
          ? _value.scannedInfo
          : scannedInfo // ignore: cast_nullable_to_non_nullable
              as String,
      isQrScanned: null == isQrScanned
          ? _value.isQrScanned
          : isQrScanned // ignore: cast_nullable_to_non_nullable
              as bool,
      isRouting: null == isRouting
          ? _value.isRouting
          : isRouting // ignore: cast_nullable_to_non_nullable
              as bool,
      productRecycle: freezed == productRecycle
          ? _value.productRecycle
          : productRecycle // ignore: cast_nullable_to_non_nullable
              as ProductRecycle?,
      recyclingPoints: freezed == recyclingPoints
          ? _value._recyclingPoints
          : recyclingPoints // ignore: cast_nullable_to_non_nullable
              as List<RecyclingPoint>?,
      isAutamated: null == isAutamated
          ? _value.isAutamated
          : isAutamated // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$CameraStateImpl implements _CameraState {
  _$CameraStateImpl(
      {required this.userData,
      required final List<CameraDescription> cameras,
      required this.controller,
      required this.selectedCamera,
      required this.mobileScannerController,
      required this.isInitialized,
      required this.qrAndImage,
      required this.barcodeValue,
      required this.isScanned,
      required this.image,
      required this.isFlashOn,
      required this.isCameraOn,
      required this.scannedInfo,
      required this.isQrScanned,
      required this.isRouting,
      required this.productRecycle,
      required final List<RecyclingPoint>? recyclingPoints,
      required this.isAutamated})
      : _cameras = cameras,
        _recyclingPoints = recyclingPoints;

  @override
  final UserData userData;
  final List<CameraDescription> _cameras;
  @override
  List<CameraDescription> get cameras {
    if (_cameras is EqualUnmodifiableListView) return _cameras;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cameras);
  }

  @override
  final CameraController? controller;
  @override
  final int selectedCamera;
  @override
  final MobileScannerController? mobileScannerController;
  @override
  final bool isInitialized;
  @override
  final bool qrAndImage;
  @override
  final String barcodeValue;
  @override
  final bool isScanned;
  @override
  final Uint8List? image;
  @override
  final bool isFlashOn;
  @override
  final bool isCameraOn;
  @override
  final String scannedInfo;
  @override
  final bool isQrScanned;
  @override
  final bool isRouting;
  @override
  final ProductRecycle? productRecycle;
  final List<RecyclingPoint>? _recyclingPoints;
  @override
  List<RecyclingPoint>? get recyclingPoints {
    final value = _recyclingPoints;
    if (value == null) return null;
    if (_recyclingPoints is EqualUnmodifiableListView) return _recyclingPoints;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final bool isAutamated;

  @override
  String toString() {
    return 'CameraState(userData: $userData, cameras: $cameras, controller: $controller, selectedCamera: $selectedCamera, mobileScannerController: $mobileScannerController, isInitialized: $isInitialized, qrAndImage: $qrAndImage, barcodeValue: $barcodeValue, isScanned: $isScanned, image: $image, isFlashOn: $isFlashOn, isCameraOn: $isCameraOn, scannedInfo: $scannedInfo, isQrScanned: $isQrScanned, isRouting: $isRouting, productRecycle: $productRecycle, recyclingPoints: $recyclingPoints, isAutamated: $isAutamated)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CameraStateImpl &&
            (identical(other.userData, userData) ||
                other.userData == userData) &&
            const DeepCollectionEquality().equals(other._cameras, _cameras) &&
            (identical(other.controller, controller) ||
                other.controller == controller) &&
            (identical(other.selectedCamera, selectedCamera) ||
                other.selectedCamera == selectedCamera) &&
            (identical(
                    other.mobileScannerController, mobileScannerController) ||
                other.mobileScannerController == mobileScannerController) &&
            (identical(other.isInitialized, isInitialized) ||
                other.isInitialized == isInitialized) &&
            (identical(other.qrAndImage, qrAndImage) ||
                other.qrAndImage == qrAndImage) &&
            (identical(other.barcodeValue, barcodeValue) ||
                other.barcodeValue == barcodeValue) &&
            (identical(other.isScanned, isScanned) ||
                other.isScanned == isScanned) &&
            const DeepCollectionEquality().equals(other.image, image) &&
            (identical(other.isFlashOn, isFlashOn) ||
                other.isFlashOn == isFlashOn) &&
            (identical(other.isCameraOn, isCameraOn) ||
                other.isCameraOn == isCameraOn) &&
            (identical(other.scannedInfo, scannedInfo) ||
                other.scannedInfo == scannedInfo) &&
            (identical(other.isQrScanned, isQrScanned) ||
                other.isQrScanned == isQrScanned) &&
            (identical(other.isRouting, isRouting) ||
                other.isRouting == isRouting) &&
            (identical(other.productRecycle, productRecycle) ||
                other.productRecycle == productRecycle) &&
            const DeepCollectionEquality()
                .equals(other._recyclingPoints, _recyclingPoints) &&
            (identical(other.isAutamated, isAutamated) ||
                other.isAutamated == isAutamated));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      userData,
      const DeepCollectionEquality().hash(_cameras),
      controller,
      selectedCamera,
      mobileScannerController,
      isInitialized,
      qrAndImage,
      barcodeValue,
      isScanned,
      const DeepCollectionEquality().hash(image),
      isFlashOn,
      isCameraOn,
      scannedInfo,
      isQrScanned,
      isRouting,
      productRecycle,
      const DeepCollectionEquality().hash(_recyclingPoints),
      isAutamated);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CameraStateImplCopyWith<_$CameraStateImpl> get copyWith =>
      __$$CameraStateImplCopyWithImpl<_$CameraStateImpl>(this, _$identity);
}

abstract class _CameraState implements CameraState {
  factory _CameraState(
      {required final UserData userData,
      required final List<CameraDescription> cameras,
      required final CameraController? controller,
      required final int selectedCamera,
      required final MobileScannerController? mobileScannerController,
      required final bool isInitialized,
      required final bool qrAndImage,
      required final String barcodeValue,
      required final bool isScanned,
      required final Uint8List? image,
      required final bool isFlashOn,
      required final bool isCameraOn,
      required final String scannedInfo,
      required final bool isQrScanned,
      required final bool isRouting,
      required final ProductRecycle? productRecycle,
      required final List<RecyclingPoint>? recyclingPoints,
      required final bool isAutamated}) = _$CameraStateImpl;

  @override
  UserData get userData;
  @override
  List<CameraDescription> get cameras;
  @override
  CameraController? get controller;
  @override
  int get selectedCamera;
  @override
  MobileScannerController? get mobileScannerController;
  @override
  bool get isInitialized;
  @override
  bool get qrAndImage;
  @override
  String get barcodeValue;
  @override
  bool get isScanned;
  @override
  Uint8List? get image;
  @override
  bool get isFlashOn;
  @override
  bool get isCameraOn;
  @override
  String get scannedInfo;
  @override
  bool get isQrScanned;
  @override
  bool get isRouting;
  @override
  ProductRecycle? get productRecycle;
  @override
  List<RecyclingPoint>? get recyclingPoints;
  @override
  bool get isAutamated;
  @override
  @JsonKey(ignore: true)
  _$$CameraStateImplCopyWith<_$CameraStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
