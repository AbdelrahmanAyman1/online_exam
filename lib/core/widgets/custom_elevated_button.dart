import 'package:flutter/material.dart';
import 'package:online_exam/core/utils/app_colors.dart';
import 'package:online_exam/core/utils/text_styles.dart';

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

        padding: const EdgeInsets.symmetric(vertical: 16.0),
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(24.0),
        ),
      ),
      child: Text(textOnButton, style: TextStyles.mediam16),
    );
  }
}
