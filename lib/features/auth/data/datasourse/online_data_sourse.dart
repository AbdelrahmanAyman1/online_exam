import 'package:online_exam/core/api/result.dart';
import 'package:online_exam/features/auth/data/model/forget_password_request_model.dart';
import 'package:online_exam/features/auth/data/model/login_request_model.dart';
import 'package:online_exam/features/auth/data/model/reset_password_request.dart';
import 'package:online_exam/features/auth/data/model/sign_up_request.dart';
import 'package:online_exam/features/auth/data/model/verify_reset_code_request_model.dart';
import 'package:online_exam/features/auth/domain/model/sign_up_response_model.dart';

abstract class OnLineDataSoures {
  Future<Result<AuthResponseModel>> signUp(
    SignUpRequestModel singUpRequestModel,
  );

  Future<Result<AuthResponseModel>> signIn(LoginRequestModel loginRequestModel);

  Future<Result<AuthResponseModel>> forgetPassword(
    ForgetPasswordRequestModel forgetPasswordRequestModel,
  );

  Future<Result<AuthResponseModel>> verifyResetCode(
    VerifyResetCodeRequestModel verifyResetCodeRequestModel,
  );
  Future<Result<AuthResponseModel>> resetPassword(
    ResetPasswordRequest resetPasswordRequest,
  );
}
