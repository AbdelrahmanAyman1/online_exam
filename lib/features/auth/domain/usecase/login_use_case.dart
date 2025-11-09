import 'package:injectable/injectable.dart';
import 'package:online_exam/core/api/result.dart';
import 'package:online_exam/features/auth/data/model/login_request_model.dart';
import 'package:online_exam/features/auth/domain/model/sign_up_response_model.dart';
import 'package:online_exam/features/auth/domain/repo/auth_repo.dart';


@lazySingleton
class LoginUseCase {
  AuthRepo authRepo;
  LoginUseCase(this.authRepo);
  Future<Result<AuthResponseModel>> invoke(
    LoginRequestModel loginRequestModel,
  ) async => await authRepo.signIn(loginRequestModel);
}
