import 'package:flutter/material.dart';
import 'package:online_exam/features/auth/presentation/widgets/otp_text_form_field.dart';

class OTP extends StatelessWidget {
  const OTP({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(6, (index) => OTPTextFormField(index: index)),
    );
  }
}
