import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/core/utils/app_colors.dart';
import 'package:online_exam/features/questions/presentation/view_model/exam_page_cubit/exam_page_cubit.dart';
import 'package:online_exam/features/questions/presentation/view_model/exam_page_cubit/exam_page_state.dart';
import 'package:online_exam/features/questions/presentation/widgets/custom_button.dart';

class ChangeQuestionsButtons extends StatelessWidget {
  const ChangeQuestionsButtons({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExamPageCubit, ExamPageState>(
      builder: (context, state) {
        final cubit = context.read<ExamPageCubit>();
        if (state is ExamPageLoaded) {
          return Row(
            children: [
              Expanded(
                child: CustomButton(
                  onPressed: () {
                    cubit.previousQuestion();
                  },
                  text: 'Back',
                  borderColor: AppColors.blue100,
                  backgroundColor: Colors.transparent,
                  textColor: AppColors.blue100,
                  elevation: 0,
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: CustomButton(
                  onPressed: () {
                    if (cubit.indexOfQuestion ==
                        (state.questions!.questions?.length ?? 0) - 1) {
                      cubit.submitExam(time: 10);
                    }
                    cubit.nextQuestion();
                  },
                  text:
                      cubit.indexOfQuestion ==
                          (state.questions!.questions?.length ?? 0) - 1
                      ? 'Submit'
                      : 'Next',
                  borderColor: AppColors.blue100,
                  backgroundColor: AppColors.blue100,
                  textColor: AppColors.white,
                  elevation: 2,
                ),
              ),
            ],
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
