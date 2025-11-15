import 'package:online_exam/features/questions/data/model/questions_dto.dart';
import 'package:online_exam/features/questions/data/model/questions_response.dart';

sealed class ExamPageState {}

class ExamPageInitial extends ExamPageState {}

class ExamPageLoading extends ExamPageState {}

class ExamPageLoaded extends ExamPageState {
  QuestionsResponse questions;

  ExamPageLoaded({required this.questions});
}

class ExamPageError extends ExamPageState {
  final String message;

  ExamPageError({required this.message});
}

class AnswerSelected extends ExamPageState {
  String questionId;
  String answerKey;
  AnswerSelected(this.questionId, this.answerKey);
}
