import 'package:injectable/injectable.dart';
import 'package:online_exam/core/api/api_client.dart';
import 'package:online_exam/core/api/execute_api.dart';
import 'package:online_exam/core/api/result.dart';
import 'package:online_exam/features/home/data/datasourse/remote_data_sourse.dart';
import 'package:online_exam/features/home/data/mapper/mapper_extenstion.dart';
import 'package:online_exam/features/home/domain/entity/exams_entity.dart';
import 'package:online_exam/features/home/domain/entity/subjects_model.dart';

@LazySingleton(as: RemoteDataSource)
class RemoteDataSourseImpl implements RemoteDataSource {
  final ApiClient _apiClient;
  RemoteDataSourseImpl(this._apiClient);

  @override
  Future<Result<List<ExamsEntity>>> getAllExamBySubject(String subject) {
    return executeApi<List<ExamsEntity>>(() async {
      var response = await _apiClient.getAllExamBySubject(subject);
      return response.exams?.map((exam) => exam.toEntity()).toList() ?? [];
    });
  }

  @override
  Future<Result<List<SubjectsModel>>> getAllExams() {
    return executeApi<List<SubjectsModel>>(() async {
      var response = await _apiClient.getAllSubjects();
      return response.subjects?.map((subject) => subject.toModel()).toList() ??
          [];
    });
  }
}
