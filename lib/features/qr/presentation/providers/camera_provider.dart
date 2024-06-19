import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:camera/camera.dart';
import 'package:greenapp/core/injections/locator.dart';
import 'package:greenapp/features/qr/presentation/pages/qr_page.dart';
import 'package:greenapp/services/user_service/user_service_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../../domain/models/image_scan_info.dart';
import '../../domain/models/recycling_point.dart';
import '../states/camera_state/camera_state.dart';

final cameraProvider =
    NotifierProvider.autoDispose<_CameraNotifier, CameraState>(
        _CameraNotifier.new);

final class _CameraNotifier extends AutoDisposeNotifier<CameraState> {
  @override
  CameraState build() {
    Future(() => init());
    return CameraState.initial();
  }

  Future<void> init() async {
    state = state.copyWith(isInitialized: false, isCameraOn: false);
    final cameras = await availableCameras();
    if (cameras.isNotEmpty) {
      final controller = CameraController(cameras.first, ResolutionPreset.high);

      await controller.initialize();
      state = state.copyWith(
        cameras: cameras,
        controller: controller,
      );
    } else {
      state = state.copyWith(cameras: cameras);
    }
    MobileScannerController mobileScannerController = MobileScannerController(
      returnImage: true,
      detectionSpeed: DetectionSpeed.normal,
      torchEnabled: false,
    );

    state = state.copyWith(
        mobileScannerController: mobileScannerController,
        isCameraOn: true,
        isInitialized: true,
        userData: ref.watch(userService));
  }

  Future<void> changeCamera() async {
    state = state.copyWith(isCameraOn: false);
    if (state.mobileScannerController!.value.isRunning) {
      state.mobileScannerController!.stop();
      state = state.copyWith(qrAndImage: false);
      if (state.isFlashOn) {
        toggleFlash();
      }
    } else {
      state.mobileScannerController!.start();
      state = state.copyWith(qrAndImage: true);
    }
    state = state.copyWith(isCameraOn: true);
  }

  Future<void> takingPicture() async {
    final XFile imageFile = await state.controller!.takePicture();
    final File file = File(imageFile.path);
    final Uint8List image = await file.readAsBytes();
    state = state.copyWith(image: image);
    scanImage();
  }

  Future<void> scanImage() async {
    String prompt =
        "Sen bir reycleApp image scan botusun döndürdüğün mesaj içinde sadece taranan resmin geri dönüşüme uygun olup olmadığını bool olarak rcycleboll olarak ,resmin bilgi verici bir ismini title olarak,resmin açıklamasını desc olarak  ,ve geri dönüşüm türünü category olarak sadece plastic,glass,metal,paper,cloth e-waste, ve other olacak şekilde  json formatında ingilizce olarak vereceksin mesjaj başka hiçbirşey içermeyecek  ";
    ref.read(geminiRepositoryProvider).getMessages(prompt, state.image!).listen(
      (event) {
        state = state.copyWith(scannedInfo: state.scannedInfo + event);
        if (state.scannedInfo.length > 10) {
          state = state.copyWith(
              scannedAndParsedInfo:
                  state.scannedInfo.substring(8, state.scannedInfo.length - 3));
          if (state.scannedAndParsedInfo.contains("}")) {
            final data = jsonDecode(state.scannedAndParsedInfo);
            state = state.copyWith(
              imageScanInfo: ImageScanInfo.fromJson(data),
            );
          }
        }
      },
    );

    state = state.copyWith(isScanned: true);
  }

  Future<void> resetScanImages() async {
    state = state.copyWith(
        scannedInfo: '', isScanned: false, image: null, imageScanInfo: null);
  }

  Future<void> resetScanQr() async {
    state = state.copyWith(
        isQrScanned: false, barcodeValue: '', productRecycle: null);
  }

  Future<void> setBarcodeValue(String barcodeValue) async {
    state = state.copyWith(
      barcodeValue: barcodeValue,
    );
  }

  Future<void> setImage(Uint8List image) async {
    state = state.copyWith(image: image);
  }

  Future<void> toggleFlash() async {
    if (state.qrAndImage) {
      state.mobileScannerController!.toggleTorch();
      state = state.copyWith(isFlashOn: !state.isFlashOn);
    } else {
      state.controller!
          .setFlashMode(state.isFlashOn ? FlashMode.off : FlashMode.torch);
      state = state.copyWith(isFlashOn: !state.isFlashOn);
    }
  }

  Future<void> toggleCamera() async {
    if (state.qrAndImage) {
      state.mobileScannerController!.switchCamera();
    } else {
      state.controller!.setDescription(
        state.cameras[state.selectedCamera == 0 ? 1 : 0],
      );
      state = state.copyWith(selectedCamera: state.selectedCamera == 0 ? 1 : 0);
    }
  }

  Future<void> setCameraOn() async {
    state = state.copyWith(isCameraOn: !state.isCameraOn);
  }

  Future<void> setIsQrScanned(bool isQrScanned) async {
    state = state.copyWith(isQrScanned: isQrScanned);
  }

  Future<void> setIsRouting(bool isRouting) async {
    state = state.copyWith(isRouting: isRouting);
  }

  Future<void> setProductRecycle() async {
    try {
      final productRecycle = await ref
          .read(prodcuctRepositoryProvider)
          .getProduct(state.barcodeValue);
      state = state.copyWith(productRecycle: productRecycle);
      ref.read(currentCategoryProvivder.notifier).state =
          productRecycle!.category;

      setIsQrScanned(true);
    } catch (e) {
      print('An error occurred while getting the product: $e');
    }
  }

  Future<void> setProductRecycleNull() async {
    state = state.copyWith(productRecycle: null);
  }

  Future<void> setRecyclingPoints() async {
    // print("currentLocation: $currentLocation");
    try {
      final tempdata = await ref
          .read(prodcuctRepositoryProvider)
          .getRecyclingPoints(ref.read(currentCategoryProvivder.notifier).state,
              state.userData.location!);
      List<RecyclingPoint> recyclingPoints = [];

      for (var element in tempdata) {
        if (element.categories.contains(state.productRecycle?.category)) {
          recyclingPoints.add(element);
        }
      }
      state = state.copyWith(recyclingPoints: recyclingPoints);
    } catch (e) {
      print(' An error occurred while getting the recycling points: $e');
    }
  }

  Future<void> setAutomated(bool isAutomated) async {
    state = state.copyWith(isAutamated: isAutomated);
  }

  Future<void> dispose() async {
    state.controller?.dispose();
    state.mobileScannerController?.dispose();
  }
}
