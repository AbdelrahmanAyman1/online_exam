import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/core/api/result.dart';
import 'package:online_exam/features/home/domain/entity/exams_entity.dart';
import 'package:online_exam/features/home/domain/usecase/get_exam_on_subject_usecase.dart';
import 'package:online_exam/features/home/presentation/view_model/get_all_exam_by_subject/exam_state.dart';

@injectable
class ExamViewModel extends Cubit<ExamState> {
  final GetExamOnSubjectUsecase _getExamOnSubjectUsecase;
  ExamViewModel(this._getExamOnSubjectUsecase) : super(ExamInitialState());
  void fetchExamsBySubject(String subject) async {
    emit(ExamLoadingState());
    final result = await _getExamOnSubjectUsecase.getAllExamBySubject(subject);
    switch (result) {
      case Success<List<ExamsEntity>>():
        emit(ExamSuccessState(result.data));
      case Failure<List<ExamsEntity>>():
        emit(
          ExamFailureState(
            result.exception.message ?? "An unknown error occurred",
          ),
        );
    }
  }
}
