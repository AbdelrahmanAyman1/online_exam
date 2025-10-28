import 'package:dio/dio.dart';
import 'package:online_exam/features/auth/data/model/forget_password_request_model.dart';
import 'package:online_exam/features/auth/data/model/login_request_model.dart';
import 'package:online_exam/features/auth/data/model/reset_password_request.dart';
import 'package:online_exam/features/auth/data/model/sign_up_request.dart';
import 'package:online_exam/features/auth/data/model/verify_reset_code_request_model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:online_exam/features/auth/data/model/sign_up_response_dto.dart';
part 'api_client.g.dart';

@RestApi(baseUrl: 'https://exam.elevateegy.com/api/v1/')
abstract class ApiClient {
  factory ApiClient(Dio dio, {String? baseUrl}) = _ApiClient;

  @POST('auth/signup')
  Future<SignUpResponseDto> signUp(
    @Body() SignUpRequestModel signUpRequestModel,
  );

  @POST('auth/signin')
  Future<SignUpResponseDto> signIn(@Body() LoginRequestModel loginRequestModel);

  @POST('auth/forgotPassword')
  Future<SignUpResponseDto> forgetPassword(
    @Body() ForgetPasswordRequestModel forgetPasswordRequestModel,
  );

  @POST('auth/verifyResetCode')
  Future<SignUpResponseDto> verifyResetCode(
    @Body() VerifyResetCodeRequestModel verifyResetCodeRequestModel,
  );

  @PUT('auth/resetPassword')
  Future<SignUpResponseDto> resetPassword(
    @Body() ResetPasswordRequest resetPasswordRequest,
  );
}
