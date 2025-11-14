import 'package:dio/dio.dart';
import 'package:online_exam/core/constant/constants.dart';
import 'package:online_exam/features/auth/data/model/forget_password_request_model.dart';
import 'package:online_exam/features/auth/data/model/login_request_model.dart';
import 'package:online_exam/features/auth/data/model/reset_password_request.dart';
import 'package:online_exam/features/auth/data/model/sign_up_request.dart';
import 'package:online_exam/features/auth/data/model/verify_reset_code_request_model.dart';
import 'package:online_exam/features/questions/data/model/questions_dto.dart';
import 'package:online_exam/features/questions/data/model/questions_response.dart';
import 'package:retrofit/retrofit.dart';
import 'package:online_exam/features/auth/data/model/sign_up_response_dto.dart';
part 'api_client.g.dart';

@RestApi(baseUrl: '')
abstract class ApiClient {
  factory ApiClient(Dio dio, {String? baseUrl}) = _ApiClient;

  @POST(EndPoints.signUp)
  Future<SignUpResponseDto> signUp(
    @Body() SignUpRequestModel signUpRequestModel,
  );

  @POST(EndPoints.signIn)
  Future<SignUpResponseDto> signIn(@Body() LoginRequestModel loginRequestModel);

  @POST(EndPoints.forgetPassword)
  Future<SignUpResponseDto> forgetPassword(
    @Body() ForgetPasswordRequestModel forgetPasswordRequestModel,
  );

  @POST(EndPoints.verifyResetCode)
  Future<SignUpResponseDto> verifyResetCode(
    @Body() VerifyResetCodeRequestModel verifyResetCodeRequestModel,
  );

  @PUT(EndPoints.resetPassword)
  Future<SignUpResponseDto> resetPassword(
    @Body() ResetPasswordRequest resetPasswordRequest,
  );

  @GET(EndPoints.getQuestions)
  Future<List<QuestionsDto>> getQuestions(
    @Query("exam") @Header("token") String examId,
    String token,
  );
}
