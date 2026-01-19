import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:online_exam/core/api/result.dart';
import 'package:online_exam/core/error/custom_error.dart';
import 'package:online_exam/features/home/data/datasourse/remote_data_sourse.dart';
import 'package:online_exam/features/home/data/repo/exam_on_subject_repo_impl.dart';
import 'package:online_exam/features/home/domain/entity/exams_entity.dart';
import 'package:online_exam/features/home/domain/repo/get_exam_on_subject_repo.dart';

import 'exam_on_subject_repo_impl_test.mocks.dart';

@GenerateMocks([RemoteDataSource])
void main() {
  late RemoteDataSource mockDataSourse;
  late HomeRepo examRepo;

  setUp(() {
    mockDataSourse = MockRemoteDataSource();
    examRepo = HomeRepoImpl(mockDataSourse);
  });
  test(
    'should return list of exam entity when get all exam by subject in repo impl  is successfuly',
    () async {
      String tSubject = "subject";
      List<ExamsEntity> tExamEntity = [
        ExamsEntity(id: "1"),
        ExamsEntity(id: "2"),
      ];
      var successResponse = Success(tExamEntity);
      provideDummy<Result<List<ExamsEntity>>>(successResponse);
      when(
        mockDataSourse.getAllExamBySubject(tSubject),
      ).thenAnswer((_) async => successResponse);
      //act
      var result =
          await examRepo.getAllExamBySubject(tSubject)
              as Success<List<ExamsEntity>>;
      //assert
      expect(result, isA<Success<List<ExamsEntity>>>());
      expect(result.data[0], tExamEntity[0]);
      expect(result.data[0].id, tExamEntity[0].id);
    },
  );
  test(
    'should return exception when get all exam by subject in repo impl  is failed',
    () async {
      String tSubject = "subject";
      var tError = CustomError("error");
      var failureResponse = Failure<List<ExamsEntity>>(tError);
      provideDummy<Result<List<ExamsEntity>>>(failureResponse);
      when(
        mockDataSourse.getAllExamBySubject(tSubject),
      ).thenAnswer((_) async => failureResponse);
      //act
      var result =
          await examRepo.getAllExamBySubject(tSubject)
              as Failure<List<ExamsEntity>>;
      //assert
      expect(result, isA<Failure<List<ExamsEntity>>>());
      expect(result.exception, tError);
      expect(result.exception.message, equals("error"));
    },
  );
}
