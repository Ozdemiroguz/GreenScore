import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greenapp/constants/colors.dart';
import 'package:greenapp/customs/custom_map.dart';
import 'package:greenapp/features/home/presentation/providers/user_provider.dart';
import 'package:greenapp/main.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeProvider);

    return Scaffold(
      body: state.currentUserData == null
          ? const CircularProgressIndicator.adaptive()
          : SingleChildScrollView(
              child: Column(
                children: [
                  _UserInfo(),
                  SizedBox(height: 10.h),
                  _RecycleInfo(),
                  SizedBox(height: 20.h),
                  _NearbyStations(),
                  SizedBox(height: 20.h),
                  _Materials(),
                  SizedBox(height: 100.h),
                ],
              ),
            ),
    );
  }
}

class _UserInfo extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeProvider);
    return Column(
      children: [
        SizedBox(height: 64.h),
        Container(
          padding: EdgeInsets.all(16.w),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: state.currentUserData!.profileImage == ""
                            ? AssetImage("assets/images/profile.jpg")
                            : NetworkImage(
                                state.currentUserData!.profileImage.toString(),
                              ))),
                width: 50.w,
                height: 50.h,
              ),
              SizedBox(width: 16.w),
              Text("Hi,",
                  style: TextStyle(
                      fontSize: 28.sp,
                      fontWeight: FontWeight.bold,
                      color: gray)),
              Text(
                state.currentUserData!.name,
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
              Icon(Icons.notifications, size: 28.r, color: gray),
            ],
          ),
        ),
      ],
    );
  }
}

class _RecycleInfo extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeProvider);
    return state.currentUserData == null
        ? const CircularProgressIndicator.adaptive()
        : Container(
            padding: EdgeInsets.symmetric(
              horizontal: 16.w,
            ),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${state.currentUserData!.savedCo2.toString()}g',
                      style: TextStyle(
                        fontSize: 72.sp,
                      ),
                    ),
                    Text.rich(
                      TextSpan(
                        text: 'Saved CO',
                        style: Theme.of(context).textTheme.titleSmall,
                        children: const <TextSpan>[
                          TextSpan(
                            text: '2',
                            style: TextStyle(
                              fontSize: 10,
                              // Diğer stiller...
                            ),
                          ),
                        ],
                      ),
                      // Diğer stiller...
                    )
                  ],
                ),
                const Spacer(),
                SizedBox(
                  height: 100.r,
                  child: const VerticalDivider(
                    color: Colors.black,
                    thickness: 2,
                  ),
                ),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          state.currentUserData!.naturePoint.toString(),
                          style: TextStyle(
                            fontSize: 32.sp,
                          ),
                        ),
                        Text(
                          "Nature Point",
                          style: TextStyle(
                            fontSize: 12.sp,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.h),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          textAlign: TextAlign.start,
                          state.currentUserData!.balance.toString(),
                          style: TextStyle(
                            fontSize: 32.sp,
                          ),
                        ),
                        Text(
                          "Balance",
                          style: TextStyle(
                            fontSize: 12.sp,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          );
  }
}

class _NearbyStations extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16.r,
      ),
      child: Column(
        children: [
          const Align(
              alignment: Alignment.topLeft, child: Text("nearby bin station")),
          SizedBox(
            height: 10.h,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(20.r),
            child: SizedBox(
                width: double.infinity,
                height: 220.h,
                child: CustomMap(
                  mapController: MapController(),
                  initialCenter: currentlocation,
                  markers: const [],
                )),
          )
        ],
      ),
    );
  }
}

class _Materials extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeProvider);
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                "materials",
                style: TextStyle(fontSize: 20.sp),
              )),
        ),
        Container(
          padding: EdgeInsets.only(left: 16.w),
          width: double.infinity,
          height: 150.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: state.appImages!.length,
            itemBuilder: (BuildContext context, int index) {
              return Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              state.appImages![index].image,
                            )),
                        borderRadius: BorderRadius.circular(25.r)),
                    width: 120.w,
                    height: 150.h,
                  ),
                  if (index == state.appImages!.length - 1)
                    SizedBox(width: 16.w),
                ],
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                width: 10,
              );
            },
          ),
        ),
      ],
    );
  }
}
