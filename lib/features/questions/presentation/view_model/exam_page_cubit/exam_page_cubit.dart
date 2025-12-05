// exam_page_cubit.dart
import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/core/api/result.dart';
import 'package:online_exam/core/base_state/base_state.dart';
import 'package:online_exam/features/questions/data/model/answer_check_dto.dart';
import 'package:online_exam/features/questions/data/model/check_questions_request.dart';
import 'package:online_exam/features/questions/data/model/check_questions_response.dart';
import 'package:online_exam/features/questions/data/model/questions_response.dart';
import 'package:online_exam/features/questions/domain/use_case/check_questions_use_case.dart';
import 'package:online_exam/features/questions/domain/use_case/get_questions_use_case.dart';
import 'package:online_exam/features/questions/presentation/view_model/exam_page_cubit/exam_page_event.dart';
import 'package:online_exam/features/questions/presentation/view_model/exam_page_cubit/exam_page_state.dart';

@injectable
class ExamPageCubit extends Cubit<ExamPageState> {
  final GetQuestionsUseCase _getQuestionsUseCase;
  final CheckQuestionsUseCase _checkQuestionsUseCase;

  Timer? _examTimer;
  static const int _examDurationSeconds = 1500;

  ExamPageCubit(this._getQuestionsUseCase, this._checkQuestionsUseCase)
    : super(ExamPageState.initial());

  void doIntent(ExamPageEvent intent) {
    switch (intent) {
      case LoadQuestionsIntent(:final examId):
        _loadQuestions(examId);

      case SelectAnswerIntent(:final questionId, :final answerKey):
        final updated = Map<String, String>.from(state.selectedAnswers)
          ..[questionId] = answerKey;
        emit(state.copyWith(selectedAnswers: updated));

      case NextQuestionIntent():
        if (state.currentQuestionIndex < _totalQuestions() - 1) {
          emit(
            state.copyWith(
              currentQuestionIndex: state.currentQuestionIndex + 1,
            ),
          );
        }

      case PreviousQuestionIntent():
        if (state.currentQuestionIndex > 0) {
          emit(
            state.copyWith(
              currentQuestionIndex: state.currentQuestionIndex - 1,
            ),
          );
        }

      case SubmitExamIntent(:final timeTakenInSeconds):
        _submitExam(timeTakenInSeconds);
    }
  }

  Future<void> _loadQuestions(String examId) async {
    emit(state.copyWith(questions: LoadingState()));

    final result = await _getQuestionsUseCase.invoke(examId);
    switch (result) {
      case Success<QuestionsResponse>():
        _startTimer(_examDurationSeconds);
        emit(
          state.copyWith(
            questions: SuccessState(result.data),
            remainingTime: _examDurationSeconds,
          ),
        );

      case Failure<QuestionsResponse>():
        emit(
          state.copyWith(
            questions: FailureState(
              result.exception.message ?? "Failed to load questions",
            ),
          ),
        );
    }
  }

  Future<void> _submitExam(int timeTaken) async {
    if (state.isSubmitting) return;

    emit(state.copyWith(isSubmitting: true, submission: LoadingState()));

    final answersList = state.selectedAnswers.entries
        .map((e) => AnswersCheckDto(questionId: e.key, correct: e.value))
        .toList();

    final request = CheckQuestionsRequest(
      answers: answersList,
      time: timeTaken,
    );
    final result = await _checkQuestionsUseCase.invoke(request);

    _examTimer?.cancel();
    switch (result) {
      case Success<CheckQuestionsResponse>():
        emit(
          state.copyWith(
            isSubmitting: false,
            submission: SuccessState(result.data),
          ),
        );
      case Failure<CheckQuestionsResponse>():
        emit(
          state.copyWith(
            isSubmitting: false,
            submission: FailureState(
              result.exception.message ?? "Submission failed",
            ),
          ),
        );
    }
  }

  void _startTimer(int totalSeconds) {
    _examTimer?.cancel();
    int remaining = totalSeconds;

    _examTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remaining <= 0) {
        timer.cancel();
        if (!state.isSubmitting) {
          doIntent(SubmitExamIntent(totalSeconds));
        }
        return;
      }

      remaining--;
      emit(state.copyWith(remainingTime: remaining));
    });
  }

  int _totalQuestions() {
    return switch (state.questions) {
      SuccessState(:final data) => data.questions?.length ?? 0,
      _ => 0,
    };
  }

  @override
  Future<void> close() {
    _examTimer?.cancel();
    return super.close();
  }
}
