import 'package:online_exam/core/utils/result.dart';
import 'package:online_exam/features/auth/domain/model/sign_up_response_model.dart';
import 'package:online_exam/features/auth/domain/repo/auth_repo.dart';

class ForgetPasswordUseCase {
  AuthRepo authRepo;
  ForgetPasswordUseCase(this.authRepo);
  Future<Result<AuthResponseModel>> forgetPassword(String email) async =>
      await authRepo.forgotPassword(email);
}
