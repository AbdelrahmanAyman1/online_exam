import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/core/utils/app_validator.dart';
import 'package:online_exam/core/utils/text_styles.dart';
import 'package:online_exam/core/widgets/custom_elevated_button.dart';
import 'package:online_exam/core/widgets/custom_text_form_field.dart';
import 'package:online_exam/core/utils/app_toast.dart';
import 'package:online_exam/features/auth/presentation/view_model/login_view_model/login_cubit.dart';
import 'package:online_exam/features/auth/presentation/view_model/login_view_model/login_state.dart';
import 'package:online_exam/features/auth/presentation/views/sign_up_view.dart';
import 'package:online_exam/features/auth/presentation/widgets/create_account_or_have_account_widget.dart';
import 'package:online_exam/features/auth/presentation/widgets/remember_me_and_forget_widget.dart';
import 'package:online_exam/features/home/presentation/view/app_section.dart';

import '../../../home/presentation/widgets/home_screen.dart';

class LoginView extends StatefulWidget {
  static const String routeName = "LoginView";
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late GlobalKey<FormState> _formKey;

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  void _loginFormState() {
    if (_formKey.currentState!.validate()) {
      context.read<LoginCubit>().login(
        email: _emailController.text,
        password: _passwordController.text,
      );
    }
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: BlocListener<LoginCubit, LoginState>(
            listener: (context, state) {
              Toast.showLoading(
                context: context,
                isLoading: state is LoginLoadingState,
              );
              if (state is LoginSuccessState) {
                Toast.showToast(
                  context: context,
                  msg: state.authResponseModel.message ?? "Login successful",
                );
                Navigator.of(context).pushReplacementNamed(AppSection.routeName);
              }
              if (state is LoginFailureState) {
                Toast.showToast(
                  context: context,
                    msg: state.errorMessage ?? "Login failed",
                  backgroundColor: Colors.red,
                );
              }
            },
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 24,
                  children: [
                    Text("Login", style: TextStyles.medium20),
                    CustomTextFormField(
                      controller: _emailController,
                      hintText: "Email",
                      labelText: "Enter you email",
                      validator: AppValidator.validateEmail,
                    ),
                    CustomTextFormField(
                      obscureText: true,
                      validator: AppValidator.validatePassword,
                      hintText: "Password",
                      controller: _passwordController,
                      labelText: "Enter you Password",
                    ),
                    RememberMeAndForgetWidget(),
                    CustomElevatedButton(
                      textOnButton: "Login",
                      onPressed: _loginFormState,
                    ),
                    CreateAccountOrHaveAccountWidget(
                      firstPartText: "Don't have an account? ",
                      textButtonText: 'Sign Up',
                      onTab: () =>
                          Navigator.pushNamed(context, SignUpView.routeName),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
