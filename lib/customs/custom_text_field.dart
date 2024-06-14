import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants/colors.dart';

class CustomTextField extends HookWidget {
  final GlobalKey<FormFieldState>? formFieldKey;
  final BoxConstraints? suffixIconConstraints;
  final BoxConstraints? prefixIconConstraints;
  final ValueChanged<String>? onFieldSubmitted;
  final List<TextInputFormatter>? inputFormatters;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String?>? onSaved;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final FormFieldValidator<String>? validator;
  final AutovalidateMode? autovalidateMode;
  final TextInputType? textInputType;
  final Widget? errorWidget;

  final TextStyle? style;
  final TextStyle? labelStyle;
  final TextStyle? hintStyle;
  final FocusNode? focusNode;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? initialValue;
  final String? hintText;
  final String? labelText;
  final bool? expands;
  final bool obscureText;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final bool enabled;
  final bool readOnly;
  final Color? fillColor;
  final InputBorder? border;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final InputBorder? errorBorder;
  final InputBorder? disabledBorder;
  final InputBorder? focusedErrorBorder;
  final TextAlign textAlign;
  final EdgeInsetsGeometry? contentPadding;

  const CustomTextField({super.key, 
    this.suffixIconConstraints,
    this.prefixIconConstraints,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.textInputAction,
    this.autovalidateMode,
    this.inputFormatters,
    this.textInputType,
    this.formFieldKey,
    this.initialValue,
    this.validator,
    this.controller,
    this.onChanged,
    this.onSaved,
    this.focusNode,
    this.hintText,
    this.labelText,
    this.suffixIcon,
    this.prefixIcon,
    this.labelStyle,
    this.hintStyle,
    this.maxLines,
    this.minLines,
    this.maxLength,
    this.obscureText = false,
    this.enabled = true,
    this.expands,
    this.readOnly = false,
    this.style,
    this.fillColor,
    this.border,
    this.enabledBorder,
    this.focusedBorder,
    this.errorBorder,
    this.disabledBorder,
    this.focusedErrorBorder,
    this.textAlign = TextAlign.start,
    this.contentPadding,
    this.errorWidget,
  });

  @override
  Widget build(BuildContext context) {
    final focusNode = this.focusNode ?? useFocusNode();
    useListenable(focusNode);

    return TextFormField(
      maxLength: maxLength,
      key: formFieldKey,
      initialValue: initialValue,
      style: style,
      onFieldSubmitted: onFieldSubmitted,
      onEditingComplete: onEditingComplete,
      inputFormatters: inputFormatters,
      autovalidateMode: autovalidateMode,
      controller: controller,
      focusNode: focusNode,
      onChanged: onChanged,
      onSaved: onSaved,
      obscureText: obscureText,
      textInputAction: textInputAction ?? TextInputAction.next,
      validator: validator,
      keyboardType: textInputType,
      maxLines: maxLines ?? 1,
      enabled: enabled,
      readOnly: readOnly,
      textAlign: textAlign,
      decoration: InputDecoration(
        floatingLabelStyle:
            labelStyle ?? TextStyle(color: focusNode.hasFocus ? primary : gray),
        counterText: "",
        suffixIconConstraints: BoxConstraints(
          maxHeight: suffixIconConstraints?.maxHeight ?? 56.h,
          maxWidth: suffixIconConstraints?.maxWidth ?? 56.w,
        ),
        prefixIconConstraints: prefixIconConstraints,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        enabled: enabled,
        contentPadding: contentPadding,
        // fillColor: !enabled ? gray.withOpacity(0.4) : fillColor,
        fillColor: fillColor ?? (!enabled ? gray : null),
        error: errorWidget,
        hintText: hintText,
        hintStyle: hintStyle,
        labelStyle: labelStyle,
        labelText: labelText,
        border: border,
        enabledBorder: enabledBorder,
        focusedBorder: focusedBorder,
        errorBorder: errorBorder,
        disabledBorder: disabledBorder,
        focusedErrorBorder: focusedErrorBorder,
      ),
    );
  }
}

// class CustomTextFieldBorderless extends HookWidget {
//   final String hintText;
//   final Widget prefixIcon;
//   final Widget? suffixIcon;
//   final VoidCallback? onEditingComplete;
//   final ValueChanged<String>? onChanged;
//   final ValueChanged<String?>? onSaved;
//   final FocusNode? focusNode;

//   const CustomTextFieldBorderless({
//     required this.hintText,
//     required this.prefixIcon,
//     this.suffixIcon,
//     this.onEditingComplete,
//     this.onChanged,
//     this.onSaved,
//     this.focusNode,
//   });
//   @override
//   Widget build(BuildContext context) {
//     final focusNode = this.focusNode ?? useFocusNode();
//     useListenable(focusNode);
//     return TextField(
//       onEditingComplete: onEditingComplete,
//       onChanged: onChanged,
//       onSubmitted: onSaved,
//       decoration: InputDecoration(
//         fillColor: white,
//         hintText: hintText,
//         prefixIcon: prefixIcon,
//         suffixIcon: suffixIcon ??
//             SizedBox(
//               height: 56.h,
//             ),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.all(
//             Radius.circular(8.r),
//           ),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.all(
//             Radius.circular(8.r),
//           ),
//           borderSide: BorderSide.none,
//         ),
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.all(
//             Radius.circular(8.r),
//           ),
//           borderSide: BorderSide.none,
//         ),
//         errorBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.all(
//             Radius.circular(8.r),
//           ),
//           borderSide: BorderSide.none,
//         ),
//       ),
//     );
//   }
// }
