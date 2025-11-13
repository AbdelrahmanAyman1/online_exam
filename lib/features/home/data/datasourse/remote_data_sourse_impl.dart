import 'package:injectable/injectable.dart';
import 'package:online_exam/core/api/api_client.dart';
import 'package:online_exam/core/api/execute_api.dart';
import 'package:online_exam/core/api/result.dart';
import 'package:online_exam/features/home/data/datasourse/remote_data_sourse.dart';
import 'package:online_exam/features/home/data/mapper/mapper_extenstion.dart';
import 'package:online_exam/features/home/domain/entity/exams_entity.dart';

@LazySingleton(as: RemoteDataSourse)
class RemoteDataSourseImpl implements RemoteDataSourse {
  final ApiClient _apiClient;
  RemoteDataSourseImpl(this._apiClient);

  @override
  Future<Result<List<ExamsEntity>>> getAllExamBySubject(String subject) {
    return excuteApi<List<ExamsEntity>>(() async {
      var response = await _apiClient.getAllExamBySubject(subject);
      return response.exams?.map((exam) => exam.toEntity()).toList() ?? [];
    });
  }
}
