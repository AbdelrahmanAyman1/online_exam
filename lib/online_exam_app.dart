import 'package:flutter/material.dart';
import 'package:online_exam/features/auth/presentation/views/sign_up_view.dart';

class OnlineExamApp extends StatelessWidget {
  const OnlineExamApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SignUpView.routeName,
      routes: {SignUpView.routeName: (context) => const SignUpView()},
    );
  }
}
