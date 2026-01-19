import 'package:online_exam/core/utils/result.dart';
import '../../../auth/api/api_client.dart';
import '../model/subject_model.dart';
import 'home_data_source.dart';

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final ApiClient apiClient;

  HomeRemoteDataSourceImpl(this.apiClient);

  @override
  Future<Result<List<SubjectModel>>> getAllSubjects(String token) async {
    try {
      final subjects = await apiClient.getAllSubjects(token);

      return Result.success(subjects);
    } catch (e) {
      return Result.failure(Exception(e.toString()));
    }
  }
}