import 'package:flutter/material.dart';
import 'package:online_exam/core/utils/app_assets.dart';
import 'package:online_exam/core/utils/app_colors.dart';
import 'package:online_exam/core/utils/text_styles.dart';
import 'package:online_exam/features/home/domain/entity/exams_entity.dart';
import 'package:online_exam/features/home/presentation/widget/details_exam.dart';

class CardLevelItem extends StatelessWidget {
  const CardLevelItem({super.key, required this.exam});
  final ExamsEntity exam;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(DetailsExamLevel.routeName,
      arguments: exam,
      ),
      child: Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Row(
            spacing: 8,
            children: [
              Image.asset(AppAssets.profit),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("${exam.title}", style: TextStyles.medium16),

                        Text(
                          "${exam.duration} Minutes",
                          style: TextStyles.regular13.copyWith(
                            color: AppColors.blue100,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "${exam.numberOfQuestions} Question",
                      style: TextStyles.regular13,
                    ),
                    SizedBox(height: 16),
                    Text(
                      "${exam.createdAt}",
                      style: TextStyles.regular13.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
