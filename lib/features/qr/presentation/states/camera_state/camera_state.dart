import 'package:camera/camera.dart';
import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:greenapp/core/models/user_data.dart';
import 'package:greenapp/features/qr/domain/models/image_scan_info.dart';
import 'package:greenapp/features/qr/domain/models/product_recycle.dart';
import 'package:greenapp/features/qr/domain/models/recycling_point.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

part 'camera_state.freezed.dart';

@freezed
class CameraState with _$CameraState {
  factory CameraState({
    required UserData userData,
    required List<CameraDescription> cameras,
    required CameraController? controller,
    required int selectedCamera,
    required MobileScannerController? mobileScannerController,
    required bool isInitialized,
    required bool qrAndImage,
    required String barcodeValue,
    required bool isScanned,
    required Uint8List? image,
    required bool isFlashOn,
    required bool isCameraOn,
    required String scannedInfo,
    required String scannedAndParsedInfo,
    required ImageScanInfo? imageScanInfo,
    required bool isQrScanned,
    required bool isRouting,
    required ProductRecycle? productRecycle,
    required List<RecyclingPoint>? recyclingPoints,
    required bool isAutamated,
  }) = _CameraState;

  factory CameraState.initial() => CameraState(
        userData: UserData.initial,
        controller: null,
        mobileScannerController: MobileScannerController(),
        cameras: [],
        selectedCamera: 0,
        isInitialized: false,
        qrAndImage: true,
        barcodeValue: '',
        isScanned: false,
        image: null,
        isFlashOn: false,
        isCameraOn: false,
        scannedInfo: '',
        scannedAndParsedInfo: '',
        imageScanInfo: null,
        isQrScanned: false,
        isRouting: false,
        productRecycle: null,
        recyclingPoints: [],
        isAutamated: false,
      );
}
