import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/colors.dart';
import '../constants/text_styles.dart';

final lightTheme = ThemeData.light().copyWith(
  colorScheme: const ColorScheme.light(
    surface: whiteback,
    primary: green,
    secondary: gray,
  ),
  scaffoldBackgroundColor: whiteback,
  textTheme: _textTheme,
  filledButtonTheme: _filledButtomThemeData,
  inputDecorationTheme: _inputDecorationTheme,
  iconTheme: _iconTheme,
  textButtonTheme: _textButtonThemeData,
);

final _textTheme = TextTheme(
  titleSmall: titleSmall,
  titleMedium: titleMedium,
  titleLarge: titleLarge,
  headlineSmall: headlineSmall,
  headlineMedium: headlineMedium,
  headlineLarge: headlineLarge,
  bodySmall: bodySmall,
  bodyMedium: bodyMedium,
  bodyLarge: bodyLarge,
  labelSmall: labelSmall,
  labelMedium: labelMedium,
  labelLarge: labelLarge,
  displaySmall: displaySmall,
  displayMedium: displayMedium,
  displayLarge: displayLarge,
);

final _filledButtomThemeData = FilledButtonThemeData(
  style: ButtonStyle(
    maximumSize: WidgetStatePropertyAll(Size.fromHeight(56.r)),
    minimumSize: WidgetStatePropertyAll(Size.fromHeight(56.r)),
    backgroundColor: WidgetStateProperty.resolveWith<Color>(
      (states) {
        if (states.contains(WidgetState.disabled)) {
          return gray;
        } else {
          return primary;
        }
      },
    ),
    side: const WidgetStatePropertyAll(BorderSide.none),
    padding: const WidgetStatePropertyAll(EdgeInsets.zero),
    shape: WidgetStatePropertyAll(
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
    ),
    textStyle: WidgetStatePropertyAll(displaySmall.copyWith(color: white)),
    foregroundColor: const WidgetStatePropertyAll(white),
    elevation: const WidgetStatePropertyAll(0),
  ),
);
final _inputDecorationTheme = InputDecorationTheme(
  constraints: BoxConstraints(
    minHeight: 56.h,
    maxHeight: 177.h,
    maxWidth: 500.w,
    minWidth: 42.w,
  ),
  filled: true,
  fillColor: white,
  iconColor: green,
  suffixIconColor: darkBlue,
  prefixIconColor: darkBlue,
  hintStyle: bodyLarge.copyWith(color: gray),
  labelStyle: bodyLarge.copyWith(color: gray),
  errorStyle: bodySmall.copyWith(color: red),
  errorMaxLines: 2,
  contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
  floatingLabelStyle: bodySmall.copyWith(color: darkBlue),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(8.r),
    borderSide: BorderSide(color: gray, width: 1.r),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(8.r),
    borderSide: BorderSide(color: primary, width: 1.r),
  ),
  errorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(8.r),
    borderSide: BorderSide(color: red, width: 1.r),
  ),
  disabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(8.r),
    borderSide: BorderSide.none,
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(8.r),
    borderSide: BorderSide(color: red, width: 1.r),
  ),
);

final _iconTheme = IconThemeData(
  color: primary,
  size: 24.r,
);

final _textButtonThemeData = TextButtonThemeData(
  style: ButtonStyle(
    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
    foregroundColor: const WidgetStatePropertyAll(primary),
    backgroundColor: const WidgetStatePropertyAll(Colors.transparent),
    overlayColor: const WidgetStatePropertyAll(Colors.transparent),
    padding: const WidgetStatePropertyAll(EdgeInsets.zero),
    textStyle: WidgetStatePropertyAll(displaySmall),
  ),
);
