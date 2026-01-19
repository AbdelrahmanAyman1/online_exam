import 'package:online_exam/core/utils/result.dart';
import 'package:online_exam/features/home/domain/entities/subject_entity.dart';

abstract class HomeRepo {
  Future<Result<List<SubjectEntity>>> getSubjects();
}
