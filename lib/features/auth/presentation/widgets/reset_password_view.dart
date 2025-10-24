import 'package:flutter/material.dart';
import 'package:online_exam/core/utils/app_colors.dart';
import 'package:online_exam/core/utils/text_styles.dart';
import 'package:online_exam/core/widgets/custom_elevated_button.dart';
import 'package:online_exam/core/widgets/custom_text_form_field.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key, this.onPressed});
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 40),
          Text("Reset password", style: TextStyles.medium18),
          SizedBox(height: 16),
          Text(
            maxLines: 3,
            "Password must not be empty and must contain 8 characters with upper case letter and one \nnumber at least ",
            textAlign: TextAlign.center,
            style: TextStyles.regular14.copyWith(color: AppColors.gray),
          ),
          SizedBox(height: 32),
          CustomTextFormField(labelText: "Email", hintText: "Enter your email"),
          SizedBox(height: 24),
          CustomTextFormField(
            labelText: "Password",
            hintText: "Enter your password",
          ),
          SizedBox(height: 48),
          CustomElevatedButton(textOnButton: "Continue", onPressed: onPressed),
        ],
      ),
    );
  }
}
