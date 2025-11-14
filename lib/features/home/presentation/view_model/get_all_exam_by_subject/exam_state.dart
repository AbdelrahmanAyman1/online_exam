import 'package:online_exam/features/home/domain/entity/exams_entity.dart';

enum ExamStatus { inital, loading, loaded, failure }

extension MyExamState on ExamState {
  bool get isLoading => status == ExamStatus.loading;
  bool get isLoaded => status == ExamStatus.loaded;
  bool get isFailure => status == ExamStatus.failure;
}

class ExamState {
  final ExamStatus? status;
  final List<ExamsEntity>? data;
  final String? errorMessage;

  ExamState({this.status = ExamStatus.inital, this.data, this.errorMessage});

  ExamState copyWith({
    ExamStatus? status,
    List<ExamsEntity>? data,
    String? errorMessage,
  }) {
    return ExamState(
      status: status ?? this.status,
      data: data ?? this.data,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

sealed class HomeIntent {}

class LoadAllExams extends HomeIntent {
  String subject;
  LoadAllExams(this.subject);
}
