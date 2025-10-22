import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:online_exam/core/utils/app_colors.dart';
import 'package:online_exam/core/utils/text_styles.dart';
import 'package:online_exam/features/auth/presentation/views/sign_up_view.dart';

class CreateAccountOrHaveAccountWidget extends StatelessWidget {
  const CreateAccountOrHaveAccountWidget({
    super.key,
    required this.textButtonText,
    this.onTab,
    required this.firstPartText,
  });
  final String textButtonText;
  final void Function()? onTab;
  final String firstPartText;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Text.rich(
        TextSpan(
          style: TextStyles.medium16,
          children: [
            TextSpan(
              text: firstPartText,
              style: TextStyles.medium16.copyWith(color: AppColors.blackBase),
            ),
            TextSpan(
              recognizer: TapGestureRecognizer()..onTap = onTab,
              text: textButtonText,
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
