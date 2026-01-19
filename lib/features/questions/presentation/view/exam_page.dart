// exam_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:online_exam/core/base_state/base_state.dart';
import 'package:online_exam/core/di/di.dart';
import 'package:online_exam/core/utils/app_assets.dart';
import 'package:online_exam/core/utils/app_colors.dart';
import 'package:online_exam/core/utils/text_styles.dart';
import 'package:online_exam/features/home/domain/entity/exams_entity.dart';
import 'package:online_exam/features/home/presentation/widget/language_view.dart';
import 'package:online_exam/features/questions/data/model/questions_response.dart';
import 'package:online_exam/features/questions/presentation/view/exam_score_page.dart';
import 'package:online_exam/features/questions/presentation/view_model/exam_page_cubit/exam_page_cubit.dart';
import 'package:online_exam/features/questions/presentation/view_model/exam_page_cubit/exam_page_event.dart';
import 'package:online_exam/features/questions/presentation/view_model/exam_page_cubit/exam_page_state.dart';
import 'package:online_exam/features/questions/presentation/widgets/answers_list.dart';
import 'package:online_exam/features/questions/presentation/widgets/change_questions_buttons.dart';

class ExamPage extends StatelessWidget {
  static const String routeName = 'exam_page';

  const ExamPage({super.key});

  @override
  Widget build(BuildContext context) {
    final exam = ModalRoute.of(context)!.settings.arguments as ExamsEntity;

    return BlocProvider(
      create: (_) =>
          getIt<ExamPageCubit>()
            ..doIntent(LoadQuestionsIntent(exam.id!)), // MVI Intent
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: SvgPicture.asset(AppAssets.arrowBackIos),
            onPressed: () => _showQuitDialog(context),
          ),
          title: const Text("Exam", style: TextStyles.medium20),
          actions: [
            Row(
              children: [
                Image.asset(AppAssets.alarm, width: 24, height: 24),
                SizedBox(width: 8),
                BlocBuilder<ExamPageCubit, ExamPageState>(
                  builder: (context, state) {
                    final mins = (state.remainingTime ~/ 60).toString().padLeft(
                      2,
                      '0',
                    );
                    final secs = (state.remainingTime % 60).toString().padLeft(
                      2,
                      '0',
                    );
                    final color = state.remainingTime <= 60
                        ? Colors.red
                        : AppColors.lightGreen;
                    return Text(
                      "$mins:$secs",
                      style: TextStyles.medium18.copyWith(color: color),
                    );
                  },
                ),
                SizedBox(width: 20),
              ],
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocConsumer<ExamPageCubit, ExamPageState>(
            listener: (context, state) {
              if (state.submission is SuccessState) {
                Navigator.pushReplacementNamed(
                  context,
                  ExamScorePage.routeName,
                  arguments: (state.submission as SuccessState).data,
                );
              }

              if (state.submission is FailureState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text((state.submission as FailureState).message),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
            builder: (context, state) {
              return switch (state.questions) {
                IdleState() || LoadingState() => const Center(
                  child: CircularProgressIndicator(color: AppColors.blue100),
                ),
                FailureState(:final message) => Center(
                  child: Text(
                    message,
                    style: TextStyles.medium16.copyWith(color: Colors.red),
                  ),
                ),
                SuccessState(:final data) => _buildExamBody(
                  context,
                  state,
                  data,
                ),
              };
            },
          ),
        ),
      ),
    );
  }

  Widget _buildExamBody(
    BuildContext context,
    ExamPageState state,
    QuestionsResponse response,
  ) {
    final questions = response.questions!;
    final currentQuestion = questions[state.currentQuestionIndex];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Progress Header
        Center(
          child: Text(
            'Question ${state.currentQuestionIndex + 1} of ${questions.length}',
            style: TextStyles.medium16,
          ),
        ),
        const SizedBox(height: 10),

        LinearProgressIndicator(
          value: (state.currentQuestionIndex + 1) / questions.length,
          backgroundColor: AppColors.black10,
          valueColor: const AlwaysStoppedAnimation(AppColors.blueBase),
          borderRadius: BorderRadius.circular(8),
        ),
        const SizedBox(height: 10),

        // Question Text
        Text(
          currentQuestion.question ?? "No question text",
          style: TextStyles.medium16,
        ),
        const SizedBox(height: 10),

        // Answers List
        Expanded(
          child: AnswersList(
            answers: currentQuestion.answers ?? [],
            questionId: currentQuestion.Id.toString(),
          ),
        ),

        const SizedBox(height: 16),

        // Navigation Buttons
        Expanded(child: const ChangeQuestionsButtons()),
      ],
    );
  }

  void _showQuitDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("Quit Exam?"),
        content: const Text(
          "Are you sure you want to leave the exam? Your progress will be lost.",
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(ctx);
              Navigator.pushNamedAndRemoveUntil(
                context,
                LanguageView.routeName,
                (route) => false,
              );
            },
            child: const Text("Quit", style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}
