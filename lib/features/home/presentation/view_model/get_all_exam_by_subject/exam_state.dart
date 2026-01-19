import 'package:equatable/equatable.dart';
import 'package:online_exam/features/home/domain/entity/exams_entity.dart';

enum ExamStatus { inital, loading, loaded, failure }

extension MyExamState on ExamState {
  bool get isLoading => status == ExamStatus.loading;
  bool get isLoaded => status == ExamStatus.loaded;
  bool get isFailure => status == ExamStatus.failure;
}

class ExamState extends Equatable {
  final ExamStatus? status;
  final List<ExamsEntity>? data;
  final String? errorMessage;

  const ExamState({
    this.status = ExamStatus.inital,
    this.data,
    this.errorMessage,
  });

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

  @override
  List<Object?> get props => [status, data, errorMessage];
}

sealed class HomeIntent {}

class LoadAllExams extends HomeIntent  with EquatableMixin {
  String subject;
  LoadAllExams(this.subject);
  
  @override
  
  List<Object?> get props => [subject];
}
