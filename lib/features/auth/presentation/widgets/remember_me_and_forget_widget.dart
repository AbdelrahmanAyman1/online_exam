import 'package:flutter/material.dart';
import 'package:online_exam/core/utils/app_colors.dart';
import 'package:online_exam/core/utils/text_styles.dart';
import 'package:online_exam/features/auth/presentation/views/forget_password_view.dart';

class RememberMeAndForgetWidget extends StatefulWidget {
  const RememberMeAndForgetWidget({
    super.key,
  });

  @override
  State<RememberMeAndForgetWidget> createState() =>
      _RememberMeAndForgetWidgetState();
}

class _RememberMeAndForgetWidgetState extends State<RememberMeAndForgetWidget> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
            value: isSelected,
            onChanged: (seleted) {
              setState(() {
                isSelected = seleted!;
              });
            }),
        Text(
          "Remember me",
          style: TextStyles.regular13.copyWith(color: AppColors.blackBase),
        ),
        Spacer(),
        TextButton(
          onPressed: () =>
              Navigator.of(context).pushNamed(ForgetPasswordView.routeName),
          child: Text(
            "Forget password?",
            style: TextStyles.regular12.copyWith(
                decoration: TextDecoration.underline,
                color: AppColors.blackBase),
          ),
        )
      ],
    );
  }
}
