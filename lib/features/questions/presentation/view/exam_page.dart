import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:online_exam/core/di/di.dart';
import 'package:online_exam/core/utils/app_assets.dart';
import 'package:online_exam/core/utils/app_colors.dart';
import 'package:online_exam/core/utils/text_styles.dart';
import 'package:online_exam/features/home/domain/entity/exams_entity.dart';
import 'package:online_exam/features/home/presentation/widget/language_view.dart';
import 'package:online_exam/features/questions/presentation/view_model/exam_page_cubit/exam_page_cubit.dart';
import 'package:online_exam/features/questions/presentation/view_model/exam_page_cubit/exam_page_state.dart';
import 'package:online_exam/features/questions/presentation/widgets/answers_list.dart';
import 'package:online_exam/features/questions/presentation/widgets/change_questions_buttons.dart';

class ExamPage extends StatefulWidget {
  static const String routeName = 'exam_page';
  const ExamPage({super.key});

  @override
  State<ExamPage> createState() => _ExamPageState();
}

class _ExamPageState extends State<ExamPage> {
  late ExamPageCubit examCubit;

  @override
  void initState() {
    super.initState();
    examCubit = getIt<ExamPageCubit>();
  }

  @override
  Widget build(BuildContext context) {
    final examArg = ModalRoute.of(context)!.settings.arguments as ExamsEntity;

    return BlocProvider(
      create: (_) => examCubit..getQuestions(examArg.id.toString()),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            color: Colors.black,
            icon: SvgPicture.asset(AppAssets.arrowBackIos),

            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text("Are you sure you want to quit?"),
                    actions: [
                      TextButton(
                        child: const Text("No"),
                        onPressed: () => Navigator.pop(context),
                      ),
                      TextButton(
                        child: const Text("Yes"),
                        onPressed: () => Navigator.popAndPushNamed(
                          context,
                          LanguageView.routeName,
                        ),
                      ),
                    ],
                  );
                },
              );
            },
          ),
          title: const Text("Exam", style: TextStyles.medium20),
          actions: [
            Row(
              children: [
                Image.asset(AppAssets.alarm, fit: BoxFit.cover),
                SizedBox(width: 8),
                Text("00:05", style: TextStyles.regular12),
                SizedBox(width: 20),
              ],
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocBuilder<ExamPageCubit, ExamPageState>(
            builder: (context, state) {
              if (state is ExamPageLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              if (state is ExamPageError) {
                return Center(
                  child: Text(
                    'Error: ${state.message}',
                    style: TextStyles.medium16,
                  ),
                );
              }

              if (state is ExamPageLoaded) {
                final cubit = context.read<ExamPageCubit>();
                final question =
                    state.questions.questions![cubit.indexOfQuestion];
                final answers = question.answers ?? [];
                final questionId = question.Id.toString();

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        'Question ${cubit.indexOfQuestion + 1} of ${state.questions.questions!.length}',
                        style: TextStyles.medium16,
                      ),
                    ),
                    SizedBox(height: 10),
                    LinearProgressIndicator(
                      borderRadius: BorderRadius.circular(3),
                      color: AppColors.gray,
                      valueColor: AlwaysStoppedAnimation(AppColors.blueBase),
                      value:
                          (cubit.indexOfQuestion + 1) /
                          state.questions.questions!.length,
                    ),
                    SizedBox(height: 10),
                    Text(question.question ?? "", style: TextStyles.medium16),
                    const SizedBox(height: 10),
                    Expanded(
                      child: AnswersList(
                        answers: answers,
                        cubit: cubit,
                        questionId: questionId,
                      ),
                    ),
                    Expanded(child: const ChangeQuestionsButtons()),
                  ],
                );
              }

              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }
}
