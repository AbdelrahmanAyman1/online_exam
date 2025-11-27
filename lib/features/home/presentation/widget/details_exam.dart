import 'package:flutter/material.dart';
import 'package:online_exam/core/utils/app_assets.dart';
import 'package:online_exam/core/utils/app_colors.dart';
import 'package:online_exam/core/utils/text_styles.dart';
import 'package:online_exam/core/widgets/custom_elevated_button.dart';
import 'package:online_exam/features/home/domain/entity/exams_entity.dart';
import 'package:online_exam/features/questions/presentation/view/exam_page.dart';

class DetailsExamLevel extends StatelessWidget {
  static const String routeName = "Details-Exam-Level";
  const DetailsExamLevel({super.key});

  @override
  Widget build(BuildContext context) {
    var examArg = ModalRoute.of(context)!.settings.arguments as ExamsEntity;
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset(AppAssets.profit, width: 47, height: 47),
                SizedBox(width: 12),
                Text(
                  "${examArg.title}",
                  style: TextStyles.semiBold12.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Spacer(),
                Text(
                  "${examArg.duration} Minutes",
                  style: TextStyles.regular13.copyWith(
                    color: AppColors.blue100,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Text("${examArg.title}", style: TextStyles.medium16),
                SizedBox(height: 19, child: VerticalDivider()),
                Text(
                  "${examArg.numberOfQuestions} Question",
                  style: TextStyles.regular14,
                ),
              ],
            ),
            SizedBox(height: 40),
            Text("Instructions", style: TextStyles.medium18),
            SizedBox(height: 16),
            _columnOfInstructions(),
            SizedBox(height: 48),
            _startExamButton(
              () => Navigator.pushReplacementNamed(
                context,
                ExamPage.routeName,
                arguments: examArg,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _startExamButton(void Function()? onPressed) {
    return CustomElevatedButton(textOnButton: "Start", onPressed: onPressed);
  }

  Widget _columnOfInstructions() {
    return Column(
      children: [
        Text(
          " • Lorem ipsum dolor sit amet consectetur.",
          style: TextStyles.medium16,
        ),
        Text(
          " • Lorem ipsum dolor sit amet consectetur.",
          style: TextStyles.medium16,
        ),
        Text(
          " • Lorem ipsum dolor sit amet consectetur.",
          style: TextStyles.medium16,
        ),
        Text(
          " • Lorem ipsum dolor sit amet consectetur.",
          style: TextStyles.medium16,
        ),
      ],
    );
  }
}
