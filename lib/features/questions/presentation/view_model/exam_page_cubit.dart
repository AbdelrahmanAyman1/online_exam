import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/core/api/result.dart';
import 'package:online_exam/features/questions/data/model/questions_response.dart';
import 'package:online_exam/features/questions/domain/use_case/get_questions_use_case.dart';
import 'package:online_exam/features/questions/presentation/view_model/exam_page_state.dart';

@injectable
class ExamPageCubit extends Cubit<ExamPageState> {
  GetQuestionsUseCase getQuestionsUseCase;
  int indexOfQuestion = 0;
  Map<String, String> answers = {};
  ExamPageCubit(this.getQuestionsUseCase) : super(ExamPageInitial());
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

  void nextQuestion() async {
    if (state is ExamPageLoaded) {
      final loadedState = state as ExamPageLoaded;
      final totalQuestions = loadedState.questions.questions?.length ?? 0;
      if (totalQuestions > 0 && indexOfQuestion < totalQuestions - 1) {
        indexOfQuestion++;
        emit(ExamPageLoaded(questions: loadedState.questions));
      }
    }
  }

  void perviousQuestion() async {
    if (state is ExamPageLoaded) {
      if (indexOfQuestion > 0) {
        indexOfQuestion--;
        emit(ExamPageLoaded(questions: (state as ExamPageLoaded).questions));
      }
    }
  }

  void choseAnswer(String questionId, String answerKey) async {
    answers[questionId] = answerKey;
    if (state is ExamPageLoaded) {
      emit(ExamPageLoaded(questions: (state as ExamPageLoaded).questions));
    }
  }
}
