import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greenapp/constants/colors.dart';

import '../../../../router/router.dart';

@RoutePage()
class MainPage extends ConsumerWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AutoTabsRouter(
      routes: const [
        HomeRoute(),
        DeliveryPointRoute(),
        MapRoute(),
        ProfileRoute(),
      ],
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);

        return Scaffold(
          extendBody: true,
          body: child,
          floatingActionButton: SizedBox(
            width: 80.r,
            height: 80.r,
            child: FloatingActionButton(
              backgroundColor: primary,
              //yuvarlak buton
              shape: ShapeBorder.lerp(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.r)),
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.r)),
                  1),

              onPressed: () {
                context.router.push(const QrRoute());
              },
              child: Icon(
                Icons.qr_code_scanner_outlined,
                size: 32.r,
              ),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: AnimatedBottomNavigationBar(
            safeAreaValues: const SafeAreaValues(top: false, bottom: false),
            elevation: 0,
            iconSize: 32.r,
            notchMargin: 0,
            icons: [
              tabsRouter.activeIndex == 0 ? Icons.home : Icons.home_outlined,
              Icons.storefront_outlined,
              Icons.pin_drop,
              Icons.person_outline,
            ],
            activeIndex: tabsRouter.activeIndex,
            gapLocation: GapLocation.center,
            notchSmoothness: NotchSmoothness.sharpEdge,
            onTap: (index) async {
              tabsRouter.setActiveIndex(index);
            },
            blurEffect: true,
            backgroundColor: Colors.transparent,
            activeColor: black,
            inactiveColor: gray,
          ),
        );
      },
    );
  }
}

// class _CustomNavigationBarItem extends StatelessWidget {
//   final IconData icon;
//   final bool isActive;
//   final VoidCallback onTap;

//   const _CustomNavigationBarItem({
//     required this.icon,
//     required this.onTap,
//     required this.isActive,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         padding:
//             EdgeInsets.only(left: 18.w, right: 18.w, bottom: 24.h, top: 16.h),
//         child: Icon(
//           icon,
//           size: 32.r,
//           color: isActive ? primary : gray,
//         ),
//       ),
//     );
//   }
// }
