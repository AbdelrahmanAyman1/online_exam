import 'package:injectable/injectable.dart';
import 'package:online_exam/core/api/result.dart';
import 'package:online_exam/features/home/data/datasourse/remote_data_sourse.dart';
import 'package:online_exam/features/home/domain/entity/exams_entity.dart';
import 'package:online_exam/features/home/domain/entity/subjects_model.dart';
import 'package:online_exam/features/home/domain/repo/get_exam_on_subject_repo.dart';

@LazySingleton(as: HomeRepo)
class HomeRepoImpl implements HomeRepo {
  final RemoteDataSource _remoteDataSource;
  HomeRepoImpl(this._remoteDataSource);

  @override
  Future<Result<List<ExamsEntity>>> getAllExamBySubject(String subject) async {
    var result = await _remoteDataSource.getAllExamBySubject(subject);
    return result;
  }

  @override
  Future<Result<List<SubjectsModel>>> getAllSubjects() {
    return _remoteDataSource.getAllExams();
  }
}
