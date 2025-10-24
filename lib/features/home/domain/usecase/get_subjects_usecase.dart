import 'package:online_exam/core/utils/result.dart';
import 'package:online_exam/features/home/domain/entities/subject_entity.dart';
import 'package:online_exam/features/home/domain/repo/home_repo.dart';

class GetSubjectsUseCase {
  final HomeRepo repo;

  GetSubjectsUseCase(this.repo);

  Future<Result<List<SubjectEntity>>> call() async {
    return await repo.getSubjects();
  }
}
