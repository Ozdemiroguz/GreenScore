import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../constants/colors.dart';

class ProfileImageWidget extends StatelessWidget {
  final String image;
  final int? size;
  const ProfileImageWidget({
    super.key,
    required this.image,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: size?.w ?? 100.w,
        height: size?.h ?? 100.h,
        decoration: BoxDecoration(
          border: Border.all(color: primary, width: 2),
          shape: BoxShape.circle,
          image: DecorationImage(
              fit: BoxFit.cover,
              image: (image == '')
                  ? const AssetImage("assets/images/profile.jpg")
                  : NetworkImage(image)),
        ));
  }
}
