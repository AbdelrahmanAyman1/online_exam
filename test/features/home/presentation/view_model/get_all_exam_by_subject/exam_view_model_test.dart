import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:online_exam/core/api/result.dart';
import 'package:online_exam/core/error/custom_error.dart';
import 'package:online_exam/features/home/domain/entity/exams_entity.dart';
import 'package:online_exam/features/home/domain/usecase/get_exam_on_subject_usecase.dart';
import 'package:online_exam/features/home/presentation/view_model/get_all_exam_by_subject/exam_state.dart';
import 'package:online_exam/features/home/presentation/view_model/get_all_exam_by_subject/exam_view_model.dart';

import 'exam_view_model_test.mocks.dart';

@GenerateMocks([GetExamOnSubjectUsecase])
void main() {
  late ExamViewModel examViewModel;
  late GetExamOnSubjectUsecase mockGetExamOnSubjectUsecase;
  final String tSubject = "subject";
  final tList = <ExamsEntity>[ExamsEntity(id: '1'), ExamsEntity(id: '2')];
  final successResponse = Success<List<ExamsEntity>>(tList);
  final failureResponse = Failure<List<ExamsEntity>>(CustomError("error"));

  setUp(() {
    mockGetExamOnSubjectUsecase = MockGetExamOnSubjectUsecase();
    examViewModel = ExamViewModel(mockGetExamOnSubjectUsecase);
  });

  blocTest<ExamViewModel, ExamState>(
    'emits [loading, loaded] when LoadAllExams is triggered',
    build: () => examViewModel,
    setUp: () {
      provideDummy<Result<List<ExamsEntity>>>(successResponse);
      when(
        mockGetExamOnSubjectUsecase.getAllExamBySubject(tSubject),
      ).thenAnswer((_) async => successResponse);
    },
    act: (bloc) => bloc.doIntent(LoadAllExams(tSubject)),
    expect: () {
      var state = ExamState();
      return [
        state.copyWith(status: ExamStatus.loading),
        state.copyWith(status: ExamStatus.loaded, data: tList),
      ];
    },
  );
  blocTest<ExamViewModel, ExamState>(
    'emits [loading, failure] when LoadAllExams is triggered',
    build: () => examViewModel,
    setUp: () {
      provideDummy<Result<List<ExamsEntity>>>(failureResponse);
      when(
        mockGetExamOnSubjectUsecase.getAllExamBySubject(tSubject),
      ).thenAnswer((_) async => failureResponse);
    },
    act: (bloc) => bloc.doIntent(LoadAllExams(tSubject)),
    expect: () {
      var state = ExamState();
      return [
        state.copyWith(status: ExamStatus.loading),
        state.copyWith(status: ExamStatus.failure,errorMessage: "error"),
      ];
    },
  );
}
