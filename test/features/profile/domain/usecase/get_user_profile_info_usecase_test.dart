import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:online_exam/core/api/result.dart';
import 'package:online_exam/core/error/custom_error.dart';
import 'package:online_exam/features/profile/domain/entity/user_info_entity.dart';
import 'package:online_exam/features/profile/domain/repo/profile_repo.dart';
import 'package:online_exam/features/profile/domain/usecase/get_user_profile_info_usecase.dart';

import 'get_user_profile_info_usecase_test.mocks.dart';

@GenerateMocks([ProfileRepo])
void main() {
  late GetProfileInfoUcecase getProfileInfoUcecase;
  late ProfileRepo mockProfileRepo;

  setUp(() {
    mockProfileRepo = MockProfileRepo();
    getProfileInfoUcecase = GetProfileInfoUcecase(mockProfileRepo);
  });

  group("test GetProfileInfoUcecase", () {
    test("should return success when getUserInfo is called successfully",
        () async {
      // arrange
      UserInfoEntity tResponseEntity = UserInfoEntity();
      var successResponse = Success<UserInfoEntity>(tResponseEntity);
      provideDummy<Result<UserInfoEntity>>(successResponse);

      when(
        mockProfileRepo.getUserInfo(),
      ).thenAnswer((_) async => successResponse);

      // act
      var result = await getProfileInfoUcecase.call();

      // assert
      expect(result, isA<Success<UserInfoEntity>>());
      verify(mockProfileRepo.getUserInfo()).called(1);
    });

    test("should return failure when getUserInfo fails", () async {
      // arrange
      var tException = CustomError("Failed to fetch user info");
      var failureResponse = Failure<UserInfoEntity>(tException);
      provideDummy<Result<UserInfoEntity>>(failureResponse);

      when(
        mockProfileRepo.getUserInfo(),
      ).thenAnswer((_) async => failureResponse);

      // act
      var result = await getProfileInfoUcecase.call();

      // assert
      expect(result, isA<Failure<UserInfoEntity>>());
      verify(mockProfileRepo.getUserInfo()).called(1);
    });
  });
}
