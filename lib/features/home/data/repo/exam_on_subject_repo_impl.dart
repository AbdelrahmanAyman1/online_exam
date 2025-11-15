import 'package:injectable/injectable.dart';
import 'package:online_exam/core/api/result.dart';
import 'package:online_exam/features/home/data/datasourse/remote_data_sourse.dart';
import 'package:online_exam/features/home/domain/entity/exams_entity.dart';
import 'package:online_exam/features/home/domain/repo/get_exam_on_subject_repo.dart';

@LazySingleton(as: ExamRepo)
class ExamOnSubjectRepoImpl implements ExamRepo {
  final RemoteDataSourse _remoteDataSourse;
  ExamOnSubjectRepoImpl(this._remoteDataSourse);

  @override
  Future<Result<List<ExamsEntity>>> getAllExamBySubject(String subject) async {
    var result = await _remoteDataSourse.getAllExamBySubject(subject);
    return result;
  }
}
