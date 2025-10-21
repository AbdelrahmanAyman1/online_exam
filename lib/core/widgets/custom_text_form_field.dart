import 'package:flutter/material.dart';
import 'package:online_exam/core/utils/app_colors.dart';
import 'package:online_exam/core/utils/text_styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.labelText,
    this.keyboardType,
    this.obscureText,
    this.validator,
    this.onChanged,
    this.controller,
    this.suffixIcon,
    this.enabled,
  });
  final String hintText;
  final String labelText;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final bool? enabled;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText ?? false,
      keyboardType: keyboardType,
      validator: validator,
      onChanged: onChanged,
      enabled: enabled,
      controller: controller,

      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        hintText: hintText,
        labelText: labelText,
        labelStyle: TextStyles.regular13.copyWith(color: AppColors.gray),
        hintStyle: TextStyles.regular14.copyWith(color: AppColors.gray),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.0),
          borderSide: BorderSide(color: AppColors.gray),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.0),
          borderSide: BorderSide(color: AppColors.error),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.0),
          borderSide: BorderSide(color: AppColors.gray),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.0),
          borderSide: BorderSide(color: AppColors.gray),
        ),
      ),
    );
  }
}
