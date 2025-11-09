import 'package:injectable/injectable.dart';
import 'package:online_exam/core/api/result.dart';
import 'package:online_exam/features/auth/data/model/reset_password_request.dart';
import 'package:online_exam/features/auth/domain/repo/auth_repo.dart';

import '../model/sign_up_response_model.dart';


@lazySingleton
class ResetPasswordUseCase {
  AuthRepo authRepo;
  ResetPasswordUseCase(this.authRepo);

  Future<Result<AuthResponseModel>> invoke(
    ResetPasswordRequest resetPasswordRequest,
  ) async => await authRepo.resetPassword(resetPasswordRequest);
}
