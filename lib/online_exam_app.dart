import 'package:flutter/material.dart';
import 'package:online_exam/features/auth/presentation/views/forget_password_view.dart';
import 'package:online_exam/features/auth/presentation/views/login_view.dart';
import 'package:online_exam/features/auth/presentation/views/sign_up_view.dart';

class OnlineExamApp extends StatelessWidget {
  const OnlineExamApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: ForgetPasswordView.routeName,
      routes: {
        SignUpView.routeName: (context) => const SignUpView(),
        LoginView.routeName: (context) => const LoginView(),
        ForgetPasswordView.routeName: (context) => const ForgetPasswordView(),
      },
    );
  }
}
