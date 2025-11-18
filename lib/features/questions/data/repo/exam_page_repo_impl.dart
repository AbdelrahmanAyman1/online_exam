import 'package:injectable/injectable.dart';
import 'package:online_exam/core/api/result.dart';
import 'package:online_exam/features/questions/data/data_source/questions_data_source.dart';
import 'package:online_exam/features/questions/data/model/check_questions_request.dart';
import 'package:online_exam/features/questions/data/model/check_questions_response.dart';
import 'package:online_exam/features/questions/data/model/questions_response.dart';
import 'package:online_exam/features/questions/domain/repo/exam_page_repo.dart';

@Injectable(as: ExamPageRepo)
class ExamPageRepoImpl implements ExamPageRepo {
  QuestionsDataSource questionsDataSource;
  ExamPageRepoImpl(this.questionsDataSource);

  @override
  Future<Result<QuestionsResponse>> getQuestions(String examId) async {
    return await questionsDataSource.getQuestions(examId);
  }

  @override
  Future<Result<CheckQuestionsResponse>> checkQuestions(
    CheckQuestionsRequest checkQuestionsRequest,
  ) {
    return questionsDataSource.checkQuestions(checkQuestionsRequest);
  }
}
