import 'package:flutter/material.dart';
import 'package:online_exam/core/utils/app_colors.dart';
import 'package:online_exam/core/utils/text_styles.dart';
import 'package:online_exam/features/auth/presentation/widgets/otp_widget.dart';

class VerificationCode extends StatefulWidget {
  const VerificationCode({super.key, required this.pageController});
  final PageController pageController;

  @override
  State<VerificationCode> createState() => _VerificationCodeState();
}

class _VerificationCodeState extends State<VerificationCode> {
  final List<TextEditingController> controllers = List.generate(
    6,
    (_) => TextEditingController(),
  );
  final formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    for (var controller in controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Column(
          children: [
            SizedBox(height: 40),
            Text("Email verification", style: TextStyles.medium18),
            SizedBox(height: 16),
            Text(
              "Please enter your code that send to your email address",
              textAlign: TextAlign.center,
              style: TextStyles.regular14.copyWith(color: AppColors.gray),
            ),
            SizedBox(height: 32),
            OTP(controller: controllers),
            SizedBox(height: 48),
            _buildResendCode(),
          ],
        ),
      ),
    );
  }

  Widget _buildResendCode() {
    return Align(
      alignment: Alignment.center,
      child: Text.rich(
        TextSpan(
          style: TextStyles.medium16,
          children: [
            TextSpan(
              text: "Didn't receive code? ",
              style: TextStyles.medium16.copyWith(color: AppColors.blackBase),
            ),
            TextSpan(
              text: "Resend",
              style: TextStyles.medium16.copyWith(
                color: AppColors.blueBase,
                decoration: TextDecoration.underline,
                decorationColor: AppColors.blueBase,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
