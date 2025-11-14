import 'package:injectable/injectable.dart';
import 'package:online_exam/core/api/api_client.dart';
import 'package:online_exam/core/api/execute_api.dart';
import 'package:online_exam/core/api/result.dart';
import 'package:online_exam/core/error/handle_exception%20.dart';
import 'package:online_exam/features/questions/data/data_source/questions_data_source.dart';
import 'package:online_exam/features/questions/data/model/questions_dto.dart';

@Injectable(as: QuestionsDataSource)
class QuestionsDataSourceImpl implements QuestionsDataSource {
  ApiClient apiClient;
  QuestionsDataSourceImpl(this.apiClient);
  @override
  Future<Result<List<QuestionsDto>>> getQuestions(
    String examId,
    String token,
  ) async {
    try {
      return executeApi<List<QuestionsDto>>(() async {
        return await apiClient.getQuestions(examId, token);
      });
    } on Exception catch (e) {
      throw HandleException.handleCatchError(e);
    }
  }
}
