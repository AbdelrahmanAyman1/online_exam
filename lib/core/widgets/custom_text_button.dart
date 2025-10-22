import 'package:flutter/material.dart';
import 'package:online_exam/core/utils/app_colors.dart';
import 'package:online_exam/core/utils/text_styles.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.textButtonText,
    this.onPressed,
  });
  final String textButtonText;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(alignment: Alignment.centerLeft),
      onPressed: onPressed,
      child: Text(
        textButtonText,
        style: TextStyles.medium16.copyWith(color: AppColors.blue),
      ),
    );
  }
}
