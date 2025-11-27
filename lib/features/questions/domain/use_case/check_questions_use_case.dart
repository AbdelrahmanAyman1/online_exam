import 'package:injectable/injectable.dart';
import 'package:online_exam/core/api/result.dart';
import 'package:online_exam/features/questions/data/model/check_questions_request.dart';
import 'package:online_exam/features/questions/data/model/check_questions_response.dart';
import 'package:online_exam/features/questions/domain/repo/exam_page_repo.dart';

@injectable
class CheckQuestionsUseCase {
  ExamPageRepo examPageRepo;

  CheckQuestionsUseCase(this.examPageRepo);

  Future<Result<CheckQuestionsResponse>> invoke(
    CheckQuestionsRequest checkQuestionsRequest,
  ) => examPageRepo.checkQuestions(checkQuestionsRequest);
}
