import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:online_exam/core/api/result.dart';
import 'package:online_exam/core/error/custom_error.dart';
import 'package:online_exam/features/auth/data/model/sign_up_response_dto.dart';
import 'package:online_exam/features/auth/domain/model/sign_up_response_model.dart';
import 'package:online_exam/features/profile/data/datasourse/remote_profile_data_sourse.dart';
import 'package:online_exam/features/profile/data/model/change_password_request.dart';
import 'package:online_exam/features/profile/data/model/update_request_dto.dart';
import 'package:online_exam/features/profile/data/model/user_info_dto.dart';
import 'package:online_exam/features/profile/data/repo/profile_repo_impl.dart';
import 'package:online_exam/features/profile/domain/entity/user_info_entity.dart';
import 'package:online_exam/features/profile/domain/repo/profile_repo.dart';

import 'profile_repo_impl_test.mocks.dart';

@GenerateMocks([RemoteProfileDataSourse])
void main() {
  late ProfileRepo _profileRepo;
  late RemoteProfileDataSourse _mockDataSourse;

  setUp(() {
    _mockDataSourse = MockRemoteProfileDataSourse();
    _profileRepo = ProfileRepoImpl(_mockDataSourse);
  });

  group("test repo getUserInfo ", () {
    test("should return success when getUserInfo call ", () async {
      var tDto = UserInfoDto();
      var successResponse = Success(tDto);
      provideDummy<Result<UserInfoDto>>(successResponse);
      when(
        _mockDataSourse.getUserInfo(),
      ).thenAnswer((_) async => successResponse);
      //act
      var result = await _profileRepo.getUserInfo();
      //assert
      expect(result, isA<Success<UserInfoEntity>>());
    });
    test("should return error when getUserInfo call ", () async {
      var tException = CustomError("error");
      var errorResponse = Failure<UserInfoDto>(tException);
      provideDummy<Result<UserInfoDto>>(errorResponse);
      when(
        _mockDataSourse.getUserInfo(),
      ).thenAnswer((_) async => errorResponse);
      //act
      var result = await _profileRepo.getUserInfo();
      //assert
      expect(result, isA<Failure<UserInfoEntity>>());
    });
  });
  group("test repo  changeInfoProfile ", () {
    test("test should return pass when change  success", () async {
      //arrange

      //InRequest
      UserEntity tEntity = UserEntity(email: "omar@gmail.com");
      UpdateUserModel tModel = UpdateUserModel(email: "omar@gmail.com");
      //InResponse
      UserInfoDto tDto = UserInfoDto();
      var successResponse = Success(tDto);
      provideDummy<Result<UserInfoDto>>(successResponse);
      when(
        _mockDataSourse.editUserInfo(tModel),
      ).thenAnswer((_) async => successResponse);

      //act
      var result = await _profileRepo.editUserInfo(tEntity);

      //assert

      expect(result, isA<Success<UserInfoEntity>>());
    });
    test("test should return fail when change  failure", () async {
      //arrange

      //InRequest
      UserEntity tEntity = UserEntity(email: "omar@gmail.com");
      UpdateUserModel tModel = UpdateUserModel(email: "omar@gmail.com");

      var failureResponse = Failure<UserInfoDto>(CustomError("error"));
      provideDummy<Result<UserInfoDto>>(failureResponse);
      when(
        _mockDataSourse.editUserInfo(tModel),
      ).thenAnswer((_) async => failureResponse);

      //act
      var result = await _profileRepo.editUserInfo(tEntity);

      //assert

      expect(result, isA<Failure<UserInfoEntity>>());
    });
  });
  group("test repo  changePassword  ", () {
    test("test should return pass when changePassword  success", () async {
      var toldPassword = "omar@123";
      var tnewPassword = "omar@1234";
      ChangePasswordRequest req = ChangePasswordRequest(
        oldPassword: toldPassword,
        password: tnewPassword,
        rePassword: tnewPassword,
      );
      var tdto = SignUpResponseDto();
      var successResponse = Success<SignUpResponseDto>(tdto);
      provideDummy<Result<SignUpResponseDto>>(successResponse);
      when(
        _mockDataSourse.changePassword(req),
      ).thenAnswer((_) async => successResponse);
      //act
      var result = await _profileRepo.changePassword(
        toldPassword,
        tnewPassword,
        tnewPassword,
      );

      //assert

      expect(result, isA<Success<AuthResponseModel>>());
    });

    test("test should return fail when changePassword  failure", () async {
      var toldPassword = "omar@123";
      var tnewPassword = "omar@1234";
      ChangePasswordRequest req = ChangePasswordRequest(
        oldPassword: toldPassword,
        password: tnewPassword,
        rePassword: tnewPassword,
      );
      var failureResponse = Failure<SignUpResponseDto>(CustomError("error"));
      provideDummy<Result<SignUpResponseDto>>(failureResponse);
      when(
        _mockDataSourse.changePassword(req),
      ).thenAnswer((_) async => failureResponse);
      //act
      var result = await _profileRepo.changePassword(
        toldPassword,
        tnewPassword,
        tnewPassword,
      );

      //assert

      expect(result, isA<Failure<AuthResponseModel>>());
    });
  });
}
