import 'package:equatable/equatable.dart';
import 'package:online_exam/core/base_state/base_state.dart';
import 'package:online_exam/features/questions/data/model/questions_response.dart';
import 'package:online_exam/features/questions/data/model/check_questions_response.dart';

class ExamPageState extends Equatable {
  final BaseState<QuestionsResponse> questions;
  final BaseState<CheckQuestionsResponse> submission;
  final int currentQuestionIndex;
  final Map<String, String> selectedAnswers; // questionId → answerKey
  final bool isSubmitting;
  final int remainingTime;
  const ExamPageState({
    required this.questions,
    required this.submission,
    required this.currentQuestionIndex,
    required this.selectedAnswers,
    required this.isSubmitting,
    required this.remainingTime,
  });

  // Initial State
  static ExamPageState initial() => ExamPageState(
    questions: IdleState(),
    submission: IdleState(),
    currentQuestionIndex: 0,
    selectedAnswers: {},
    isSubmitting: false,
    remainingTime: 1500,
  );

  ExamPageState copyWith({
    BaseState<QuestionsResponse>? questions,
    BaseState<CheckQuestionsResponse>? submission,
    int? currentQuestionIndex,
    Map<String, String>? selectedAnswers,
    bool? isSubmitting,
    int? remainingTime,
  }) {
    return ExamPageState(
      questions: questions ?? this.questions,
      submission: submission ?? this.submission,
      currentQuestionIndex: currentQuestionIndex ?? this.currentQuestionIndex,
      selectedAnswers: selectedAnswers ?? this.selectedAnswers,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      remainingTime: remainingTime ?? this.remainingTime,
    );
  }

  @override
  List<Object?> get props => [
    questions,
    submission,
    currentQuestionIndex,
    selectedAnswers,
    isSubmitting,
    remainingTime,
  ];
}
