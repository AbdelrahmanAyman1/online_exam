import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/core/utils/text_styles.dart';
import 'package:online_exam/features/auth/presentation/view_model/forget_password_view_model/forget_password_cubit.dart';
import 'package:online_exam/features/auth/presentation/view_model/forget_password_view_model/forget_password_state.dart';
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
  late GlobalKey<FormState> _formKey;
  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    _formKey = GlobalKey<FormState>();
    _emailController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _pageController.dispose();
  }

  void _confirmEmail() {
    if (_formKey.currentState!.validate()) {
      context.read<ForgetPasswordCubit>().forgetPassword(
        email: _emailController.text,
      );
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("OTP sent to your email")));
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Error")));
    }
  }

  void _verificationCode() {
    _pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }

  void _resetPassword() {
    Navigator.of(context).pushReplacementNamed(LoginView.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Password", style: TextStyles.medium20)),
      body: MultiBlocListener(
        listeners: [
          BlocListener<ForgetPasswordCubit, ForgetPasswordState>(
            listener: (context, state) {
              if (state is ForgetPasswordSuccessState) {
                _pageController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeIn,
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
        formKey: _formKey,
      ),
      VerificationCode(verify: _verificationCode),
      ResetPassword(onPressed: _resetPassword),
    ];
  }
}
