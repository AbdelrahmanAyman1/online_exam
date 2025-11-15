import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:online_exam/core/constant/constants.dart';
import 'package:online_exam/features/auth/presentation/view_model/forget_password_view_model/forget_password_cubit.dart';
import 'package:online_exam/features/auth/presentation/view_model/login_view_model/login_cubit.dart';
import 'package:online_exam/features/auth/presentation/view_model/reset_password_view_model/reset_password_cubit.dart';
import 'package:online_exam/features/auth/presentation/view_model/sign_up_view_model/sign_up_cubit.dart';
import 'package:online_exam/features/auth/presentation/view_model/verify_reset_code_view_model/verify_reset_code_cubit.dart';
import 'package:online_exam/features/auth/presentation/views/forget_password_view.dart';
import 'package:online_exam/features/auth/presentation/views/login_view.dart';
import 'package:online_exam/features/auth/presentation/views/sign_up_view.dart';
import 'package:online_exam/features/home/presentation/view/app_section.dart';
import 'package:online_exam/features/home/presentation/view_model/get_all_exam_by_subject/exam_state.dart';
import 'package:online_exam/features/home/presentation/view_model/get_all_exam_by_subject/exam_view_model.dart';
import 'package:online_exam/features/home/presentation/widget/details_exam.dart';
import 'package:online_exam/features/home/presentation/widget/language_view.dart';
import 'package:online_exam/features/questions/presentation/view/exam_page.dart';
import 'package:online_exam/features/questions/presentation/view_model/exam_page_cubit.dart';

class OnlineExamApp extends StatelessWidget {
  const OnlineExamApp({super.key});
  //
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: isUserLoggedIn
          ? LanguageView.routeName
          : LoginView.routeName,
      routes: {
        ExamPage.routeName: (context) => BlocProvider(
          create: (context) => GetIt.instance.get<ExamPageCubit>(),
          child: const ExamPage(),
        ),
        LanguageView.routeName: (context) => BlocProvider(
          create: (context) =>
              GetIt.instance.get<ExamViewModel>()
                ..doIntent(LoadAllExams("670037f6728c92b7fdf434fc")),
          child: const LanguageView(),
        ),
        AppSection.routeName: (context) => const AppSection(),
        DetailsExamLevel.routeName: (context) => const DetailsExamLevel(),
        SignUpView.routeName: (context) => BlocProvider(
          create: (context) => GetIt.instance.get<SignUpCubit>(),
          child: const SignUpView(),
        ),
        LoginView.routeName: (context) => BlocProvider(
          create: (context) => GetIt.instance.get<LoginCubit>(),
          child: const LoginView(),
        ),
        ForgetPasswordView.routeName: (context) => MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => GetIt.instance.get<ForgetPasswordCubit>(),
            ),
            BlocProvider(
              create: (context) => GetIt.instance.get<VerifyResetCodeCubit>(),
            ),
            BlocProvider(
              create: (context) => GetIt.instance.get<ResetPasswordCubit>(),
            ),
          ],
          child: const ForgetPasswordView(),
        ),
      },
    );
  }
}
