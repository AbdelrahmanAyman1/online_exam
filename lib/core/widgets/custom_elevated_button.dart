import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/text_styles.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.textOnButton,
    this.onPressed,
    this.child,
    this.borderRadius,
  });
  final String textOnButton;
  final void Function()? onPressed;
  final Widget? child;
  final BorderRadiusGeometry? borderRadius;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.blueBase,
        disabledBackgroundColor: AppColors.gray,
        minimumSize: Size(double.infinity, 48),
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(24.0),
        ),
      ),
      child:
          child ??
          Text(
            textOnButton,
            style: TextStyles.medium16.copyWith(color: AppColors.white),
          ),
    );
  }
}
