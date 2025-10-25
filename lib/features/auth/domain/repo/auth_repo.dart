import 'package:online_exam/core/utils/result.dart';
import 'package:online_exam/features/auth/data/model/forget_password_request_model.dart';
import 'package:online_exam/features/auth/data/model/login_request_model.dart';
import 'package:online_exam/features/auth/data/model/sign_up_request.dart';
import 'package:online_exam/features/auth/data/model/verify_reset_code_request_model.dart';
import 'package:online_exam/features/auth/domain/model/sign_up_response_model.dart';

abstract class AuthRepo {
  Future<Result<AuthResponseModel>> signUp(
    SignUpRequestModel signUpResustModel,
  );

  Future<Result<AuthResponseModel>> signIn(LoginRequestModel loginRequestModel);

  Future<Result<AuthResponseModel>> forgotPassword(
    ForgetPasswordRequestModel forgetPasswordRequestModel,
  );

  Future<Result<AuthResponseModel>> verifyResetCode(
    VerifyResetCodeRequestModel verifyResetCodeRequestModel,
  );
}
