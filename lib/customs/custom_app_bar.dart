import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greenapp/constants/colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final String? leadingText;
  final Widget? leading;
  final double? leadingWidth;
  final double? toolbarHeight;
  final double bottomHeight;
  final List<Widget>? actions;
  final PreferredSizeWidget? bottom;
  final VoidCallback? onBackPressed;
  final Color? backgroundColor;
  final MainAxisAlignment? mainAxisAlignment;

  const CustomAppBar({
    super.key,
    this.leadingText,
    this.title,
    this.actions,
    this.leading,
    this.leadingWidth,
    this.toolbarHeight,
    this.bottom,
    this.bottomHeight = 0,
    this.onBackPressed,
    this.backgroundColor,
    this.mainAxisAlignment,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 20.w,
        right: 20.w,
        top: 58.h,
      ),
      decoration: BoxDecoration(
        color: backgroundColor ?? whiteback,
      ),
      child: Row(
        mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: onBackPressed ??
                () {
                  context.router.maybePop();
                },
            child: leading ??
                Row(
                  children: [
                    GestureDetector(
                      onTap: onBackPressed ?? () => context.router.maybePop(),
                      child: SizedBox(
                        width: 24.w,
                        height: 24.h,
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 16.w,
                    ),
                    Text(
                      leadingText ?? "",
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                  ],
                ),
          ),

          //actions null değilse ekle yoksa boş bırak
          if (actions != null)
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: actions!,
              ),
            ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight((toolbarHeight ?? 24.h) + 80.h);
}
