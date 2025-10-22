import 'package:flutter/material.dart';
import 'package:online_exam/core/utils/app_colors.dart';
import 'package:online_exam/core/utils/text_styles.dart';
import 'package:online_exam/core/widgets/custom_elevated_button.dart';
import 'package:online_exam/core/widgets/custom_text_form_field.dart';

class ConfirmEmail extends StatelessWidget {
  const ConfirmEmail({
    super.key,
    this.onPressed,
  });

  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 40,
        ),
        Text(
          "Forget password",
          style: TextStyles.medium18,
        ),
        SizedBox(
          height: 16,
        ),
        Text(
          "Please enter your email associated to \nyour account",
          textAlign: TextAlign.center,
          style: TextStyles.regular14.copyWith(color: AppColors.gray),
        ),
        SizedBox(
          height: 32,
        ),
        CustomTextFormField(
          labelText: "Enter your Email",
          hintText: "Email",
        ),
        SizedBox(
          height: 48,
        ),
        CustomElevatedButton(
          textOnButton: "Continue",
          onPressed: onPressed,
        )
      ],
    );
  }
}
