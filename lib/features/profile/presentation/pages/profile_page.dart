import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greenapp/constants/colors.dart';
import 'package:greenapp/customs/custom_app_bar.dart';
import 'package:greenapp/customs/custom_button.dart';
import 'package:greenapp/features/profile/presentation/providers/profile_provider.dart';
import 'package:greenapp/router/router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(profileProvider);
    if (state.currentUser == null) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return Scaffold(
      appBar: CustomAppBar(
          mainAxisAlignment: MainAxisAlignment.center,
          leading:
              Text("Profile", style: Theme.of(context).textTheme.displayLarge)),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 16.h),
            const _PorfileInfoPart(),
            SizedBox(height: 16.h),
            const Divider(
              color: Colors.grey,
              thickness: 1,
            ),
            SizedBox(height: 16.h),
            _FirstContainer(),
            SizedBox(height: 16.h),
            const Divider(
              color: Colors.grey,
              thickness: 1,
            ),
            SizedBox(height: 16.h),
            _SecondContainer(),
            SizedBox(height: 90.h),

            //Listview.seperated ile liste
          ],
        ),
      ),
    );
  }
}

class _PorfileInfoPart extends ConsumerWidget {
  const _PorfileInfoPart();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(profileProvider);
    return Column(
      children: [
        Container(
          width: 100.w,
          height: 100.h,
          decoration: BoxDecoration(
              border: Border.all(color: green, width: 2),
              color: green,
              shape: BoxShape.circle,
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: (state.currentUser!.profileImage == null ||
                          state.currentUser!.profileImage == '')
                      ? const AssetImage("assets/images/profile.jpg")
                      : NetworkImage(state.currentUser!.profileImage!))),
        ),
        SizedBox(
          height: 16.h,
        ),
        Text(
          "${state.currentUser!.name} ${state.currentUser!.surname}",
          style: Theme.of(context).textTheme.displayMedium,
        ),
        SizedBox(
          height: 4.h,
        ),
        Text(
          state.currentUser!.email,
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                color: gray,
              ),
        ),
        SizedBox(
          height: 16.h,
        ),

        //edit button
        const _ProfileEditButton(),
      ],
    );
  }
}

class _ProfileEditButton extends ConsumerWidget {
  const _ProfileEditButton();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
        height: 40.h,
        width: 150.w,
        child: CustomButton(
          onPressed: () {
            context.router.push(const EditProfileRoute());
          },
          text: "Edit Profile",
          padding: EdgeInsets.only(
            left: 16.w,
            right: 16.w,
            top: 0,
          ),
        ));
  }
}

class _RouteContainer extends ConsumerWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const _RouteContainer({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 8.w),
        child: Row(
          children: [
            Icon(icon, size: 24.r),
            SizedBox(width: 20.w),
            Text(title, style: Theme.of(context).textTheme.displaySmall),
            Spacer(),
            Icon(Icons.arrow_forward_ios, size: 16.r),
          ],
        ),
      ),
    );
  }
}

class _FirstContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _RouteContainer(icon: Icons.settings, title: "Settings", onTap: () {}),
        _RouteContainer(
            icon: Icons.update, title: 'Transactions', onTap: () {}),
        _RouteContainer(
            icon: Icons.hourglass_bottom_rounded,
            title: "Pending Payments",
            onTap: () {}),
        _RouteContainer(
            icon: Icons.check_circle, title: "Achievements", onTap: () {}),
      ],
    );
  }
}

class _SecondContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _RouteContainer(
            icon: Icons.lock, title: "Change Password", onTap: () {}),
        _RouteContainer(
            icon: Icons.question_mark_outlined,
            title: "Help & Support",
            onTap: () {}),
        _RouteContainer(icon: Icons.logout, title: "Logout", onTap: () {}),
      ],
    );
  }
}
// class ProfileRoute {
//   final IconData icon;
//   final String title;
//   final VoidCallback onTap;

//   const ProfileRoute({
//     required this.icon,
//     required this.title,
//     required this.onTap,
//   });
// }

// // ignore: non_constant_identifier_names
// final _ProfileRoutes = [
//   ProfileRoute(icon: Icons.person, title: "Profile", onTap: () {}),
//   ProfileRoute(icon: Icons.leaderboard, title: "Leaderboard", onTap: () {}),
//   ProfileRoute(
//       icon: Icons.document_scanner, title: "Certificates", onTap: () {}),
//   ProfileRoute(icon: Icons.settings, title: "Settings", onTap: () {}),
//   ProfileRoute(icon: Icons.logout, title: "Logout", onTap: () {}),
// ];

// class _ProfileContainerPart extends ConsumerWidget {
//   const _ProfileContainerPart();
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final state = ref.watch(profileProvider);

//     return Container(
//       padding: EdgeInsets.all(16.w),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           Icon(Icons.person, size: 64.r),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(state.currentUser!.name,
//                       style: TextStyle(
//                           fontSize: 16.sp,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.black)),
//                   SizedBox(
//                     width: 8.w,
//                   ),
//                   Text(state.currentUser!.surname,
//                       style: TextStyle(
//                           fontSize: 16.sp,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.black)),
//                   SizedBox(
//                     width: 80.w,
//                   ),
//                   Row(
//                     children: [
//                       Text(state.currentUser!.naturePoint.toStringAsFixed(1),
//                           style: TextStyle(
//                               fontSize: 16.sp, fontWeight: FontWeight.bold)),
//                       Icon(Icons.eco, size: 24.r),
//                     ],
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 height: 8.h,
//               ),
//               Text(state.currentUser!.email,
//                   style: TextStyle(fontSize: 16.sp, color: Colors.grey)),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

// class _LeaderBoard extends ConsumerWidget {
//   const _LeaderBoard();
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return GestureDetector(
//       onTap: () {
//         context.router.push(
//           LeaderBoardRoute(),
//         );
//       },
//       child: Container(
//         padding: EdgeInsets.all(16.w),
//         child: Row(
//           children: [
//             Icon(Icons.leaderboard, size: 64.r),
//             SizedBox(
//               width: 16.w,
//             ),
//             Text("Leaderboard",
//                 style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold)),
//             Spacer(),
//             Icon(Icons.arrow_forward_ios, size: 24.r),
//           ],
//         ),
//       ),
//     );
//   }
// }
