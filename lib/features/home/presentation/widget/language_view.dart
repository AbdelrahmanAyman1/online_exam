import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/core/utils/text_styles.dart';
import 'package:online_exam/features/home/domain/entity/exams_entity.dart';
import 'package:online_exam/features/home/presentation/view_model/get_all_exam_by_subject/exam_state.dart';
import 'package:online_exam/features/home/presentation/view_model/get_all_exam_by_subject/exam_view_model.dart';
import 'package:online_exam/features/home/presentation/widget/card_level_item.dart';
import 'package:skeletonizer/skeletonizer.dart';

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
      body: BlocBuilder<ExamViewModel, ExamState>(
        builder: (context, state) {
          if (state.isLoaded) {
            return _successState(state);
          }
          if (state.isLoading) {
            return _loadingState(state);
          } else {
            return Center(
              child: Text("Something went wrong!", style: TextStyles.medium16),
            );
          }
        },
      ),
    );
  }

  Widget _successState(ExamState state) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView.builder(
        itemBuilder: (context, index) {
          return CardLevelItem(exam: state.data![index]);
        },
        itemCount: state.data!.length,
      ),
    );
  }

  Widget _loadingState(ExamState state) {
    var dummyExams = ExamsEntity(
      title: "Loading...",
      duration: 0,
      numberOfQuestions: 0,
      createdAt: DateTime(2024, 1, 1),
    );
    return Skeletonizer(
      enabled: state.isLoading,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView.builder(
          itemBuilder: (context, index) {
            return CardLevelItem(exam: dummyExams);
          },
          itemCount: 10,
        ),
      ),
    );
  }
}
