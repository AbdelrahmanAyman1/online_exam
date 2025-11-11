import 'package:flutter/material.dart';
import 'package:online_exam/core/utils/text_styles.dart';
import 'package:online_exam/features/home/presentation/widget/card_level_item.dart';

class LanguageView extends StatelessWidget {
  const LanguageView({super.key});
  static const String routeName = "Language-View";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Languages"),
        titleTextStyle: TextStyles.medium20,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("English", style: TextStyles.medium18),
            SizedBox(height: 24),
            CardLevelItem(),
          ],
        ),
      ),
    );
  }
}
