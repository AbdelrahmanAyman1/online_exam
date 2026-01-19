import 'package:flutter/material.dart';
import 'package:online_exam/core/utils/text_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.textColor,
    required this.borderColor,
    this.backgroundColor,
    this.elevation,
  });

  final void Function()? onPressed;
  final String text;
  final Color? textColor;
  final Color borderColor;
  final Color? backgroundColor;
  final double? elevation;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(backgroundColor),
        elevation: WidgetStatePropertyAll(elevation),
        shape: WidgetStatePropertyAll(
          RoundedSuperellipseBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(
              color: borderColor,
              width: 1,
              strokeAlign: 1,
              style: BorderStyle.solid,
            ),
          ),
        ),
      ),
      onPressed: onPressed,
      child: Text(text, style: TextStyles.medium16.copyWith(color: textColor)),
    );
  }
}
