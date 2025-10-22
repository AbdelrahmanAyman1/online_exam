import 'package:flutter/material.dart';
import 'package:online_exam/core/utils/app_colors.dart';
import 'package:online_exam/core/utils/text_styles.dart';
import 'package:online_exam/core/widgets/custom_text_button.dart';
import 'package:online_exam/features/auth/presentation/widgets/sing_up_form.dart';

class SignUpView extends StatelessWidget {
  static const String routeName = 'sign-up';
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Sign Up',
          style: TextStyles.medium20.copyWith(color: AppColors.blackBase),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SingUpForm(),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account?',
                  style: TextStyles.regular14.copyWith(color: AppColors.gray),
                ),
                CustomTextButton(
                  textButtonText: 'login',
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
