import 'package:injectable/injectable.dart';
import 'package:online_exam/core/api/result.dart';
import 'package:online_exam/features/auth/data/datasourse/online_data_sourse.dart';
import 'package:online_exam/features/auth/data/model/forget_password_request_model.dart';
import 'package:online_exam/features/auth/data/model/login_request_model.dart';
import 'package:online_exam/features/auth/data/model/reset_password_request.dart';
import 'package:online_exam/features/auth/data/model/sign_up_request.dart';
import 'package:online_exam/features/auth/data/model/verify_reset_code_request_model.dart';
import 'package:online_exam/features/auth/domain/model/sign_up_response_model.dart';
import 'package:online_exam/features/auth/domain/repo/auth_repo.dart';

@LazySingleton(as: AuthRepo)
class AuthRepoImp implements AuthRepo {
  final OnLineDataSoures _dataSourse;

  AuthRepoImp(this._dataSourse);

  @override
  Future<Result<AuthResponseModel>> signUp(
    SignUpRequestModel signUpRequestModel,
  ) async => await _dataSourse.signUp(signUpRequestModel);

  @override
  Future<Result<AuthResponseModel>> signIn(
    LoginRequestModel loginRequestModel,
  ) async {
    return await _dataSourse.signIn(loginRequestModel);
  }

  @override
  Future<Result<AuthResponseModel>> forgotPassword(
    ForgetPasswordRequestModel forgetPasswordRequestModel,
  ) async {
    return await _dataSourse.forgetPassword(forgetPasswordRequestModel);
  }

  @override
  Future<Result<AuthResponseModel>> verifyResetCode(
    VerifyResetCodeRequestModel verifyResetCodeRequestModel,
  ) async => await _dataSourse.verifyResetCode(verifyResetCodeRequestModel);

  @override
  Future<Result<AuthResponseModel>> resetPassword(
    ResetPasswordRequest resetPasswordRequest,
  ) async {
    return await _dataSourse.resetPassword(resetPasswordRequest);
  }
}
