import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:online_exam/core/api/result.dart';
import 'package:online_exam/core/error/custom_error.dart';
import 'package:online_exam/features/home/domain/entity/exams_entity.dart';
import 'package:online_exam/features/home/domain/repo/get_exam_on_subject_repo.dart';
import 'package:online_exam/features/home/domain/usecase/get_exam_on_subject_usecase.dart';

import 'get_exam_on_subject_usecase_test.mocks.dart';

@GenerateMocks([HomeRepo])
void main() {
  late HomeRepo mockExamRepo;
  late GetExamOnSubjectUsecase getExamUsecase;
  setUp(() {
    mockExamRepo = MockExamRepo();
    getExamUsecase = GetExamOnSubjectUsecase(mockExamRepo);
  });
  test(
    'should return list of entity when get all exam by subject in use case   is successful',
    () async {
      //arrange
      String tSubject = "subject";
      List<ExamsEntity> tExamEntity = [
        ExamsEntity(id: "1"),
        ExamsEntity(id: "2"),
      ];
      var successResponse = Success(tExamEntity);
      provideDummy<Result<List<ExamsEntity>>>(successResponse);

      when(
        mockExamRepo.getAllExamBySubject(tSubject),
      ).thenAnswer((_) async => successResponse);
      //act
      var result =
          await getExamUsecase.getAllExamBySubject(tSubject)
              as Success<List<ExamsEntity>>;
      //assert
      expect(result, isA<Success>());
      expect(result.data, tExamEntity);
      expect(result.data[0], tExamEntity[0]);
      expect(result.data[0].id, tExamEntity[0].id);
    },
  );
  test(
    'should return exception when get all exam by subject in use case   is failed',
    () async {
      //arrange
      String tSubject = "subject";

      var tError = CustomError("error");
      var failureResponse = Failure<List<ExamsEntity>>(tError);
      provideDummy<Result<List<ExamsEntity>>>(failureResponse);

      when(
        mockExamRepo.getAllExamBySubject(tSubject),
      ).thenAnswer((_) async => failureResponse);
      //act
      var result =
          await getExamUsecase.getAllExamBySubject(tSubject)
              as Failure<List<ExamsEntity>>;
      //assert
      expect(result, isA<Failure>());
      expect(result.exception, tError);
      expect(result.exception.message, equals("error"));
    },
  );
}
