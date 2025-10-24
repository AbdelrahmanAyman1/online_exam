import 'package:injectable/injectable.dart';
import 'package:online_exam/core/utils/result.dart';
import 'package:online_exam/features/auth/data/model/sign_up_request.dart';
import 'package:online_exam/features/auth/domain/model/sign_up_response_model.dart';
import 'package:online_exam/features/auth/domain/repo/auth_repo.dart';

@injectable
class SignUpUsecase {
  final AuthRepo _authRepo;
  SignUpUsecase(this._authRepo);
  Future<Result<AuthResponseModel>> invoke(
    SignUpRequestModel signUpRequest,
  ) async => await _authRepo.signUp(signUpRequest);
}
