import 'package:online_exam/core/api/result.dart';
import 'package:online_exam/features/questions/data/model/check_questions_request.dart';
import 'package:online_exam/features/questions/data/model/check_questions_response.dart';
import 'package:online_exam/features/questions/data/model/questions_response.dart';

abstract class ExamPageRepo {
  Future<Result<QuestionsResponse>> getQuestions(String examId);

  Future<Result<CheckQuestionsResponse>> checkQuestions(
    CheckQuestionsRequest checkQuestionsRequest,
  );
}
