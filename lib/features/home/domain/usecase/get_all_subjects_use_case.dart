import 'package:injectable/injectable.dart';
import 'package:online_exam/core/api/result.dart';
import 'package:online_exam/features/home/domain/entity/subjects_model.dart';
import 'package:online_exam/features/home/domain/repo/get_exam_on_subject_repo.dart';

@injectable
class GetAllSubjectsUseCase {
  HomeRepo examRepo;
  GetAllSubjectsUseCase(this.examRepo);

  Future<Result<List<SubjectsModel>>> inVoke() => examRepo.getAllSubjects();
}
