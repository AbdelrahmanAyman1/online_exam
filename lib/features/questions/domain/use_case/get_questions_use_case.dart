import 'package:injectable/injectable.dart';
import 'package:online_exam/core/api/result.dart';
import 'package:online_exam/features/questions/data/model/questions_response.dart';
import 'package:online_exam/features/questions/domain/repo/exam_page_repo.dart';

@injectable
class GetQuestionsUseCase {
  ExamPageRepo examPageRepo;
  GetQuestionsUseCase(this.examPageRepo);

  Future<Result<QuestionsResponse>> invoke(String examId) =>
      examPageRepo.getQuestions(examId);
}
