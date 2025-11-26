import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/core/base_state/base_state.dart';
import 'package:online_exam/core/utils/app_colors.dart';
import 'package:online_exam/features/questions/data/model/questions_response.dart';
import 'package:online_exam/features/questions/presentation/view_model/exam_page_cubit/exam_page_cubit.dart';
import 'package:online_exam/features/questions/presentation/view_model/exam_page_cubit/exam_page_event.dart';
import 'package:online_exam/features/questions/presentation/view_model/exam_page_cubit/exam_page_state.dart';
import 'package:online_exam/features/questions/presentation/widgets/custom_button.dart';

class ChangeQuestionsButtons extends StatelessWidget {
  const ChangeQuestionsButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExamPageCubit, ExamPageState>(
      buildWhen: (previous, current) =>
          previous.currentQuestionIndex != current.currentQuestionIndex ||
          previous.submission != current.submission,
      builder: (context, state) {
        final questionsCount = state.questions is SuccessState
            ? (state.questions as SuccessState<QuestionsResponse>)
                      .data
                      .questions
                      ?.length ??
                  0
            : 0;

        final isLastQuestion = state.currentQuestionIndex >= questionsCount - 1;
        final isFirstQuestion = state.currentQuestionIndex <= 0;
        final isSubmitting = state.isSubmitting;

        final cubit = context.read<ExamPageCubit>();

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            children: [
              Expanded(
                child: CustomButton(
                  onPressed: isFirstQuestion
                      ? null
                      : () => cubit.doIntent(PreviousQuestionIntent()),
                  text: 'Back',
                  backgroundColor: Colors.transparent,
                  borderColor: AppColors.blue100,
                  textColor: AppColors.blue100,
                  elevation: 0,
                ),
              ),

              const SizedBox(width: 12),

              Expanded(
                child: CustomButton(
                  onPressed: isSubmitting
                      ? null
                      : () {
                          if (isLastQuestion) {
                            cubit.doIntent(SubmitExamIntent(300));
                          } else {
                            cubit.doIntent(NextQuestionIntent());
                          }
                        },
                  text: isSubmitting
                      ? 'Submitting...'
                      : (isLastQuestion ? 'Submit' : 'Next'),
                  backgroundColor: AppColors.blue100,
                  textColor: Colors.white,
                  elevation: isSubmitting ? 0 : 3,
                  borderColor: isSubmitting
                      ? Colors.transparent
                      : AppColors.blue100,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
