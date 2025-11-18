import 'package:flutter/material.dart';
import 'package:online_exam/core/utils/app_colors.dart';
import 'package:online_exam/core/utils/text_styles.dart';
import 'package:online_exam/features/questions/data/model/answer_dto.dart';
import 'package:online_exam/features/questions/presentation/view_model/exam_page_cubit/exam_page_cubit.dart';

class AnswersList extends StatelessWidget {
  const AnswersList({
    super.key,
    required this.answers,
    required this.cubit,
    required this.questionId,
  });

  final List<AnswersDto> answers;
  final ExamPageCubit cubit;
  final String questionId;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: answers.length,
      itemBuilder: (context, index) {
        final answer = answers[index];
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          decoration: BoxDecoration(
            color: answer.key == cubit.answers[questionId]
                ? AppColors.blue20
                : AppColors.blue10,
            borderRadius: BorderRadius.circular(10),
          ),
          child: RadioGroup<String>(
            groupValue: cubit.answers[questionId],
            onChanged: (value) => cubit.choseAnswer(questionId, value!),
            child: RadioListTile<String>(
              value: answer.key!,

              activeColor: AppColors.blueBase,
              title: Text(
                answer.answer ?? "",
                style: TextStyles.regular16.copyWith(
                  color: AppColors.blackBase,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
