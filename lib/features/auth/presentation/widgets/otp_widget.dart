import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/features/auth/presentation/view_model/verify_reset_code_view_model/verify_reset_code_cubit.dart';
import 'package:online_exam/features/auth/presentation/widgets/otp_text_form_field.dart';

class OTP extends StatelessWidget {
  const OTP({super.key, required this.controller});
  final List<TextEditingController> controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(
        6,
        (index) => OTPTextFormField(
          index: index,

          controller: controller[index],
          onComplete: () {
            final otp = controller.map((c) => c.text).join();
            context.read<VerifyResetCodeCubit>().verifyResetCode(code: otp);
          },
        ),
      ),
    );
  }
}
