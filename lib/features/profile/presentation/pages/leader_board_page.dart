import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greenapp/constants/colors.dart';
import 'package:greenapp/extensions/context_size.dart';
import 'package:greenapp/features/profile/presentation/providers/profile_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class LeaderBoardPage extends ConsumerWidget {
  const LeaderBoardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(profileProvider);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: context.screenWidth,
              height: 300.h,
              decoration: BoxDecoration(
                color: green,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(32.r),
                  bottomRight: Radius.circular(32.r),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Your Rank",
                        style: TextStyle(
                          color: white,
                          fontSize: 32.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 16.h),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
