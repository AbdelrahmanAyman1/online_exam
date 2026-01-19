import 'package:online_exam/core/utils/result.dart';

import '../model/subject_model.dart';

abstract class HomeRemoteDataSource {
  Future<Result<List<SubjectModel>>> getAllSubjects(String token);
}
