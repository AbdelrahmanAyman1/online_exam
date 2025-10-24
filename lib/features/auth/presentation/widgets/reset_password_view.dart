import 'package:flutter/material.dart';
import 'package:online_exam/core/utils/app_colors.dart';
import 'package:online_exam/core/utils/app_validator.dart';
import 'package:online_exam/core/utils/text_styles.dart';
import 'package:online_exam/core/widgets/custom_elevated_button.dart';
import 'package:online_exam/core/widgets/custom_text_form_field.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key, this.onPressed});
  final Function()? onPressed;

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  late GlobalKey _formKey;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  @override
  void initState() {
    _formKey = GlobalKey<FormState>();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
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
            CustomTextFormField(
              labelText: "Email",
              hintText: "Enter your email",
              validator: (value) => AppValidator.validateEmail(value),
              keyboardType: TextInputType.emailAddress,
              controller: _emailController,
            ),
            SizedBox(height: 24),
            CustomTextFormField(
              labelText: "Password",
              hintText: "Enter your password",
              obscureText: true,
              validator: (value) => AppValidator.validatePassword(value),
              keyboardType: TextInputType.visiblePassword,
              controller: _passwordController,
            ),
            SizedBox(height: 48),
            CustomElevatedButton(
              textOnButton: "Continue",
              onPressed: widget.onPressed,
            ),
          ],
        ),
      ),
    );
  }
}
