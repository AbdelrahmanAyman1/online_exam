import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:online_exam/core/utils/app_colors.dart';

class OTPTextFormField extends StatelessWidget {
  const OTPTextFormField({
    super.key,
    this.index,
    this.onComplete,
    this.controller,
  });

  final int? index;
  final TextEditingController? controller;
  final void Function()? onComplete;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      width: 45,
      child: TextFormField(
        autofocus: true,
        textAlign: TextAlign.center,
        controller: controller,
        onChanged: (value) {
          if (value.length == 1 && index != 5) {
            FocusScope.of(context).nextFocus();
          } else if (value.isEmpty && index != 0) {
            FocusScope.of(context).previousFocus();
          } else if (value.length == 1 && index == 5) {
            onComplete?.call();
          }
        },
        decoration: _buildInputDecoration(),
        keyboardType: TextInputType.number,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
      ),
    );
  }

  InputDecoration _buildInputDecoration() {
    return InputDecoration(
      fillColor: AppColors.textFieldBackgroundColor,
      filled: true,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
    );
  }
}
