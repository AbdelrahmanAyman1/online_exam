import 'package:injectable/injectable.dart';
import 'package:online_exam/core/api/result.dart';
import 'package:online_exam/features/auth/data/model/verify_reset_code_request_model.dart';
import 'package:online_exam/features/auth/domain/model/sign_up_response_model.dart';
import 'package:online_exam/features/auth/domain/repo/auth_repo.dart';

@lazySingleton
class VerifyResetCodeUseCase {
  final AuthRepo authRepo;
  VerifyResetCodeUseCase(this.authRepo);

  Future<Result<AuthResponseModel>> invoke(
    VerifyResetCodeRequestModel verifyResetCodeRequestModel,
  ) async => await authRepo.verifyResetCode(verifyResetCodeRequestModel);
}
