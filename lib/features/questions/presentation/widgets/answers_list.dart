import 'package:flutter/material.dart';
import 'package:online_exam/core/utils/app_colors.dart';
import 'package:online_exam/core/utils/text_styles.dart';
import 'package:online_exam/features/questions/data/model/answer_dto.dart';
import 'package:online_exam/features/questions/presentation/view_model/exam_page_cubit.dart';

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
      physics: const NeverScrollableScrollPhysics(),
      itemCount: answers.length,
      itemBuilder: (context, index) {
        final ans = answers[index];

        return Container(
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          decoration: BoxDecoration(
            color: AppColors.blue10,
            borderRadius: BorderRadius.circular(10),
          ),
          child: RadioGroup<String>(
            groupValue: cubit.answers[questionId],
            onChanged: (value) => cubit.choseAnswer(questionId, value!),
            child: RadioListTile<String>(
              value: ans.key!,

              activeColor: AppColors.blueBase,
              title: Text(
                ans.answer ?? "",
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
