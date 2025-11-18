import 'package:online_exam/features/questions/data/model/check_questions_response.dart';
import 'package:online_exam/features/questions/data/model/questions_response.dart';

sealed class ExamPageState {}

class ExamPageInitial extends ExamPageState {}

class ExamPageLoading extends ExamPageState {}

class ExamPageLoaded extends ExamPageState {
  QuestionsResponse? questions;

  ExamPageLoaded({this.questions});
}

class SubmitExam extends ExamPageState {
  CheckQuestionsResponse checkQuestionsResponse;
  SubmitExam(this.checkQuestionsResponse);
}

class ExamPageError extends ExamPageState {
  final String message;

  ExamPageError({required this.message});
}

class ExamTimerTick extends ExamPageState {
  final int secondsLeft;
  ExamTimerTick(this.secondsLeft);
}

class ExamTimerFinished extends ExamPageState {}
