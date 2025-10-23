import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:online_exam/features/auth/presentation/view_model/sign_up_cubit.dart';
import 'package:online_exam/features/auth/presentation/views/forget_password_view.dart';
import 'package:online_exam/features/auth/presentation/views/login_view.dart';
import 'package:online_exam/features/auth/presentation/views/sign_up_view.dart';

class OnlineExamApp extends StatelessWidget {
  const OnlineExamApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: LoginView.routeName,
      routes: {
        SignUpView.routeName: (context) => BlocProvider(
          create: (context) => GetIt.instance.get<SignUpCubit>(),
          child: const SignUpView(),
        ),
        LoginView.routeName: (context) => const LoginView(),
        ForgetPasswordView.routeName: (context) => const ForgetPasswordView(),
      },
    );
  }
}
