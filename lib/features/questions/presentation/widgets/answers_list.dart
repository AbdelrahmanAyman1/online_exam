// answers_list.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/core/utils/app_colors.dart';
import 'package:online_exam/core/utils/text_styles.dart';
import 'package:online_exam/features/questions/data/model/answer_dto.dart';
import 'package:online_exam/features/questions/presentation/view_model/exam_page_cubit/exam_page_cubit.dart';
import 'package:online_exam/features/questions/presentation/view_model/exam_page_cubit/exam_page_event.dart';
import 'package:online_exam/features/questions/presentation/view_model/exam_page_cubit/exam_page_state.dart';

class AnswersList extends StatelessWidget {
  const AnswersList({
    super.key,
    required this.answers,
    required this.questionId,
  });

  final List<AnswersDto> answers;
  final String questionId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExamPageCubit, ExamPageState>(
      buildWhen: (previous, current) {
        return previous.selectedAnswers[questionId] !=
            current.selectedAnswers[questionId];
      },
      builder: (context, state) {
        final selectedAnswerKey = state.selectedAnswers[questionId];
        final cubit = context.read<ExamPageCubit>();

        return ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 8),
          itemCount: answers.length,
          itemBuilder: (context, index) {
            final answer = answers[index];
            final isSelected = answer.key == selectedAnswerKey;

            return Container(
              margin: const EdgeInsets.symmetric(vertical: 6),
              decoration: BoxDecoration(
                color: isSelected ? AppColors.blue20 : AppColors.blue10,
                borderRadius: BorderRadius.circular(12),
              ),
              child: RadioGroup<String>(
                onChanged: (value) =>
                    cubit.doIntent(SelectAnswerIntent(questionId, value!)),
                groupValue: selectedAnswerKey,
                child: RadioListTile<String>(
                  value: answer.key!,

                  activeColor: AppColors.blue100,
                  title: Text(
                    answer.answer ?? "",
                    style: TextStyles.medium16.copyWith(
                      color: AppColors.blackBase,
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
