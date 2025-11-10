import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:online_exam/core/utils/app_assets.dart';
import 'package:online_exam/core/utils/app_colors.dart';
import 'package:online_exam/core/utils/app_toast.dart';
import 'package:online_exam/core/utils/text_styles.dart';
import 'package:online_exam/features/auth/presentation/view_model/sign_up_view_model/sign_up_cubit.dart';
import 'package:online_exam/features/auth/presentation/view_model/sign_up_view_model/sign_up_state.dart';
import 'package:online_exam/features/auth/presentation/widgets/create_account_or_have_account_widget.dart';
import 'package:online_exam/features/auth/presentation/widgets/sing_up_form.dart';

class SignUpView extends StatelessWidget {
  static const String routeName = 'sign-up';
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: SvgPicture.asset(
            AppAssets.arrowBackIos,
            height: 20,
            width: 10,
            colorFilter: const ColorFilter.mode(
              AppColors.blackBase,
              BlendMode.srcIn,
            ),
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Sign Up',
          style: TextStyles.medium20.copyWith(color: AppColors.blackBase),
        ),
      ),
      body: BlocListener<SignUpCubit, SignUpState>(
        listener: (context, state) {
          Toast.showLoading(
            context: context,
            isLoading: state is SignUpLoadingState,
          );
          if (state is SignUpSuccessState) {
            Toast.showToast(context: context, msg: "Success");
          } else if (state is SignUpFailureState) {
            Toast.showToast(context: context, msg: "${state.errorMessage}");
          }
        },

        child: SingleChildScrollView(
          child: Column(
            children: [
              SingUpForm(),
              SizedBox(height: 20),
              CreateAccountOrHaveAccountWidget(
                firstPartText: "Already have an account? ",
                textButtonText: 'Login',
                onTab: () => Navigator.pop(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
