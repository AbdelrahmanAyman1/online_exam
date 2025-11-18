import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/core/api/result.dart';
import 'package:online_exam/features/questions/data/model/answer_check_dto.dart';
import 'package:online_exam/features/questions/data/model/check_questions_request.dart';
import 'package:online_exam/features/questions/data/model/check_questions_response.dart';
import 'package:online_exam/features/questions/data/model/questions_response.dart';
import 'package:online_exam/features/questions/domain/use_case/check_questions_use_case.dart';
import 'package:online_exam/features/questions/domain/use_case/get_questions_use_case.dart';
import 'package:online_exam/features/questions/presentation/view_model/exam_page_cubit/exam_page_state.dart';

@injectable
class ExamPageCubit extends Cubit<ExamPageState> {
  GetQuestionsUseCase getQuestionsUseCase;
  CheckQuestionsUseCase checkQuestionsUseCase;
  int indexOfQuestion = 0;
  Map<String, String> answers = {}; // questionId -> answerKey

  ExamPageCubit(this.getQuestionsUseCase, this.checkQuestionsUseCase)
    : super(ExamPageInitial());

  void getQuestions(String examId) async {
    emit(ExamPageLoading());
    var result = await getQuestionsUseCase.invoke(examId);
    switch (result) {
      case Success<QuestionsResponse>():
        emit(ExamPageLoaded(questions: result.data));
        break;
      case Failure<QuestionsResponse>():
        emit(ExamPageError(message: result.exception.message ?? ''));
    }
  }

  void nextQuestion() {
    if (state is ExamPageLoaded) {
      final loadedState = state as ExamPageLoaded;
      final totalQuestions = loadedState.questions!.questions?.length ?? 0;
      if (indexOfQuestion < totalQuestions - 1) {
        indexOfQuestion++;
        emit(ExamPageLoaded(questions: loadedState.questions));
      }
    }
  }

  void previousQuestion() {
    if (state is ExamPageLoaded) {
      if (indexOfQuestion > 0) {
        indexOfQuestion--;
        emit(ExamPageLoaded(questions: (state as ExamPageLoaded).questions));
      }
    }
  }

  void choseAnswer(String questionId, String answerKey) {
    answers[questionId] = answerKey;
    if (state is ExamPageLoaded) {
      emit(ExamPageLoaded(questions: (state as ExamPageLoaded).questions));
    }
  }

  void submitExam({required int time}) async {
    if (state is! ExamPageLoaded) return;

    final answersList = answers.entries
        .map((e) => AnswersCheckDto(questionId: e.key, correct: e.value))
        .toList();

    final request = CheckQuestionsRequest(answers: answersList, time: time);

    emit(ExamPageLoading());

    var result = await checkQuestionsUseCase.invoke(request);

    switch (result) {
      case Success<CheckQuestionsResponse>():
        emit(SubmitExam(result.data));
        break;
      case Failure<CheckQuestionsResponse>():
        emit(ExamPageError(message: result.exception.message ?? ''));
    }
  }
}
