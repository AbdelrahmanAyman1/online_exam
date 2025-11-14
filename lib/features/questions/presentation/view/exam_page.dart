import 'dart:nativewrappers/_internal/vm/lib/async_patch.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:online_exam/core/constant/constants.dart';
import 'package:online_exam/core/di/di.dart';
import 'package:online_exam/core/helper/secure_storage.dart';
import 'package:online_exam/core/utils/app_assets.dart';
import 'package:online_exam/core/utils/text_styles.dart';
import 'package:online_exam/features/questions/presentation/view_model/exam_page_cubit.dart';
import 'package:online_exam/features/questions/presentation/view_model/exam_page_state.dart';

class ExamPage extends StatefulWidget {
  static const String routeName = 'exam_page';
  const ExamPage({super.key});

  @override
  State<ExamPage> createState() => _ExamPageState();
}

class _ExamPageState extends State<ExamPage> {
  @override
  String token =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY5MTUwNGRkOGZiMTlhZDk1NWIyNzZhMyIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzYzMDcwNTAwfQ.dQGxsSvUAj-tMjK8oLD1WaZMxEroxcIblmCa9rKOAnI';
  @override
  Widget build(BuildContext context) {
    final ExamPageCubit homeViewModel = getIt<ExamPageCubit>();
    return BlocProvider(
      create: (context) =>
          homeViewModel..getQuestions('6700707030a3c3c1944a9c5d', token),
      child: Scaffold(),
    );
  }
}
