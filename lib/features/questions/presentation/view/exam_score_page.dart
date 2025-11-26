import 'package:flutter/material.dart';
import 'package:online_exam/core/utils/app_colors.dart';
import 'package:online_exam/core/utils/text_styles.dart';
import 'package:online_exam/features/questions/data/model/check_questions_response.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ExamScorePage extends StatelessWidget {
  static const routeName = 'exam_score_page';
  const ExamScorePage({super.key});

  @override
  Widget build(BuildContext context) {
    final response =
        ModalRoute.of(context)!.settings.arguments as CheckQuestionsResponse;

    final double percent =
        double.parse(response.total!.replaceAll("%", "")) / 100;
    final int correct = response.correct ?? 0;
    final int incorrect = response.wrong ?? 0;

    return Scaffold(
      appBar: AppBar(title: const Text('Exam score')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Your score", style: TextStyles.medium18),
            const SizedBox(height: 25),

            Row(
              children: [
                CircularPercentIndicator(
                  radius: 70,
                  lineWidth: 12,
                  percent: percent,
                  animation: true,

                  circularStrokeCap: CircularStrokeCap.round,
                  backgroundColor: AppColors.error,
                  progressColor: AppColors.blueBase,

                  center: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${(percent * 100).round()}%",
                        style: TextStyles.medium20.copyWith(
                          color: AppColors.blueBase,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(width: 25),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.circle, color: AppColors.blueBase, size: 10),
                        const SizedBox(width: 8),
                        Text("Correct", style: TextStyles.medium16),
                        const SizedBox(width: 10),
                        Text(
                          "$correct",
                          style: TextStyles.medium16.copyWith(
                            color: AppColors.blueBase,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        Icon(Icons.circle, color: Colors.red, size: 10),
                        const SizedBox(width: 8),
                        Text(
                          "Incorrect",
                          style: TextStyles.medium16.copyWith(
                            color: Colors.red,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          "$incorrect",
                          style: TextStyles.medium16.copyWith(
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 40),

            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.blueBase,
                minimumSize: const Size.fromHeight(48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                "Show results",
                style: TextStyles.medium16.copyWith(color: Colors.white),
              ),
            ),

            const SizedBox(height: 15),

            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                minimumSize: const Size.fromHeight(48),
                side: BorderSide(color: AppColors.blueBase),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                "Start again",
                style: TextStyles.medium16.copyWith(color: AppColors.blueBase),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
