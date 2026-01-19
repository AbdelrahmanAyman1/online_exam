import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:online_exam/core/api/result.dart';
import 'package:online_exam/core/error/custom_error.dart';
import 'package:online_exam/features/profile/domain/entity/user_info_entity.dart';
import 'package:online_exam/features/profile/domain/repo/profile_repo.dart';
import 'package:online_exam/features/profile/domain/usecase/edit_user_profile_info_usecase.dart';

import 'edit_user_profile_info_usecase_test.mocks.dart';

@GenerateMocks([ProfileRepo])
void main() {
  late EditProfileInfoUcecase editProfileInfoUcecase;
  late ProfileRepo mockProfileRepo;

  setUp(() {
    mockProfileRepo = MockProfileRepo();
    editProfileInfoUcecase = EditProfileInfoUcecase(mockProfileRepo);
  });

  group("test EditProfileInfoUcecase", () {
    test("should return success when editUserInfo is called successfully",
        () async {
      // arrange
      UserEntity tEntity = UserEntity(
        email: "omar@gmail.com",
        firstName: "Omar",
        lastName: "Ahmed",
        phoneNumber: "123456789",
        userName: "omar_ahmed",
      );

      UserInfoEntity tResponseEntity = UserInfoEntity();
      var successResponse = Success<UserInfoEntity>(tResponseEntity);
      provideDummy<Result<UserInfoEntity>>(successResponse);

      when(
        mockProfileRepo.editUserInfo(tEntity),
      ).thenAnswer((_) async => successResponse);

      // act
      var result = await editProfileInfoUcecase.call(tEntity);

      // assert
      expect(result, isA<Success<UserInfoEntity>>());
      verify(mockProfileRepo.editUserInfo(tEntity)).called(1);
    });

    test("should return failure when editUserInfo fails", () async {
      // arrange
      UserEntity tEntity = UserEntity(
        email: "omar@gmail.com",
        firstName: "Omar",
        lastName: "Ahmed",
        phoneNumber: "123456789",
        userName: "omar_ahmed",
      );

      var tException = CustomError("Failed to update user info");
      var failureResponse = Failure<UserInfoEntity>(tException);
      provideDummy<Result<UserInfoEntity>>(failureResponse);

      when(
        mockProfileRepo.editUserInfo(tEntity),
      ).thenAnswer((_) async => failureResponse);

      // act
      var result = await editProfileInfoUcecase.call(tEntity);

      // assert
      expect(result, isA<Failure<UserInfoEntity>>());
      verify(mockProfileRepo.editUserInfo(tEntity)).called(1);
    });
  });
}
