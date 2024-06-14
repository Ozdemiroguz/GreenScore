//custom buttons used another pages
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final String? text;
  final Widget? buttonContent;
  final VoidCallback onPressed;
  final EdgeInsetsGeometry? padding;

  const CustomButton(
      {super.key,
      this.text,
      required this.onPressed,
      this.buttonContent,
      this.padding});

  @override
  Widget build(BuildContext context) {
    return FilledButton(
        onPressed: onPressed,
        child: Padding(
          padding: padding ??
              EdgeInsets.only(top: 10.h, bottom: 10.h, left: 20.w, right: 20.w),
          child: buttonContent ?? Text(text ?? "Default Text"),
        ));
  }
}
