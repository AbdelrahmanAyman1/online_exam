import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:online_exam/core/utils/app_colors.dart';

class OTPTextFormField extends StatelessWidget {
  const OTPTextFormField({
    super.key,
    this.index,
  });

  final int? index;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      width: 70,
      child: TextFormField(
        autofocus: true,
        textAlign: TextAlign.center,
        onChanged: (value) {
          if (value.length == 1 && index != 3) {
            FocusScope.of(context).nextFocus();
          } else {
            FocusScope.of(context).unfocus();
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
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)));
  }
}
