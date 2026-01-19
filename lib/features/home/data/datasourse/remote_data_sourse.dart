import 'package:online_exam/core/api/result.dart';
import 'package:online_exam/features/home/domain/entity/exams_entity.dart';
import 'package:online_exam/features/home/domain/entity/subjects_model.dart';

abstract class RemoteDataSource {
  Future<Result<List<ExamsEntity>>> getAllExamBySubject(String subject);
  Future<Result<List<SubjectsModel>>> getAllExams();
}
