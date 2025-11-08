import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:online_exam/features/auth/presentation/view_model/login_view_model/login_cubit.dart';
import 'package:online_exam/features/auth/presentation/view_model/sign_up_view_model/sign_up_cubit.dart';
import 'package:online_exam/features/auth/presentation/views/forget_password_view.dart';
import 'package:online_exam/features/auth/presentation/views/login_view.dart';
import 'package:online_exam/features/auth/presentation/views/sign_up_view.dart';
import 'package:online_exam/features/home/presentation/view/home_view.dart';

class OnlineExamApp extends StatelessWidget {
  const OnlineExamApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeView.routeName,
      routes: {
        SignUpView.routeName: (context) => BlocProvider(
          create: (context) => GetIt.instance.get<SignUpCubit>(),
          child: const SignUpView(),
        ),
        LoginView.routeName: (context) => BlocProvider(
          create: (context) => GetIt.instance.get<LoginCubit>(),
          child: const LoginView(),
        ),
        HomeView.routeName: (context) => const HomeView(),
        ForgetPasswordView.routeName: (context) => const ForgetPasswordView(),
      },
    );
  }
}
