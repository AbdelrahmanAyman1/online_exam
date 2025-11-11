import 'package:flutter/material.dart';
import 'package:online_exam/core/utils/app_assets.dart';
import 'package:online_exam/core/utils/app_colors.dart';
import 'package:online_exam/core/utils/text_styles.dart';
import 'package:online_exam/core/widgets/custom_elevated_button.dart';

class DetailsExamLevel extends StatelessWidget {
  static const String routeName = "Details-Exam-Level";
  const DetailsExamLevel({super.key});

  @override
  Widget build(BuildContext context) {
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
                  "Languages",
                  style: TextStyles.semiBold12.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Spacer(),
                Text(
                  "39 Minutes",
                  style: TextStyles.regular13.copyWith(
                    color: AppColors.blue100,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Text("High level", style: TextStyles.medium16),
                SizedBox(height: 19, child: VerticalDivider()),
                Text("20 Question", style: TextStyles.regular14),
              ],
            ),
            SizedBox(height: 40),
            Text("Instructions", style: TextStyles.medium18),
            SizedBox(height: 16),
            _columnOfInstructions(),
            SizedBox(height: 48),
            _startExamButton(),
          ],
        ),
      ),
    );
  }

  Widget _startExamButton() {
    return CustomElevatedButton(textOnButton: "Start", onPressed: () {});
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
