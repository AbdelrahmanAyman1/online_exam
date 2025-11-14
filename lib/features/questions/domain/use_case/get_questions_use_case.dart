import 'package:injectable/injectable.dart';
import 'package:online_exam/core/api/result.dart';
import 'package:online_exam/features/questions/data/model/questions_dto.dart';
import 'package:online_exam/features/questions/domain/repo/exam_page_repo.dart';

@injectable
class GetQuestionsUseCase {
  ExamPageRepo examPageRepo;
  GetQuestionsUseCase(this.examPageRepo);

  Future<Result<List<QuestionsDto>>> invoke(String examId, String token) =>
      examPageRepo.getQuestions(examId, token);
}
