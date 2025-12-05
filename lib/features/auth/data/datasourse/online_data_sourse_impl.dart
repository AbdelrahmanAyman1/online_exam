import 'package:injectable/injectable.dart';
import 'package:online_exam/core/api/execute_api.dart';
import 'package:online_exam/core/api/result.dart';
import 'package:online_exam/core/api/api_client.dart';
import 'package:online_exam/features/auth/data/datasourse/online_data_sourse.dart';
import 'package:online_exam/features/auth/data/model/forget_password_request_model.dart';
import 'package:online_exam/features/auth/data/model/login_request_model.dart';
import 'package:online_exam/features/auth/data/model/reset_password_request.dart';
import 'package:online_exam/features/auth/data/model/sign_up_request.dart';
import 'package:online_exam/features/auth/data/model/verify_reset_code_request_model.dart';
import 'package:online_exam/features/auth/domain/model/sign_up_response_model.dart';


@LazySingleton(as: OnLineDataSoures)
class OnlineDataSourseImpl implements OnLineDataSoures {
  final ApiClient _apiClient;

  OnlineDataSourseImpl(this._apiClient);

  @override
  Future<Result<AuthResponseModel>> signUp(
    SignUpRequestModel singUpRequestModel,
  ) async {
    return executeApi<AuthResponseModel>(() async {
      var response = await _apiClient.signUp(singUpRequestModel);
      return response.toModel();
    });
  }

  @override
  Future<Result<AuthResponseModel>> signIn(
    LoginRequestModel loginRequestModel,
  ) async {
    return executeApi<AuthResponseModel>(() async {
      var response = await _apiClient.signIn(loginRequestModel);
      return response.toModel();
    });
  }

  @override
  Future<Result<AuthResponseModel>> forgetPassword(
    ForgetPasswordRequestModel forgetPasswordRequestModel,
  ) async {
    return executeApi<AuthResponseModel>(() async {
      var response = await _apiClient.forgetPassword(
        forgetPasswordRequestModel,
      );
      return response.toModel();
    });
  }

  @override
  Future<Result<AuthResponseModel>> verifyResetCode(
    VerifyResetCodeRequestModel verifyResetCodeRequestModel,
  ) async {
    return executeApi<AuthResponseModel>(() async {
      var response = await _apiClient.verifyResetCode(
        verifyResetCodeRequestModel,
      );
      return response.toModel();
    });
  }

  @override
  Future<Result<AuthResponseModel>> resetPassword(
    ResetPasswordRequest resetPasswordRequest,
  ) async {
    return executeApi<AuthResponseModel>(() async {
      var response = await _apiClient.resetPassword(resetPasswordRequest);
      return response.toModel();
    });
  }
}
