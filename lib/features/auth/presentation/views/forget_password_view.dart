import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/core/utils/text_styles.dart';
import 'package:online_exam/core/utils/app_toast.dart';

import 'package:online_exam/features/auth/presentation/view_model/forget_password_view_model/forget_password_cubit.dart';
import 'package:online_exam/features/auth/presentation/view_model/forget_password_view_model/forget_password_state.dart';
import 'package:online_exam/features/auth/presentation/view_model/reset_password_view_model/reset_password_cubit.dart';
import 'package:online_exam/features/auth/presentation/view_model/reset_password_view_model/reset_password_state.dart';
import 'package:online_exam/features/auth/presentation/view_model/verify_reset_code_view_model/verify_reset_code_cubit.dart';
import 'package:online_exam/features/auth/presentation/view_model/verify_reset_code_view_model/verify_reset_code_state.dart';
import 'package:online_exam/features/auth/presentation/views/login_view.dart';
import 'package:online_exam/features/auth/presentation/widgets/confirm_email_view.dart';
import 'package:online_exam/features/auth/presentation/widgets/reset_password_view.dart';
import 'package:online_exam/features/auth/presentation/widgets/verification_code_view.dart';

class ForgetPasswordView extends StatefulWidget {
  static const String routeName = "fogrgetView";
  const ForgetPasswordView({super.key});

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  late PageController _pageController;
  late TextEditingController _emailController;
  late TextEditingController _resetPasswordEmailController;
  late TextEditingController _newPasswordController;
  late GlobalKey<FormState> _confirmEmailFormKey;
  late GlobalKey<FormState> _resetPasswordFormKey;
  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
    _confirmEmailFormKey = GlobalKey<FormState>();
    _resetPasswordFormKey = GlobalKey<FormState>();
    _emailController = TextEditingController();
    _resetPasswordEmailController = TextEditingController();
    _newPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _resetPasswordEmailController.dispose();
    _newPasswordController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  void _confirmEmail() {
    if (_confirmEmailFormKey.currentState!.validate()) {
      context.read<ForgetPasswordCubit>().forgetPassword(
        email: _emailController.text,
      );
    }
  }

  void _resetPassword() {
    if (_resetPasswordFormKey.currentState!.validate()) {
      context.read<ResetPasswordCubit>().restPassword(
        email: _resetPasswordEmailController.text,
        newPassword: _newPasswordController.text,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Password", style: TextStyles.medium20)),
      body: MultiBlocListener(
        listeners: [
          BlocListener<ResetPasswordCubit, ResetPasswordState>(
            listener: (context, state) {
              Toast.showLoading(
                context: context,
                isLoading: state is ResetPasswordLoadingState,
              );
              if (state is ResetPasswordSuccessState) {
                Toast.showToast(
                  context: context,
                  msg: state.authResponseModel.message ?? "Password reset successful",
                );
                Navigator.pushReplacementNamed(context, LoginView.routeName);
              } else if (state is ResetPasswordFailureState) {
                Toast.showToast(
                  context: context,
                  msg: state.errorMessage ?? "Password reset failed",
                  backgroundColor: Colors.red,
                );
              }
            },
          ),
          BlocListener<VerifyResetCodeCubit, VerifyResetCodeState>(
            listener: (context, state) {
              Toast.showLoading(
                context: context,
                isLoading: state is VerifyResetCodeLoadingState,
              );
              if (state is VerifyResetCodeSuccessState) {
                Toast.showToast(
                  context: context,
                  msg: state.authResponseModel.message ?? "Code verified successfully",
                );
                _pageController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeIn,
                );
              } else if (state is VerifyResetCodeFailureState) {
                Toast.showToast(
                  context: context,
                  msg: state.errorMessage ?? "Code verification failed",
                  backgroundColor: Colors.red,
                );
              }
            },
          ),
          BlocListener<ForgetPasswordCubit, ForgetPasswordState>(
            listener: (context, state) {
              Toast.showLoading(
                context: context,
                isLoading: state is ForgetPasswordLoadingState,
              );
              if (state is ForgetPasswordSuccessState) {
                Toast.showToast(
                  context: context,
                  msg: state.authResponseModel.message ?? "Email verification sent",
                );
                _pageController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeIn,
                );
              } else if (state is ForgetPasswordFailureState) {
                Toast.showToast(
                  context: context,
                  msg: state.errorMessage ?? "Failed to send verification email",
                  backgroundColor: Colors.red,
                );
              }
            },
          ),
        ],
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),

          child: PageView.builder(
            physics: const NeverScrollableScrollPhysics(),

            controller: _pageController,
            itemCount: _getPages.length,
            itemBuilder: (BuildContext context, int index) {
              return _getPages[index];
            },
          ),
        ),
      ),
    );
  }

  List<Widget> get _getPages {
    return [
      ConfirmEmail(
        onPressed: _confirmEmail,
        emailController: _emailController,
        formKey: _confirmEmailFormKey,
      ),
      VerificationCode(pageController: _pageController),
      ResetPassword(
        onPressed: _resetPassword,
        emailController: _resetPasswordEmailController,
        passwordController: _newPasswordController,
        formKey: _resetPasswordFormKey,
      ),
    ];
  }
}
