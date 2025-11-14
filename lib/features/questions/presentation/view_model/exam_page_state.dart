import 'package:online_exam/features/questions/data/model/questions_dto.dart';

sealed class ExamPageState {}

class ExamPageInitial extends ExamPageState {}

class ExamPageLoading extends ExamPageState {}

class ExamPageLoaded extends ExamPageState {
  final List<QuestionsDto>
  questions; // Replace dynamic with your QuestionModel type

  ExamPageLoaded({required this.questions});

  get questionsDto => null;
}

class ExamPageError extends ExamPageState {
  final String message;

  ExamPageError({required this.message});
}
