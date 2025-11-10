import 'package:injectable/injectable.dart';
import 'package:online_exam/core/api/result.dart';
import 'package:online_exam/features/auth/data/model/forget_password_request_model.dart';
import 'package:online_exam/features/auth/domain/model/sign_up_response_model.dart';
import 'package:online_exam/features/auth/domain/repo/auth_repo.dart';

@lazySingleton
class ForgetPasswordUseCase {
  AuthRepo authRepo;
  ForgetPasswordUseCase(this.authRepo);
  Future<Result<AuthResponseModel>> forgetPassword(
    ForgetPasswordRequestModel forgetPasswordRequestModel,
  ) async => await authRepo.forgotPassword(forgetPasswordRequestModel);
}
