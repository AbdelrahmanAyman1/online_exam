import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:online_exam/core/api/api_client.dart';
import 'package:online_exam/core/api/result.dart';
import 'package:online_exam/core/error/custom_error.dart';
import 'package:online_exam/features/home/data/datasourse/remote_data_sourse.dart';
import 'package:online_exam/features/home/data/datasourse/remote_data_sourse_impl.dart';
import 'package:online_exam/features/home/data/mapper/mapper_extenstion.dart';
import 'package:online_exam/features/home/data/model/exam_model_dto.dart';
import 'package:online_exam/features/home/domain/entity/exams_entity.dart';

import 'remote_data_sourse_impl_test.mocks.dart';

@GenerateMocks([ApiClient])
void main() {
  late RemoteDataSourse remoteDataSourse;
  late ApiClient mockApiClient;
  setUp(() {
    mockApiClient = MockApiClient();
    remoteDataSourse = RemoteDataSourseImpl(mockApiClient);
  });
  test(
    'should return list of exam entity when api call  is successfuly',
    () async {
      //arrange
      String tSubject = "subject1";
      var listOfExamModel = [ExamsModel(id: "1"), ExamsModel(id: "2")];
      ExamsResponseModelDto tDto1 = ExamsResponseModelDto(
        message: "1",
        exams: listOfExamModel,
      );

      var listOfExam = tDto1.exams?.map((e) => e.toEntity()).toList() ?? [];
      when(mockApiClient.getAllExamBySubject(tSubject)).thenAnswer((_) {
        return Future.value(tDto1);
      });

      //act
      var result =
          await remoteDataSourse.getAllExamBySubject(tSubject)
              as Success<List<ExamsEntity>>;
      //assert
      expect(result, isA<Success>());
      expect(result.data, listOfExam);
      expect(result.data[0], listOfExam[0]);
    },
  );
  test('should return list of exam entity when api call  is successfuly but list is null',
    () async {
      //arrange
      String tSubject = "subject1";
      ExamsResponseModelDto tDto1 = ExamsResponseModelDto(
        message: "1",
        exams: null,
      );
      when(mockApiClient.getAllExamBySubject(tSubject)).thenAnswer((_) {
        return Future.value(tDto1);
      });

      var result =
          await remoteDataSourse.getAllExamBySubject(tSubject)
              as Success<List<ExamsEntity>>;

      // assert
      expect(result, isA<Success>());
      expect(result.data, []);
    },
  );

  test('should return exception  when api call  is failed', () async {
    //arrange
    String tSubject = "subject1";
    var tFailure = UnKnownErrer("connection is failed");

    when(mockApiClient.getAllExamBySubject(tSubject)).thenThrow(tFailure);

    //act
    var result =
        await remoteDataSourse.getAllExamBySubject(tSubject) as Failure;
    //assert
    expect(result, isA<Failure>());
    expect(result.exception, tFailure);
    expect(result.exception.message, tFailure.message);
  });
}
