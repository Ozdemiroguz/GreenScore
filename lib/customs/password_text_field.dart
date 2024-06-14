import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/colors.dart';
import 'custom_text_field.dart';

class PasswordTextField extends HookWidget {
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onFieldSubmitted;
  final BoxConstraints? prefixIconConstraints;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String?>? onSaved;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final TextEditingController? controller;
  final AutovalidateMode? autovalidateMode;
  final bool isDisabled;
  final List<TextInputFormatter>? inputFormatters;

  ///Default is lock icon
  final Widget? prefixIcon;
  final String? hintText;
  final String? labelText;
  final bool? isNewPassword;

  const PasswordTextField({super.key, 
    this.prefixIconConstraints,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.textInputAction,
    this.textInputType = TextInputType.visiblePassword,
    this.prefixIcon,
    this.controller,
    this.validator,
    this.onChanged,
    this.onSaved,
    this.hintText,
    this.labelText,
    this.autovalidateMode,
    this.isDisabled = false,
    this.isNewPassword = false,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    final obscureText = useState(true);
    final focusNode = useFocusNode();
    useListenable(focusNode);

    return CustomTextField(
      maxLines: 1,
      expands: false,
      onFieldSubmitted: onFieldSubmitted,
      onEditingComplete: onEditingComplete,
      textInputType: textInputType,
      inputFormatters: inputFormatters,
      controller: controller,
      focusNode: focusNode,
      onChanged: onChanged,
      onSaved: onSaved,
      obscureText: obscureText.value,
      textInputAction: textInputAction,
      hintText: hintText,
      labelText: labelText,
      validator: validator,
      prefixIcon: prefixIcon,
      prefixIconConstraints: prefixIconConstraints,
      suffixIconConstraints: BoxConstraints(minHeight: 48.r, minWidth: 48.r),
      suffixIcon: GestureDetector(
        onTap: () => obscureText.value = !obscureText.value,
        child: getSuffixIcon(
          context,
          obscureText: obscureText.value,
          hasFocus: focusNode.hasFocus,
        ),
      ),
      enabled: !isDisabled,
      autovalidateMode: autovalidateMode,
    );
  }

  Widget getSuffixIcon(
    BuildContext context, {
    required bool obscureText,
    required bool hasFocus,
  }) {
    late final Icon image;

    if (obscureText) {
      image = Icon(
        Icons.lock,
        color: hasFocus ? green : gray,
      );
    } else {
      image = Icon(
        Icons.remove_red_eye,
        color: hasFocus ? green : gray,
      );
    }

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 10.w,
        vertical: 16.h,
      ),
      child: image,
    );
  }
}
