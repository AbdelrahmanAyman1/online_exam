import 'package:injectable/injectable.dart';
import 'package:online_exam/core/api/result.dart';
import 'package:online_exam/features/home/domain/entity/exams_entity.dart';
import 'package:online_exam/features/home/domain/repo/get_exam_on_subject_repo.dart';

@lazySingleton
class GetExamOnSubjectUsecase {
  final HomeRepo _examRepo;
  GetExamOnSubjectUsecase(this._examRepo);

  Future<Result<List<ExamsEntity>>> getAllExamBySubject(String subject) =>
      _examRepo.getAllExamBySubject(subject);
}
