import '../../../../core/utils/result.dart';
import '../../domain/entities/subject_entity.dart';
import '../../domain/repo/home_repo.dart';
import '../data_source/home_data_source.dart';

class HomeRepoImpl implements HomeRepo {
  final HomeRemoteDataSource remoteDataSource;

  HomeRepoImpl(this.remoteDataSource);

  @override
  Future<Result<List<SubjectEntity>>> getSubjects() async {
    final result = await remoteDataSource.getAllSubjects("");

    return result.when(
      success: (subjects) => Result.success(subjects),
      failure: (error) => Result.failure(error),
    );
  }
}
