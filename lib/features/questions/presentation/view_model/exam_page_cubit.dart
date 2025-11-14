import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/core/api/result.dart';
import 'package:online_exam/features/questions/data/model/questions_dto.dart';
import 'package:online_exam/features/questions/domain/use_case/get_questions_use_case.dart';
import 'package:online_exam/features/questions/presentation/view_model/exam_page_state.dart';

@injectable
class ExamPageCubit extends Cubit<ExamPageState> {
  GetQuestionsUseCase getQuestionsUseCase;

  ExamPageCubit(this.getQuestionsUseCase) : super(ExamPageInitial());

  void getQuestions(String examId, String token) async {
    emit(ExamPageLoading());
    var result = await getQuestionsUseCase.invoke(examId, token);

    switch (result) {
      case Success<List<QuestionsDto>>():
        emit(ExamPageLoaded(questions: result.data));
      case Failure<List<QuestionsDto>>():
        emit(
          ExamPageError(message: result.exception.message ?? "Unknown Error"),
        );
    }
  }
}
