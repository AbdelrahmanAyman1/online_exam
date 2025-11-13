import 'package:online_exam/features/home/domain/entity/exams_entity.dart';

sealed class ExamState {}

class ExamInitialState extends ExamState {}

class ExamLoadingState extends ExamState {}

class ExamSuccessState extends ExamState {
  final List<ExamsEntity> exams;
  ExamSuccessState(this.exams);
}

class ExamFailureState extends ExamState {
  final String errorMessage;
  ExamFailureState(this.errorMessage);
}
