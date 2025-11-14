import 'package:online_exam/core/api/result.dart';
import 'package:online_exam/features/questions/data/model/questions_dto.dart';

abstract class ExamPageRepo {
  Future<Result<List<QuestionsDto>>> getQuestions(String examId, String token);
}
