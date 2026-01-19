import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:online_exam/core/api/result.dart';
import 'package:online_exam/core/error/custom_error.dart';
import 'package:online_exam/features/auth/domain/model/sign_up_response_model.dart';
import 'package:online_exam/features/profile/domain/repo/profile_repo.dart';
import 'package:online_exam/features/profile/domain/usecase/change_password_usecase.dart';

import 'change_password_usecase_test.mocks.dart';

@GenerateMocks([ProfileRepo])
void main() {
  late ChangePasswordUseCase changePasswordUseCase;
  late ProfileRepo mockProfileRepo;

  setUp(() {
    mockProfileRepo = MockProfileRepo();
    changePasswordUseCase = ChangePasswordUseCase(mockProfileRepo);
  });

  group("test ChangePasswordUseCase", () {
    test(
      "should return success when changePassword is called successfully",
      () async {
        // arrange
        const String tOldPassword = "omar@123";
        const String tNewPassword = "omar@1234";
        const String tRePassword = "omar@1234";

        var tResponseModel = AuthResponseModel();
        var successResponse = Success<AuthResponseModel>(tResponseModel);
        provideDummy<Result<AuthResponseModel>>(successResponse);

        when(
          mockProfileRepo.changePassword(
            tOldPassword,
            tNewPassword,
            tRePassword,
          ),
        ).thenAnswer((_) async => successResponse);

        // act
        var result = await changePasswordUseCase.call(
          tOldPassword,
          tNewPassword,
          tRePassword,
        );

        // assert
        expect(result, isA<Success<AuthResponseModel>>());
      },
    );

    test("should return failure when changePassword fails", () async {
      // arrange
      const String tOldPassword = "omar@123";
      const String tNewPassword = "omar@1234";
      const String tRePassword = "omar@1234";

      var tException = CustomError("Invalid password");
      var failureResponse = Failure<AuthResponseModel>(tException);
      provideDummy<Result<AuthResponseModel>>(failureResponse);

      when(
        mockProfileRepo.changePassword(tOldPassword, tNewPassword, tRePassword),
      ).thenAnswer((_) async => failureResponse);

      // act
      var result = await changePasswordUseCase.call(
        tOldPassword,
        tNewPassword,
        tRePassword,
      );

      // assert
      expect(result, isA<Failure<AuthResponseModel>>());
    });
  });
}
