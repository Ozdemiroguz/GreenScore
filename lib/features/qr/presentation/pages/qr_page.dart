import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greenapp/constants/colors.dart';
import 'package:greenapp/customs/custom_button.dart';
import 'package:greenapp/customs/custom_map.dart';
import 'package:greenapp/features/qr/presentation/providers/camera_provider.dart';
import 'package:greenapp/router/router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qr_scanner_overlay/qr_scanner_overlay.dart';
import 'package:camera/camera.dart';

import '../../../../main.dart';
import '../../../map/presentation/providers/map_provider.dart';

final currentLocationProvider =
    StateProvider<LatLng>((ref) => const LatLng(39.782499, 30.510203));
final currentCategoryProvivder = StateProvider<String>((ref) => '');

GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

@RoutePage()
class QrPage extends StatefulHookConsumerWidget {
  const QrPage({super.key});
  @override
  _QrPageState createState() => _QrPageState();
}

class _QrPageState extends ConsumerState<QrPage> with WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(cameraProvider);

    return PopScope(
      onPopInvoked: (didPop) => {
        if (didPop) {state.mobileScannerController!.dispose()}
      },
      child: Scaffold(
        body: Stack(
          children: [
            state.isCameraOn
                ? Column(
                    children: [
                      !state.qrAndImage
                          ? Expanded(
                              child: CameraPreview(state.controller!),
                            )
                          : state.isQrScanned
                              ? _QrScannedImage()
                              : Expanded(
                                  child: MobileScanner(
                                    controller: state.mobileScannerController!,
                                    onDetect: (capture) {
                                      onDetect(capture,
                                          state.mobileScannerController!);
                                    },
                                  ),
                                ),
                    ],
                  )
                : const Center(
                    child: Text("Camera is not available"),
                  ),
            Padding(
              padding:
                  EdgeInsets.only(bottom: state.isQrScanned ? 250.h : 150.h),
              child: QRScannerOverlay(
                borderColor: primary,
                overlayColor: Colors.grey.withOpacity(0.4),
                scanAreaSize:
                    state.isQrScanned ? Size(300.w, 400.h) : Size(300.r, 500.r),
              ),
            ),
          ],
        ),
        bottomSheet: _BottomSheetPart(),
      ),
    );
  }

  Future<void> onDetect(BarcodeCapture capture,
      MobileScannerController mobileScannerController) async {
    final state = ref.watch(cameraProvider);
    if (state.productRecycle != null) {
      return;
    }

    String barcodeValue = "";
    final List<Barcode> barcodes = capture.barcodes;
    for (Barcode barcode in barcodes) {
      barcodeValue += barcode.rawValue.toString();
    }
    if (barcodeValue.contains("automatId")) {
      barcodeValue = barcodeValue.substring(9, barcodeValue.length);
      ref.read(cameraProvider.notifier).setBarcodeValue(barcodeValue);
      ref.read(cameraProvider.notifier).setAutomated(true);

      return;
    }

    ref.read(cameraProvider.notifier).setBarcodeValue(barcodeValue);
    await ref.read(cameraProvider.notifier).setProductRecycle();
    await ref.read(cameraProvider.notifier).setRecyclingPoints();
  }
}

class _BottomSheetPart extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(cameraProvider);
    return BottomSheet(
      constraints: BoxConstraints(
          minHeight: 200.h,
          maxHeight: state.isScanned
              ? 400.h
              : state.isQrScanned
                  ? 330.h
                  : 200.h),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12.r),
          topRight: Radius.circular(12.r),
        ),
      ),
      backgroundColor: white,
      shadowColor: black,
      elevation: 10,
      enableDrag: false,
      showDragHandle: false,
      onClosing: () {
        print("Bottom Sheet Closed");
      },
      builder: (context) {
        return state.isScanned
            ? _ImageScanndInfo()
            : state.isQrScanned
                ? _QrScannedInfo()
                : state.isAutamated
                    ? _AutomatedRecyclingPoints()
                    : Row(
                        children: [_QrOrCamera(), _UploadImageButton()],
                      );
      },
    );
  }
}

class _QrOrCamera extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(cameraProvider);

    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _QrOrCameraToggle(
                    buttonText: "Qr Scanner", qrAndImage: state.qrAndImage),
                _QrOrCameraToggle(
                    buttonText: "Image Scanner", qrAndImage: !state.qrAndImage),
              ],
            ),
            !ref.read(cameraProvider).qrAndImage
                ? _CameraTools()
                : IconButton(
                    onPressed: () {
                      ref.read(cameraProvider.notifier).changeCamera();
                    },
                    icon: const Icon(Icons.flash_on),
                    iconSize: 32.0,
                    color: white,
                  ),
          ],
        ),
      ),
    );
  }
}

class _UploadImageButton extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 50.w,
        height: 220.h,
        decoration: BoxDecoration(
          color: primary,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(12.r),
          ),
        ),
        child: Icon(
          Icons.upload_file,
          color: white,
        ),
      ),
    );
  }
}

class _QrOrCameraToggle extends ConsumerWidget {
  final String buttonText;
  final bool qrAndImage;

  const _QrOrCameraToggle({
    required this.buttonText,
    required this.qrAndImage,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        if (!qrAndImage) {
          ref.read(cameraProvider.notifier).changeCamera();
        }
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border(
              bottom:
                  BorderSide(color: qrAndImage ? primary : gray, width: 2.w)),
        ),
        child: Text(buttonText,
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: qrAndImage ? primary : gray,
                )),
      ),
    );
  }
}

class _CameraTools extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final state = ref.watch(cameraProvider);
    return Padding(
        padding: const EdgeInsets.only(
          top: 50,
          left: 20,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                ref.read(cameraProvider.notifier).toggleCamera();
              },
              icon: Icon(Icons.flip_camera_ios),
              iconSize: 32.0,
              color: primary,
            ),
            SizedBox(width: 20.w), //TODO: Add a space between the buttons
            IconButton(
              onPressed: () {
                ref.read(cameraProvider.notifier).takingPicture();
              },
              icon: Icon(Icons.camera_alt_outlined),
              iconSize: 64.0,
              color: primary,
            ),
            SizedBox(width: 20.w), //TODO: Add a space between the buttons
            IconButton(
              onPressed: () {
                ref.read(cameraProvider.notifier).toggleFlash();
              },
              icon: Icon(Icons.flash_on),
              iconSize: 32.0,
              color: primary,
            ),
          ],
        ));
  }
}

class _ImageScanndInfo extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(cameraProvider);
    return Column(
      children: [
        Text("Scanned Image Descp: ${state.scannedInfo}"),
        IconButton(
            onPressed: () {
              ref.read(cameraProvider.notifier).resetScanImages();
            },
            icon: Icon(Icons.refresh_sharp))
      ],
    );
  }
}

class _QrScannedInfo extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(cameraProvider);
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.w),
      child: state.productRecycle == null
          ? const CircularProgressIndicator.adaptive()
          : Column(
              children: [
                Row(
                  children: [
                    Text(
                      state.productRecycle!.name,
                      style: Theme.of(context).textTheme.displayLarge!.copyWith(
                          fontSize: 30.sp, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 4.h,
                    ),
                    SizedBox(
                        height: 25.h,
                        width: 25.h,
                        child: Image.asset("assets/images/recyclelogo.png")),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        ref.watch(cameraProvider.notifier).resetScanQr();
                      },
                      child: Icon(
                        Icons.refresh,
                        size: 32.r,
                      ),
                    )
                  ],
                ),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 28.h),
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey),
                      borderRadius: BorderRadius.all(Radius.circular(16.r))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _QrInfoLabel(
                          title: "Material",
                          value: state.productRecycle!.category),
                      _QrInfoLabel(
                        value:
                            '${state.productRecycle!.savedCo2.toStringAsFixed(0)}g',
                        titleWidget: Text.rich(TextSpan(
                            text: "Saved Co",
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall!
                                .copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                            children: [
                              TextSpan(
                                  text: "2", style: TextStyle(fontSize: 7.sp))
                            ])),
                      ),
                      _QrInfoLabel(
                        value: state.productRecycle!.nature_point
                            .toStringAsFixed(0),
                        title: "Nature Point",
                      ),
                      _QrInfoLabel(
                          title: "Refund",
                          value: '${state.productRecycle!.refund.toString()}€')
                    ],
                  ),
                ),
                _RecyclingPointsPart(),
              ],
            ),
    );
  }
}

class _QrInfoLabel extends ConsumerWidget {
  final String? title;
  final Widget? titleWidget;
  final String value;

  _QrInfoLabel({
    this.title,
    required this.value,
    this.titleWidget,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(cameraProvider);
    return Column(
      children: [
        titleWidget ??
            Text(
              title!,
              style: Theme.of(context).textTheme.labelSmall!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
        SizedBox(
          height: 8.h,
        ),
        Text(
          value,
          style: Theme.of(context)
              .textTheme
              .displayMedium!
              .copyWith(fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}

class _RecyclingPointsPart extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(cameraProvider);
    return SizedBox(
      width: double.infinity,
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          // Build your list item here
          return GestureDetector(
            onTap: () {
              currentlocation = state.recyclingPoints![index].location;
              ref.read(currentLocationProvider.notifier).state =
                  state.recyclingPoints![index].location;
              ref.read(currentCategoryProvivder.notifier).state =
                  state.productRecycle!.category;
              ref.read(mapProvider.notifier).init();
              context.router.replaceAll([
                MapRoute(),
              ]);
            },
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                vertical: 12.h,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
              ),
              margin: EdgeInsets.symmetric(
                vertical: 8.h,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _MapView(
                    location: state.recyclingPoints![index].location,
                  ),
                  SizedBox(
                    width: 200.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(state.recyclingPoints![index].title,
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge!
                                .copyWith(fontSize: 22.sp, color: black)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          // Build your separator here
          return SizedBox(height: 0.h);
        },
        itemCount: state.recyclingPoints!.length,
      ),
    );
    // Column(
    //   children: state.recyclingPoints!
    //       .map((e) => GestureDetector(
    //             onTap: () {
    //               currentlocation = e.location;

    //               ref.read(currentLocationProvider.notifier).state = e.location;

    //               ref.read(currentCategoryProvivder.notifier).state =
    //                   state.productRecycle!.category;
    //               ref.read(mapProvider.notifier).init();

    //               context.router.replaceAll([
    //                 MapRoute(),
    //               ]);
    //             },
    //             child: Container(
    //               padding: EdgeInsets.symmetric(
    //                 vertical: 12.h,
    //               ),
    //               decoration: BoxDecoration(
    //                 color: gray.withOpacity(0.2),
    //                 borderRadius: BorderRadius.circular(12.r),
    //               ),
    //               margin: EdgeInsets.symmetric(
    //                 vertical: 8.h,
    //               ),
    //               child: Row(
    //                 crossAxisAlignment: CrossAxisAlignment.center,
    //                 children: [
    //                   Icon(Icons.location_on, color: Colors.blue, size: 36.r),
    //                   Column(
    //                     crossAxisAlignment: CrossAxisAlignment.start,
    //                     children: [
    //                       Text(e.title,
    //                           style: Theme.of(context)
    //                               .textTheme
    //                               .displayLarge!
    //                               .copyWith(fontSize: 22.sp, color: black)),

    //                       //categories of recycling points
    //                       SizedBox(
    //                         width: 300.w,
    //                         child: Text(e.address,
    //                             overflow: TextOverflow.ellipsis,
    //                             style: Theme.of(context)
    //                                 .textTheme
    //                                 .displayMedium!
    //                                 .copyWith(fontSize: 11.sp, color: gray)),
    //                       ),
    //                     ],
    //                   ),
    //                 ],
    //               ),
    //             ),
    //           ))
    //       .toList(),
    // );
  }
}

class _AutomatedRecyclingPoints extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(cameraProvider);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 20.h),
          Text(
            "Do you approve the transaction?",
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(fontSize: 20.sp),
          ),
          SizedBox(height: 30.h),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: CustomButton(
                    onPressed: () {
                      ref.read(cameraProvider.notifier).setAutomated(false);
                    },
                    text: "No",
                  ),
                ),
                SizedBox(width: 20.w),
                Expanded(
                  child: CustomButton(
                    onPressed: () {
                      makinaId = state.barcodeValue;
                      print(makinaId);
                      context.router.replaceAll([
                        const ProductPreviewRoute(),
                      ]);
                      ref.read(cameraProvider.notifier).setAutomated(false);
                    },
                    text: "Yes",
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _QrScannedImage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(cameraProvider);
    return Expanded(
      child: SizedBox(
        width: double.infinity,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.network(
                  alignment: Alignment.center,
                  width: 300.w,
                  height: 400.h,
                  fit: BoxFit.cover,
                  state.productRecycle!.image),
              SizedBox(
                height: 250.h,
              )
            ]),
      ),
    );
  }
}

class _MapView extends ConsumerWidget {
  final LatLng location;
  const _MapView({required this.location});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(cameraProvider);
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.r),
      child: SizedBox(
        width: 100.w,
        height: 100.h,
        child: CustomMap(
          active: false,
          initialCenter: location,
          markers: [
            Marker(
              width: 40.r,
              height: 40.r,
              point: location,
              child: Icon(
                Icons.location_on,
                color: green,
                size: 36.r,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
