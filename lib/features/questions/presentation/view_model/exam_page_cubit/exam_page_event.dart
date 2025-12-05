// exam_page_intent.dart
sealed class ExamPageEvent {}

class LoadQuestionsIntent extends ExamPageEvent {
  final String examId;
  LoadQuestionsIntent(this.examId);
}

class SelectAnswerIntent extends ExamPageEvent {
  final String questionId;
  final String answerKey;
  SelectAnswerIntent(this.questionId, this.answerKey);
}

class NextQuestionIntent extends ExamPageEvent {}

class PreviousQuestionIntent extends ExamPageEvent {}

class SubmitExamIntent extends ExamPageEvent {
  final int timeTakenInSeconds;
  SubmitExamIntent(this.timeTakenInSeconds);
}
