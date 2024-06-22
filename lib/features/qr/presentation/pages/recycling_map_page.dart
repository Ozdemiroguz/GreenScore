import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greenapp/constants/colors.dart';
import 'package:greenapp/customs/custom_app_bar.dart';
import 'package:greenapp/customs/custom_map.dart';
import 'package:greenapp/features/map/domain/repositories/pages/map_page.dart';
import 'package:greenapp/features/qr/presentation/providers/map_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class RecyclingMapPage extends ConsumerWidget {
  final MapController mapController = MapController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(scanMapProvider);
    print("state.currentRecyclingPoint: ${state.currentRecyclingPoint}");
    print("state.recyclingPoints: ${state.recyclingPoints}");
    print("state.currentLocation: ${state.currentLocation}");
    return Scaffold(
      bottomSheet: state.currentRecycling == null
          ? const CircularProgressIndicator.adaptive()
          : Container(
              padding: EdgeInsets.all(16.r),
              width: double.infinity,
              height: 200.h,
              color: Colors.white,
              child: Column(children: [
                Row(
                  children: [
                    Text(
                      "${state.currentRecycling!.title}",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    Text(
                      "${state.currentRecycling!.distance.toStringAsFixed(1)} km",
                      style: TextStyle(fontSize: 16, color: green),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                Text(
                  "${state.currentRecycling!.address}",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                Spacer(),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: state.currentRecycling!.categories
                        .map(
                          (e) => Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8.w, vertical: 4.h),
                            margin: EdgeInsets.only(right: 8.w),
                            decoration: BoxDecoration(
                              color: e == "plastic"
                                  ? orange.withOpacity(0.8)
                                  : e == "glass"
                                      ? primary.withOpacity(0.8)
                                      : e == "paper"
                                          ? Colors.blue[800]?.withOpacity(0.8)
                                          : e == "metal"
                                              ? Colors.yellow[800]!
                                                  .withOpacity(0.8)
                                              : e == "e-waste"
                                                  ? red.withOpacity(0.8)
                                                  : Colors.purple[800]!
                                                      .withOpacity(0.8),
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: Text(
                              e,
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(fontSize: 15.sp, color: white),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
                SizedBox(height: 16.h),
              ]),
            ),
      appBar: CustomAppBar(
        onBackPressed: () => context.router.maybePop(),
        leadingText: "Recycling Points",
      ),
      body: Stack(
        children: [
          state.currentRecyclingPoint == null
              ? const CircularProgressIndicator.adaptive()
              : CustomMap(
                  active: true,
                  mapController: mapController,
                  markers: state.recyclingPoints!.isEmpty
                      ? []
                      : List.generate(
                          state.recyclingPoints!.length,
                          (index) => buildMarker(
                                state.recyclingPoints![index].location,
                                ref,
                                index,
                              )),
                  initialCenter: state.currentRecyclingPoint,
                  initialZoom: 10),
        ],
      ),
    );
  }
}
