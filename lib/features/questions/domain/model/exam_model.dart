import 'package:online_exam/features/questions/domain/model/questions_model.dart';

class ExamModel {
  final String id;
  final String title;
  final int durationInMinutes;
  final int totalQuestions;
  final List<QuestionModel> questions;

  ExamModel({
    required this.id,
    required this.title,
    required this.durationInMinutes,
    required this.totalQuestions,
    required this.questions,
  });
}
