import 'package:online_exam/core/api/result.dart';
import 'package:online_exam/features/home/domain/entity/exams_entity.dart';

abstract class ExamRepo {
  Future<Result<List<ExamsEntity>>> getAllExamBySubject(String subject);
}
